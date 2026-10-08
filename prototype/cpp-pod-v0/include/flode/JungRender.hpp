#pragma once

#include "flode/Jung.hpp"
#include "flode/Pod.hpp"

#include <cstdint>
#include <memory>
#include <vector>

namespace flode {

struct StereoFrames {
    std::vector<float> left;
    std::vector<float> right;
};

struct JungInterventionWindow {
    std::uint64_t startTick = 0;
    std::uint64_t endTick = 0;
    std::uint64_t startFrame = 0;
    std::uint64_t endFrame = 0;
    double sliceStartFrame = 0.0;
    double sliceLengthFrames = 0.0;
};

struct JungComparisonRender {
    StereoFrames baseline;
    StereoFrames jung;
    std::vector<JungTickEvent> events;
    std::vector<JungInterventionWindow> interventions;
    std::uint64_t totalTicks = 0;
};

JungComparisonRender renderJungComparison(
    std::shared_ptr<const AudioSource> source,
    const JungConfig& config = {},
    std::uint32_t bars = 8);

} // namespace flode
