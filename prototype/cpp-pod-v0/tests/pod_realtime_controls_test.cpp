#include "flode/Pod.hpp"

#include <cmath>
#include <iostream>
#include <limits>
#include <memory>
#include <stdexcept>
#include <string>
#include <vector>

namespace {

class ConstantSource final : public flode::AudioSource {
public:
    std::size_t frameCount() const noexcept override { return 4096; }
    int channelCount() const noexcept override { return 2; }
    double sampleRate() const noexcept override { return 1000.0; }
    float sampleAt(int, double) const noexcept override { return 1.0f; }
};

void require(bool condition, const std::string& message) {
    if (!condition) {
        throw std::runtime_error(message);
    }
}

bool near(double actual, double expected, double epsilon = 1.0e-5) {
    return std::abs(actual - expected) <= epsilon;
}

void requireEqualPower(const std::vector<float>& left,
                       const std::vector<float>& right) {
    for (std::size_t i = 0; i < left.size(); ++i) {
        const double energy = left[i] * left[i] + right[i] * right[i];
        require(near(energy, 1.0, 2.0e-5), "pan ramp must preserve equal-power gain");
    }
}

} // namespace

int main() {
    try {
        flode::PodEngine pod;
        pod.setSource(std::make_shared<ConstantSource>());

        flode::PodState state;
        state.volume = 1.0;
        state.pan = 0.0;
        state.loop = true;
        pod.setState(state);
        pod.play();

        std::vector<float> left(10);
        std::vector<float> right(10);

        pod.setVolume(0.0);
        require(pod.process({left.data(), right.data(), nullptr, nullptr},
                            left.size(), 1000.0) == left.size(),
                "volume ramp must not interrupt playback");
        for (std::size_t i = 1; i < left.size(); ++i) {
            require(std::abs(left[i]) <= std::abs(left[i - 1]),
                    "volume ramp must decrease monotonically");
            require(std::abs(right[i]) <= std::abs(right[i - 1]),
                    "volume ramp must decrease monotonically");
        }
        require(near(left.back(), 0.0) && near(right.back(), 0.0),
                "volume must reach silence after the ramp");
        require(pod.isPlaying(), "volume change must preserve PLAY state");

        pod.setVolume(2.0);
        require(near(pod.state().volume, 1.0), "volume must clamp to 1.0");
        pod.process({left.data(), right.data(), nullptr, nullptr}, left.size(), 1000.0);
        require(near(left.back(), std::sqrt(0.5)) &&
                near(right.back(), std::sqrt(0.5)),
                "center gain must settle to equal-power center");

        pod.setPan(1.0);
        pod.process({left.data(), right.data(), nullptr, nullptr}, left.size(), 1000.0);
        for (std::size_t i = 1; i < left.size(); ++i) {
            require(left[i] <= left[i - 1], "right pan ramp must lower left gain");
            require(right[i] >= right[i - 1], "right pan ramp must raise right gain");
        }
        requireEqualPower(left, right);
        require(near(left.back(), 0.0) && near(right.back(), 1.0),
                "pan +1.0 must settle full right");

        std::vector<float> sweepLeft(20);
        std::vector<float> sweepRight(20);
        pod.setPan(-2.0);
        require(near(pod.state().pan, -1.0), "pan must clamp to -1.0");
        pod.process({sweepLeft.data(), sweepRight.data(), nullptr, nullptr},
                    sweepLeft.size(), 1000.0);
        requireEqualPower(sweepLeft, sweepRight);
        require(near(sweepLeft.back(), 1.0) && near(sweepRight.back(), 0.0),
                "pan -1.0 must settle full left");

        pod.setVolume(std::numeric_limits<double>::quiet_NaN());
        pod.setPan(std::numeric_limits<double>::infinity());
        require(near(pod.state().volume, 1.0), "non-finite volume must be ignored");
        require(near(pod.state().pan, -1.0), "non-finite pan must be ignored");

        pod.stop();
        pod.setVolume(0.5);
        pod.setPan(0.0);
        pod.play();
        std::vector<float> resumedLeft(1);
        std::vector<float> resumedRight(1);
        pod.process({resumedLeft.data(), resumedRight.data(), nullptr, nullptr}, 1, 1000.0);
        require(near(resumedLeft[0], 0.5 * std::sqrt(0.5)) &&
                near(resumedRight[0], 0.5 * std::sqrt(0.5)),
                "controls changed while stopped must apply before resumed audio");

        std::cout << "flode POD real-time volume/pan test: PASS\n";
        return 0;
    } catch (const std::exception& error) {
        std::cerr << "flode POD real-time volume/pan test: " << error.what() << '\n';
        return 1;
    }
}
