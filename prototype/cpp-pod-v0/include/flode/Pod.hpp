#pragma once

#include <cstddef>
#include <memory>
#include <vector>

namespace flode {

enum class SliceMode {
    Transients,
    Grid
};

struct PodState {
    double regionStart = 0.0;   // normalized 0..1
    double regionEnd = 1.0;     // normalized 0..1
    double speed = 1.0;         // playback-speed multiplier
    double pitchCents = 0.0;    // -500..+500; intentionally changes playback rate
    double volume = 0.8;        // 0..1
    double pan = 0.0;           // -1..+1
    double fxSend = 0.0;        // 0..1, post-volume/post-pan
    bool loop = false;
    SliceMode sliceMode = SliceMode::Transients;
    std::vector<double> sliceMarkers; // normalized positions, UI/analysis owned
};

class AudioSource {
public:
    virtual ~AudioSource() = default;
    virtual std::size_t frameCount() const noexcept = 0;
    virtual int channelCount() const noexcept = 0;
    virtual double sampleRate() const noexcept = 0;
    virtual float sampleAt(int channel, double framePosition) const noexcept = 0;
};

struct RenderTargets {
    float* dryLeft = nullptr;
    float* dryRight = nullptr;
    float* fxLeft = nullptr;
    float* fxRight = nullptr;
};

class PodEngine {
public:
    void setSource(std::shared_ptr<const AudioSource> source);
    void setState(const PodState& state);

    const PodState& state() const noexcept { return state_; }

    void play() noexcept;
    void stop() noexcept;
    bool isPlaying() const noexcept { return playing_; }

    void seekNormalized(double position) noexcept;

    // Cursor position across the complete source, normalized 0..1.
    double playheadNormalized() const noexcept;

    // speed * pitch ratio. Pitch is deliberately NOT tempo-preserving.
    double effectivePlaybackRate() const noexcept;

    // Returns the number of frames containing rendered source audio. Any
    // unrendered tail in the supplied targets is cleared to silence.
    std::size_t process(const RenderTargets& targets,
                        std::size_t frames,
                        double outputSampleRate) noexcept;

private:
    void clampState() noexcept;
    double regionStartFrame() const noexcept;
    double regionEndFrame() const noexcept;
    void clearTargets(const RenderTargets& targets, std::size_t frames) const noexcept;

    std::shared_ptr<const AudioSource> source_;
    PodState state_;
    double cursorFrame_ = 0.0;
    bool playing_ = false;
};

} // namespace flode
