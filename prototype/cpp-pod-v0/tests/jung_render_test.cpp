#include "flode/JungRender.hpp"

#include <algorithm>
#include <cassert>
#include <cmath>
#include <iostream>
#include <memory>
#include <vector>

namespace {

class TestSource final : public flode::AudioSource {
public:
    TestSource(std::size_t frames, double sampleRate)
        : sampleRate_(sampleRate), samples_(frames) {
        for (std::size_t frame = 0; frame < frames; ++frame) {
            const double phase = static_cast<double>(frame) * 0.017;
            samples_[frame] = static_cast<float>(0.6 * std::sin(phase) +
                                                  0.2 * std::sin(phase * 0.37));
        }
    }

    std::size_t frameCount() const noexcept override { return samples_.size(); }
    int channelCount() const noexcept override { return 1; }
    double sampleRate() const noexcept override { return sampleRate_; }

    float sampleAt(int, double framePosition) const noexcept override {
        framePosition = std::clamp(
            framePosition, 0.0, static_cast<double>(samples_.size() - 1));
        const auto frameA = static_cast<std::size_t>(std::floor(framePosition));
        const auto frameB = std::min(frameA + 1, samples_.size() - 1);
        const auto fraction = static_cast<float>(framePosition - static_cast<double>(frameA));
        return samples_[frameA] + (samples_[frameB] - samples_[frameA]) * fraction;
    }

private:
    double sampleRate_;
    std::vector<float> samples_;
};

} // namespace

int main() {
    auto source = std::make_shared<TestSource>(100003, 44100.0);
    const flode::JungConfig config;
    const flode::MasterClock clock(source->sampleRate(), config.clock);
    const auto rendered = flode::renderJungComparison(source, config, 8);

    assert(rendered.totalTicks == 128);
    assert(rendered.baseline.left.size() == clock.frameAtTick(128));
    assert(rendered.baseline.left.size() == rendered.jung.left.size());
    assert(rendered.interventions.size() == 1);
    assert(rendered.interventions[0].startTick == 64);
    assert(rendered.interventions[0].endTick == 68);
    assert(rendered.interventions[0].startFrame == clock.frameAtTick(64));
    assert(rendered.interventions[0].endFrame == clock.frameAtTick(68));
    assert(rendered.events.size() == 5);

    const auto start = static_cast<std::size_t>(rendered.interventions[0].startFrame);
    const auto end = static_cast<std::size_t>(rendered.interventions[0].endFrame);
    for (std::size_t frame = 0; frame < start; ++frame) {
        assert(rendered.baseline.left[frame] == rendered.jung.left[frame]);
        assert(rendered.baseline.right[frame] == rendered.jung.right[frame]);
    }

    float maximumInterventionDifference = 0.0f;
    for (std::size_t frame = start; frame < end; ++frame) {
        maximumInterventionDifference = std::max(
            maximumInterventionDifference,
            std::abs(rendered.baseline.left[frame] - rendered.jung.left[frame]));
    }
    assert(maximumInterventionDifference > 0.1f);

    for (std::size_t frame = end; frame < rendered.baseline.left.size(); ++frame) {
        assert(rendered.baseline.left[frame] == rendered.jung.left[frame]);
        assert(rendered.baseline.right[frame] == rendered.jung.right[frame]);
    }

    const auto replayed = flode::renderJungComparison(source, config, 8);
    assert(rendered.baseline.left == replayed.baseline.left);
    assert(rendered.jung.left == replayed.jung.left);
    assert(rendered.jung.right == replayed.jung.right);

    std::cout << "flode JUNG v0.1 audio return test: PASS\n";
    return 0;
}
