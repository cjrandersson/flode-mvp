#include "flode/Jung.hpp"

#include <cmath>
#include <limits>
#include <stdexcept>
#include <utility>

namespace flode {
namespace {

std::uint64_t checkedProduct(std::uint64_t a,
                             std::uint64_t b,
                             const char* description) {
    if (a != 0 && b > std::numeric_limits<std::uint64_t>::max() / a) {
        throw std::invalid_argument(description);
    }
    return a * b;
}

void validateClockConfig(const MasterClockConfig& config) {
    if (!std::isfinite(config.bpm) || config.bpm <= 0.0) {
        throw std::invalid_argument("master BPM must be finite and greater than zero");
    }
    if (config.beatsPerBar == 0 || config.ticksPerBeat == 0) {
        throw std::invalid_argument("master clock divisions must be greater than zero");
    }
}

} // namespace

MasterClock::MasterClock(double sampleRate, MasterClockConfig config)
    : sampleRate_(sampleRate), config_(config) {
    if (!std::isfinite(sampleRate_) || sampleRate_ <= 0.0) {
        throw std::invalid_argument("sample rate must be finite and greater than zero");
    }
    validateClockConfig(config_);
}

std::uint64_t MasterClock::frameAtTick(std::uint64_t tick) const {
    const long double frames =
        static_cast<long double>(tick) * static_cast<long double>(sampleRate_) * 60.0L /
        (static_cast<long double>(config_.bpm) *
         static_cast<long double>(config_.ticksPerBeat));
    if (frames > static_cast<long double>(std::numeric_limits<std::uint64_t>::max())) {
        throw std::overflow_error("master clock frame position overflow");
    }
    return static_cast<std::uint64_t>(std::llround(frames));
}

std::uint64_t MasterClock::ticksPerBar() const noexcept {
    return static_cast<std::uint64_t>(config_.beatsPerBar) * config_.ticksPerBeat;
}

JungController::JungController(JungConfig config)
    : config_(std::move(config)), rngState_(config_.seed) {
    validateClockConfig(config_.clock);
    if (config_.decisionCadenceBars == 0 || config_.interventionDurationTicks == 0 ||
        config_.sliceLengthTicks == 0 || config_.repeatDepth == 0 ||
        config_.cooldownBars == 0) {
        throw std::invalid_argument("JUNG timing and repeat values must be greater than zero");
    }
    if (!std::isfinite(config_.interventionProbability) ||
        config_.interventionProbability < 0.0 || config_.interventionProbability > 1.0) {
        throw std::invalid_argument("JUNG probability must be within 0..1");
    }
    if (config_.repeatDepth != config_.interventionDurationTicks ||
        config_.rateContour.size() != config_.interventionDurationTicks) {
        throw std::invalid_argument(
            "JUNG v0.1 requires one repeat and one rate value per intervention tick");
    }
    for (const double rate : config_.rateContour) {
        if (!std::isfinite(rate) || rate <= 0.0 || rate > 4.0) {
            throw std::invalid_argument("JUNG playback rates must be finite within 0..4");
        }
    }

    const auto ticksPerBar = checkedProduct(config_.clock.beatsPerBar,
                                            config_.clock.ticksPerBeat,
                                            "JUNG ticks per bar overflow");
    decisionCadenceTicks_ = checkedProduct(config_.decisionCadenceBars,
                                           ticksPerBar,
                                           "JUNG decision cadence overflow");
    cooldownTicks_ = checkedProduct(config_.cooldownBars,
                                    ticksPerBar,
                                    "JUNG cooldown overflow");
}

double JungController::nextDecisionRoll() noexcept {
    // SplitMix64 gives a compact, explicitly specified sequence across platforms.
    rngState_ += 0x9e3779b97f4a7c15ULL;
    std::uint64_t mixed = rngState_;
    mixed = (mixed ^ (mixed >> 30U)) * 0xbf58476d1ce4e5b9ULL;
    mixed = (mixed ^ (mixed >> 27U)) * 0x94d049bb133111ebULL;
    mixed ^= mixed >> 31U;
    return static_cast<double>(mixed >> 11U) * (1.0 / 9007199254740992.0);
}

JungTickEvent JungController::onTick(std::uint64_t tick) {
    if (hasProcessedTick_ && tick != lastProcessedTick_ + 1) {
        throw std::invalid_argument("JUNG ticks must be processed once in sequential order");
    }
    hasProcessedTick_ = true;
    lastProcessedTick_ = tick;

    JungTickEvent event;
    event.tick = tick;
    event.rngState = rngState_;

    if (interventionActive_) {
        if (tick == interventionEndTick_) {
            interventionActive_ = false;
            hasCompletedIntervention_ = true;
            lastInterventionEndTick_ = tick;
            ++interventionsCompleted_;
            event.type = JungEventType::ReturnHome;
            return event;
        }

        const auto step = static_cast<std::size_t>(tick - interventionStartTick_);
        if (step >= config_.rateContour.size()) {
            throw std::logic_error("JUNG intervention exceeded its bounded contour");
        }
        event.type = JungEventType::InterventionStep;
        event.interventionStep = step;
        event.rate = config_.rateContour[step];
        return event;
    }

    if (tick == 0 || tick % decisionCadenceTicks_ != 0) {
        return event;
    }

    if (hasCompletedIntervention_ && tick < lastInterventionEndTick_ + cooldownTicks_) {
        event.type = JungEventType::DecisionCooldown;
        return event;
    }

    event.decisionRoll = nextDecisionRoll();
    event.rngState = rngState_;
    if (event.decisionRoll >= config_.interventionProbability) {
        event.type = JungEventType::DecisionHold;
        return event;
    }

    interventionActive_ = true;
    interventionStartTick_ = tick;
    interventionEndTick_ = tick + config_.interventionDurationTicks;
    event.type = JungEventType::InterventionStart;
    event.interventionStep = 0;
    event.rate = config_.rateContour.front();
    return event;
}

} // namespace flode
