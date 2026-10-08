#pragma once

#include <cstddef>
#include <cstdint>
#include <vector>

namespace flode {

struct MasterClockConfig {
    double bpm = 115.0;
    std::uint32_t beatsPerBar = 4;
    std::uint32_t ticksPerBeat = 4; // 16n in 4/4
};

class MasterClock {
public:
    MasterClock(double sampleRate, MasterClockConfig config = {});

    std::uint64_t frameAtTick(std::uint64_t tick) const;
    std::uint64_t ticksPerBar() const noexcept;

    double sampleRate() const noexcept { return sampleRate_; }
    const MasterClockConfig& config() const noexcept { return config_; }

private:
    double sampleRate_ = 0.0;
    MasterClockConfig config_;
};

struct JungConfig {
    MasterClockConfig clock;
    std::uint32_t decisionCadenceBars = 4;
    std::uint32_t interventionDurationTicks = 4;
    std::uint32_t sliceLengthTicks = 1;
    std::uint32_t repeatDepth = 4;
    std::vector<double> rateContour = {1.0, 1.5, 1.5, 1.0};
    double interventionProbability = 0.15;
    std::uint32_t cooldownBars = 4;
    std::uint64_t seed = 42691;
};

enum class JungEventType {
    None,
    DecisionHold,
    DecisionCooldown,
    InterventionStart,
    InterventionStep,
    ReturnHome
};

struct JungTickEvent {
    JungEventType type = JungEventType::None;
    std::uint64_t tick = 0;
    std::size_t interventionStep = 0;
    double rate = 1.0;
    double decisionRoll = -1.0;
    std::uint64_t rngState = 0;
};

class JungController {
public:
    explicit JungController(JungConfig config = {});

    JungTickEvent onTick(std::uint64_t tick);

    const JungConfig& config() const noexcept { return config_; }
    bool interventionActive() const noexcept { return interventionActive_; }
    std::uint64_t interventionsCompleted() const noexcept { return interventionsCompleted_; }
    std::uint64_t decisionCadenceTicks() const noexcept { return decisionCadenceTicks_; }
    std::uint64_t cooldownTicks() const noexcept { return cooldownTicks_; }

private:
    double nextDecisionRoll() noexcept;

    JungConfig config_;
    std::uint64_t decisionCadenceTicks_ = 0;
    std::uint64_t cooldownTicks_ = 0;
    std::uint64_t rngState_ = 0;
    std::uint64_t interventionStartTick_ = 0;
    std::uint64_t interventionEndTick_ = 0;
    std::uint64_t lastInterventionEndTick_ = 0;
    std::uint64_t interventionsCompleted_ = 0;
    std::uint64_t lastProcessedTick_ = 0;
    bool interventionActive_ = false;
    bool hasCompletedIntervention_ = false;
    bool hasProcessedTick_ = false;
};

} // namespace flode
