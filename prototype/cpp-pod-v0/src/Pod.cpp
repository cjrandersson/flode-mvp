#include "flode/Pod.hpp"

#include <algorithm>
#include <cmath>

namespace flode {
namespace {
constexpr double kPi = 3.14159265358979323846;

double clampFinite(double value, double low, double high, double fallback) noexcept {
    if (!std::isfinite(value)) {
        return fallback;
    }
    return std::clamp(value, low, high);
}
}

void PodEngine::setSource(std::shared_ptr<const AudioSource> source) {
    source_ = std::move(source);
    playing_ = false;
    cursorFrame_ = regionStartFrame();
}

void PodEngine::setState(const PodState& state) {
    state_ = state;
    clampState();

    // Keep the cursor inside the currently valid active region.
    cursorFrame_ = std::clamp(cursorFrame_, regionStartFrame(), regionEndFrame());
}

void PodEngine::clampState() noexcept {
    state_.regionStart = clampFinite(state_.regionStart, 0.0, 1.0, 0.0);
    state_.regionEnd = clampFinite(state_.regionEnd, 0.0, 1.0, 1.0);

    if (state_.regionEnd < state_.regionStart) {
        std::swap(state_.regionStart, state_.regionEnd);
    }

    // Never allow a mathematically zero-length region.
    if (state_.regionEnd - state_.regionStart < 1.0e-6) {
        state_.regionEnd = std::min(1.0, state_.regionStart + 1.0e-6);
    }

    state_.speed = clampFinite(state_.speed, 0.05, 4.0, 1.0);
    state_.pitchCents = clampFinite(state_.pitchCents, -500.0, 500.0, 0.0);
    state_.volume = clampFinite(state_.volume, 0.0, 1.0, 0.8);
    state_.pan = clampFinite(state_.pan, -1.0, 1.0, 0.0);
    state_.fxSend = clampFinite(state_.fxSend, 0.0, 1.0, 0.0);

    for (double& marker : state_.sliceMarkers) {
        marker = clampFinite(marker, 0.0, 1.0, 0.0);
    }
    std::sort(state_.sliceMarkers.begin(), state_.sliceMarkers.end());
    state_.sliceMarkers.erase(
        std::unique(state_.sliceMarkers.begin(), state_.sliceMarkers.end()),
        state_.sliceMarkers.end());
}

void PodEngine::play() noexcept {
    if (!source_ || source_->frameCount() < 2 || source_->sampleRate() <= 0.0) {
        playing_ = false;
        return;
    }

    if (cursorFrame_ < regionStartFrame() || cursorFrame_ >= regionEndFrame()) {
        cursorFrame_ = regionStartFrame();
    }

    playing_ = true;
}

void PodEngine::stop() noexcept {
    playing_ = false;
}

void PodEngine::seekNormalized(double position) noexcept {
    const double p = clampFinite(position, 0.0, 1.0, state_.regionStart);
    if (!source_ || source_->frameCount() < 2) {
        cursorFrame_ = 0.0;
        return;
    }

    const double maxFrame = static_cast<double>(source_->frameCount() - 1);
    cursorFrame_ = p * maxFrame;
    cursorFrame_ = std::clamp(cursorFrame_, regionStartFrame(), regionEndFrame());
}

double PodEngine::playheadNormalized() const noexcept {
    if (!source_ || source_->frameCount() < 2) {
        return 0.0;
    }

    const double maxFrame = static_cast<double>(source_->frameCount() - 1);
    return std::clamp(cursorFrame_ / maxFrame, 0.0, 1.0);
}

double PodEngine::effectivePlaybackRate() const noexcept {
    const double pitchRatio = std::pow(2.0, state_.pitchCents / 1200.0);
    return state_.speed * pitchRatio;
}

double PodEngine::regionStartFrame() const noexcept {
    if (!source_ || source_->frameCount() < 2) {
        return 0.0;
    }
    return state_.regionStart * static_cast<double>(source_->frameCount() - 1);
}

double PodEngine::regionEndFrame() const noexcept {
    if (!source_ || source_->frameCount() < 2) {
        return 0.0;
    }
    return state_.regionEnd * static_cast<double>(source_->frameCount() - 1);
}

void PodEngine::clearTargets(const RenderTargets& targets, std::size_t frames) const noexcept {
    const auto clear = [frames](float* target) {
        if (target) {
            std::fill(target, target + frames, 0.0f);
        }
    };

    clear(targets.dryLeft);
    clear(targets.dryRight);
    clear(targets.fxLeft);
    clear(targets.fxRight);
}

void PodEngine::process(const RenderTargets& targets,
                        std::size_t frames,
                        double outputSampleRate) noexcept {
    clearTargets(targets, frames);

    if (!playing_ || !source_ || frames == 0 || outputSampleRate <= 0.0 ||
        source_->frameCount() < 2 || source_->sampleRate() <= 0.0) {
        return;
    }

    const double leftGain = state_.volume * std::cos((state_.pan + 1.0) * kPi * 0.25);
    const double rightGain = state_.volume * std::sin((state_.pan + 1.0) * kPi * 0.25);
    const double sourceFramesPerOutputFrame =
        effectivePlaybackRate() * source_->sampleRate() / outputSampleRate;

    const double start = regionStartFrame();
    const double end = regionEndFrame();

    for (std::size_t i = 0; i < frames; ++i) {
        if (cursorFrame_ >= end) {
            if (state_.loop) {
                const double regionLength = std::max(1.0, end - start);
                cursorFrame_ = start + std::fmod(cursorFrame_ - start, regionLength);
            } else {
                playing_ = false;
                break;
            }
        }

        const float sourceLeft = source_->sampleAt(0, cursorFrame_);
        const float sourceRight =
            source_->channelCount() > 1 ? source_->sampleAt(1, cursorFrame_) : sourceLeft;

        const float dryL = static_cast<float>(sourceLeft * leftGain);
        const float dryR = static_cast<float>(sourceRight * rightGain);

        if (targets.dryLeft) targets.dryLeft[i] = dryL;
        if (targets.dryRight) targets.dryRight[i] = dryR;
        if (targets.fxLeft) targets.fxLeft[i] = static_cast<float>(dryL * state_.fxSend);
        if (targets.fxRight) targets.fxRight[i] = static_cast<float>(dryR * state_.fxSend);

        cursorFrame_ += sourceFramesPerOutputFrame;
    }
}

} // namespace flode
