#include "flode/Pod.hpp"

#include <cassert>
#include <cmath>
#include <iostream>
#include <memory>
#include <vector>

namespace {

class TestSource final : public flode::AudioSource {
public:
    TestSource(std::size_t frames, int channels, double sampleRate)
        : channels_(channels), sampleRate_(sampleRate), data_(frames * channels, 0.0f) {
        for (std::size_t f = 0; f < frames; ++f) {
            const float v = static_cast<float>(f) / static_cast<float>(frames - 1);
            for (int ch = 0; ch < channels_; ++ch) {
                data_[f * channels_ + ch] = v;
            }
        }
    }

    std::size_t frameCount() const noexcept override {
        return data_.size() / static_cast<std::size_t>(channels_);
    }

    int channelCount() const noexcept override { return channels_; }
    double sampleRate() const noexcept override { return sampleRate_; }

    float sampleAt(int channel, double framePosition) const noexcept override {
        if (frameCount() == 0) return 0.0f;

        channel = std::max(0, std::min(channel, channels_ - 1));
        framePosition = std::max(0.0,
            std::min(framePosition, static_cast<double>(frameCount() - 1)));

        const auto a = static_cast<std::size_t>(std::floor(framePosition));
        const auto b = std::min(a + 1, frameCount() - 1);
        const double t = framePosition - static_cast<double>(a);

        const float av = data_[a * channels_ + static_cast<std::size_t>(channel)];
        const float bv = data_[b * channels_ + static_cast<std::size_t>(channel)];
        return static_cast<float>(av + (bv - av) * t);
    }

private:
    int channels_;
    double sampleRate_;
    std::vector<float> data_;
};

bool near(double a, double b, double eps = 1.0e-6) {
    return std::abs(a - b) <= eps;
}

}

int main() {
    auto source = std::make_shared<TestSource>(1024, 2, 48000.0);

    flode::PodEngine pod;
    pod.setSource(source);

    flode::PodState state;
    state.regionStart = 0.10;
    state.regionEnd = 0.90;
    state.speed = 1.0;
    state.pitchCents = 700.0; // must clamp to +500
    state.volume = 1.0;
    state.pan = 0.0;
    state.fxSend = 0.5;
    state.loop = true;
    state.sliceMode = flode::SliceMode::Transients;
    state.sliceMarkers = {0.8, 0.2, 0.2, -1.0, 2.0};

    pod.setState(state);

    assert(near(pod.state().pitchCents, 500.0));
    assert(pod.state().sliceMarkers.front() == 0.0);
    assert(pod.state().sliceMarkers.back() == 1.0);

    const double expectedRate = std::pow(2.0, 500.0 / 1200.0);
    assert(near(pod.effectivePlaybackRate(), expectedRate));

    pod.seekNormalized(0.10);
    pod.play();
    assert(pod.isPlaying());

    std::vector<float> dryL(64), dryR(64), fxL(64), fxR(64);
    const auto rendered = pod.process(
        {dryL.data(), dryR.data(), fxL.data(), fxR.data()},
        dryL.size(),
        48000.0);

    assert(rendered == dryL.size());
    assert(pod.playheadNormalized() > 0.10);
    assert(std::abs(dryL[10]) > 0.0f);
    assert(near(fxL[10], dryL[10] * 0.5, 1.0e-5));
    assert(near(fxR[10], dryR[10] * 0.5, 1.0e-5));

    pod.stop();
    assert(!pod.isPlaying());

    flode::PodEngine oneShot;
    oneShot.setSource(std::make_shared<TestSource>(8, 1, 48000.0));
    oneShot.play();

    std::vector<float> oneShotLeft(16, 1.0f);
    std::vector<float> oneShotRight(16, 1.0f);
    const auto oneShotFrames = oneShot.process(
        {oneShotLeft.data(), oneShotRight.data(), nullptr, nullptr},
        oneShotLeft.size(),
        48000.0);

    assert(oneShotFrames == 7);
    assert(!oneShot.isPlaying());
    assert(oneShotLeft[oneShotFrames] == 0.0f);
    assert(oneShotRight[oneShotFrames] == 0.0f);

    std::cout << "flode POD v0 smoke test: PASS\n";
    return 0;
}
