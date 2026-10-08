#pragma once

#include "flode/Pod.hpp"

#include <filesystem>
#include <memory>
#include <vector>

namespace flode {

class WavFileSource final : public AudioSource {
public:
    // Loads mono or stereo integer PCM WAV data into normalized float samples.
    // Supported sample widths are 8, 16, 24, and 32 bits.
    static std::shared_ptr<WavFileSource> load(const std::filesystem::path& path);

    std::size_t frameCount() const noexcept override;
    int channelCount() const noexcept override { return channels_; }
    double sampleRate() const noexcept override { return sampleRate_; }
    float sampleAt(int channel, double framePosition) const noexcept override;

private:
    WavFileSource(int channels, double sampleRate, std::vector<float> samples);

    int channels_ = 0;
    double sampleRate_ = 0.0;
    std::vector<float> samples_;
};

} // namespace flode
