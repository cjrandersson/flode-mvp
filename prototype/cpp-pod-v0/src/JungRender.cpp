#include "flode/JungRender.hpp"

#include <algorithm>
#include <cstdint>
#include <limits>
#include <stdexcept>
#include <utility>
#include <vector>

namespace flode {
namespace {

PodState baselineState() {
    PodState state;
    state.regionStart = 0.0;
    state.regionEnd = 1.0;
    state.speed = 1.0;
    state.pitchCents = 0.0;
    state.volume = 1.0;
    state.pan = 0.0;
    state.fxSend = 0.0;
    state.loop = true;
    return state;
}

void appendPodFrames(PodEngine& pod,
                     StereoFrames& destination,
                     std::size_t frames,
                     double sampleRate) {
    std::vector<float> left(frames);
    std::vector<float> right(frames);
    const auto rendered = pod.process(
        {left.data(), right.data(), nullptr, nullptr}, frames, sampleRate);
    if (rendered != frames) {
        throw std::runtime_error("POD stopped before the master tick boundary");
    }
    destination.left.insert(destination.left.end(), left.begin(), left.end());
    destination.right.insert(destination.right.end(), right.begin(), right.end());
}

} // namespace

JungComparisonRender renderJungComparison(std::shared_ptr<const AudioSource> source,
                                          const JungConfig& config,
                                          std::uint32_t bars) {
    if (!source || source->frameCount() < 2 || source->sampleRate() <= 0.0) {
        throw std::invalid_argument("JUNG render requires a valid audio source");
    }
    if (bars == 0) {
        throw std::invalid_argument("JUNG render length must be at least one bar");
    }

    const MasterClock clock(source->sampleRate(), config.clock);
    if (clock.ticksPerBar() > std::numeric_limits<std::uint64_t>::max() / bars) {
        throw std::overflow_error("JUNG render tick count overflow");
    }
    const auto totalTicks = clock.ticksPerBar() * bars;
    const auto totalFrames = clock.frameAtTick(totalTicks);
    if (totalFrames > std::numeric_limits<std::size_t>::max()) {
        throw std::overflow_error("JUNG render frame count exceeds this platform");
    }

    JungComparisonRender result;
    result.totalTicks = totalTicks;
    result.baseline.left.reserve(static_cast<std::size_t>(totalFrames));
    result.baseline.right.reserve(static_cast<std::size_t>(totalFrames));
    result.jung.left.reserve(static_cast<std::size_t>(totalFrames));
    result.jung.right.reserve(static_cast<std::size_t>(totalFrames));

    PodEngine baselinePod;
    baselinePod.setSource(source);
    baselinePod.setState(baselineState());
    baselinePod.seekFrame(0.0);
    baselinePod.play();

    PodEngine jungPod;
    jungPod.setSource(source);
    jungPod.setState(baselineState());
    jungPod.seekFrame(0.0);
    jungPod.play();

    JungController jung(config);
    const auto sourceFrames = static_cast<std::uint64_t>(source->frameCount());
    double activeSliceStart = 0.0;
    double activeSliceLength = 0.0;

    for (std::uint64_t tick = 0; tick < totalTicks; ++tick) {
        const auto tickStartFrame = clock.frameAtTick(tick);
        const auto tickEndFrame = clock.frameAtTick(tick + 1);
        const auto tickFrames = tickEndFrame - tickStartFrame;
        if (tickFrames == 0 || tickFrames > std::numeric_limits<std::size_t>::max()) {
            throw std::runtime_error("master clock produced an invalid tick length");
        }

        const auto event = jung.onTick(tick);
        if (event.type != JungEventType::None) {
            result.events.push_back(event);
        }

        if (event.type == JungEventType::InterventionStart) {
            const auto sliceEndTick = tick + config.sliceLengthTicks;
            const auto requestedSliceFrames = clock.frameAtTick(sliceEndTick) - tickStartFrame;
            if (requestedSliceFrames == 0 || requestedSliceFrames >= sourceFrames) {
                throw std::runtime_error("JUNG slice does not fit inside the loaded source");
            }

            activeSliceLength = static_cast<double>(requestedSliceFrames);
            activeSliceStart = static_cast<double>(tickStartFrame % sourceFrames);
            if (activeSliceStart + activeSliceLength > static_cast<double>(sourceFrames)) {
                activeSliceStart = static_cast<double>(sourceFrames) - activeSliceLength;
            }

            JungInterventionWindow window;
            window.startTick = tick;
            window.startFrame = tickStartFrame;
            window.sliceStartFrame = activeSliceStart;
            window.sliceLengthFrames = activeSliceLength;
            result.interventions.push_back(window);
        }

        if (event.type == JungEventType::InterventionStart ||
            event.type == JungEventType::InterventionStep) {
            PodState state = baselineState();
            state.regionStart = activeSliceStart / static_cast<double>(sourceFrames);
            state.regionEnd =
                (activeSliceStart + activeSliceLength) / static_cast<double>(sourceFrames);
            state.speed = event.rate;
            jungPod.setState(state);
            jungPod.seekFrame(activeSliceStart);
            jungPod.play();
        } else if (event.type == JungEventType::ReturnHome) {
            if (result.interventions.empty() || result.interventions.back().endTick != 0) {
                throw std::logic_error("JUNG return has no active intervention window");
            }
            result.interventions.back().endTick = tick;
            result.interventions.back().endFrame = tickStartFrame;

            jungPod.setState(baselineState());
            jungPod.seekFrame(static_cast<double>(tickStartFrame % sourceFrames));
            jungPod.play();
        }

        appendPodFrames(baselinePod,
                        result.baseline,
                        static_cast<std::size_t>(tickFrames),
                        source->sampleRate());
        appendPodFrames(jungPod,
                        result.jung,
                        static_cast<std::size_t>(tickFrames),
                        source->sampleRate());
    }

    if (jung.interventionActive()) {
        throw std::runtime_error("JUNG render ended during an intervention");
    }
    if (result.baseline.left.size() != static_cast<std::size_t>(totalFrames) ||
        result.jung.left.size() != result.baseline.left.size()) {
        throw std::logic_error("JUNG comparison render length mismatch");
    }

    return result;
}

} // namespace flode
