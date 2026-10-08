#include "flode/WavFileSource.hpp"

#include <algorithm>
#include <cmath>
#include <cstdint>
#include <fstream>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>

namespace flode {
namespace {

std::uint16_t readU16(const std::vector<std::uint8_t>& bytes, std::size_t offset) {
    return static_cast<std::uint16_t>(bytes[offset]) |
           (static_cast<std::uint16_t>(bytes[offset + 1]) << 8U);
}

std::uint32_t readU32(const std::vector<std::uint8_t>& bytes, std::size_t offset) {
    return static_cast<std::uint32_t>(bytes[offset]) |
           (static_cast<std::uint32_t>(bytes[offset + 1]) << 8U) |
           (static_cast<std::uint32_t>(bytes[offset + 2]) << 16U) |
           (static_cast<std::uint32_t>(bytes[offset + 3]) << 24U);
}

bool hasId(const std::vector<std::uint8_t>& bytes,
           std::size_t offset,
           const char (&id)[5]) noexcept {
    return offset + 4 <= bytes.size() &&
           bytes[offset] == static_cast<std::uint8_t>(id[0]) &&
           bytes[offset + 1] == static_cast<std::uint8_t>(id[1]) &&
           bytes[offset + 2] == static_cast<std::uint8_t>(id[2]) &&
           bytes[offset + 3] == static_cast<std::uint8_t>(id[3]);
}

[[noreturn]] void fail(const std::filesystem::path& path, const std::string& reason) {
    throw std::runtime_error("cannot load WAV '" + path.string() + "': " + reason);
}

float decodePcmSample(const std::uint8_t* sample, std::uint16_t bitsPerSample) noexcept {
    switch (bitsPerSample) {
    case 8:
        return (static_cast<float>(sample[0]) - 128.0f) / 128.0f;
    case 16: {
        const auto raw = static_cast<std::uint16_t>(sample[0]) |
                         (static_cast<std::uint16_t>(sample[1]) << 8U);
        return static_cast<float>(static_cast<std::int16_t>(raw)) / 32768.0f;
    }
    case 24: {
        std::uint32_t raw = static_cast<std::uint32_t>(sample[0]) |
                            (static_cast<std::uint32_t>(sample[1]) << 8U) |
                            (static_cast<std::uint32_t>(sample[2]) << 16U);
        if ((raw & 0x00800000U) != 0U) {
            raw |= 0xff000000U;
        }
        return static_cast<float>(static_cast<std::int32_t>(raw)) / 8388608.0f;
    }
    case 32: {
        const auto raw = static_cast<std::uint32_t>(sample[0]) |
                         (static_cast<std::uint32_t>(sample[1]) << 8U) |
                         (static_cast<std::uint32_t>(sample[2]) << 16U) |
                         (static_cast<std::uint32_t>(sample[3]) << 24U);
        return static_cast<float>(static_cast<std::int32_t>(raw) / 2147483648.0);
    }
    default:
        return 0.0f;
    }
}

} // namespace

WavFileSource::WavFileSource(int channels,
                             double sampleRate,
                             std::vector<float> samples)
    : channels_(channels), sampleRate_(sampleRate), samples_(std::move(samples)) {}

std::shared_ptr<WavFileSource> WavFileSource::load(const std::filesystem::path& path) {
    std::ifstream input(path, std::ios::binary | std::ios::ate);
    if (!input) {
        fail(path, "file could not be opened");
    }

    const auto end = input.tellg();
    if (end < 0) {
        fail(path, "file size could not be read");
    }

    std::vector<std::uint8_t> bytes(static_cast<std::size_t>(end));
    input.seekg(0, std::ios::beg);
    if (!bytes.empty() &&
        !input.read(reinterpret_cast<char*>(bytes.data()), static_cast<std::streamsize>(bytes.size()))) {
        fail(path, "file data is truncated");
    }

    if (bytes.size() < 12 || !hasId(bytes, 0, "RIFF") || !hasId(bytes, 8, "WAVE")) {
        fail(path, "expected a RIFF/WAVE header");
    }

    bool foundFormat = false;
    bool foundData = false;
    std::uint16_t audioFormat = 0;
    std::uint16_t channels = 0;
    std::uint32_t sampleRate = 0;
    std::uint16_t blockAlign = 0;
    std::uint16_t bitsPerSample = 0;
    std::size_t dataOffset = 0;
    std::size_t dataSize = 0;

    std::size_t offset = 12;
    while (offset + 8 <= bytes.size()) {
        const auto chunkSize = static_cast<std::size_t>(readU32(bytes, offset + 4));
        const auto chunkData = offset + 8;
        if (chunkSize > bytes.size() - chunkData) {
            fail(path, "a chunk extends beyond the file");
        }

        if (!foundFormat && hasId(bytes, offset, "fmt ")) {
            if (chunkSize < 16) {
                fail(path, "the fmt chunk is too small");
            }
            audioFormat = readU16(bytes, chunkData);
            channels = readU16(bytes, chunkData + 2);
            sampleRate = readU32(bytes, chunkData + 4);
            blockAlign = readU16(bytes, chunkData + 12);
            bitsPerSample = readU16(bytes, chunkData + 14);
            foundFormat = true;
        } else if (!foundData && hasId(bytes, offset, "data")) {
            dataOffset = chunkData;
            dataSize = chunkSize;
            foundData = true;
        }

        const auto padding = chunkSize & 1U;
        if (chunkSize + padding > bytes.size() - chunkData) {
            offset = bytes.size();
        } else {
            offset = chunkData + chunkSize + padding;
        }
    }

    if (!foundFormat || !foundData) {
        fail(path, "required fmt or data chunk is missing");
    }
    if (audioFormat != 1) {
        fail(path, "only integer PCM WAV files are supported");
    }
    if (channels < 1 || channels > 2) {
        fail(path, "only mono and stereo WAV files are supported");
    }
    if (sampleRate == 0) {
        fail(path, "sample rate must be greater than zero");
    }
    if (bitsPerSample != 8 && bitsPerSample != 16 &&
        bitsPerSample != 24 && bitsPerSample != 32) {
        fail(path, "PCM sample width must be 8, 16, 24, or 32 bits");
    }

    const auto bytesPerSample = static_cast<std::size_t>(bitsPerSample / 8U);
    const auto expectedBlockAlign = static_cast<std::size_t>(channels) * bytesPerSample;
    if (blockAlign != expectedBlockAlign || dataSize % expectedBlockAlign != 0) {
        fail(path, "PCM block alignment is invalid");
    }

    const auto sampleCount = dataSize / bytesPerSample;
    std::vector<float> samples;
    samples.reserve(sampleCount);
    for (std::size_t sampleOffset = dataOffset;
         sampleOffset < dataOffset + dataSize;
         sampleOffset += bytesPerSample) {
        samples.push_back(decodePcmSample(bytes.data() + sampleOffset, bitsPerSample));
    }

    return std::shared_ptr<WavFileSource>(
        new WavFileSource(static_cast<int>(channels), static_cast<double>(sampleRate),
                          std::move(samples)));
}

std::size_t WavFileSource::frameCount() const noexcept {
    if (channels_ <= 0) {
        return 0;
    }
    return samples_.size() / static_cast<std::size_t>(channels_);
}

float WavFileSource::sampleAt(int channel, double framePosition) const noexcept {
    const auto frames = frameCount();
    if (frames == 0 || !std::isfinite(framePosition)) {
        return 0.0f;
    }

    channel = std::clamp(channel, 0, channels_ - 1);
    framePosition = std::clamp(framePosition, 0.0, static_cast<double>(frames - 1));

    const auto frameA = static_cast<std::size_t>(std::floor(framePosition));
    const auto frameB = std::min(frameA + 1, frames - 1);
    const auto fraction = static_cast<float>(framePosition - static_cast<double>(frameA));
    const auto channelIndex = static_cast<std::size_t>(channel);
    const auto channelCount = static_cast<std::size_t>(channels_);
    const float sampleA = samples_[frameA * channelCount + channelIndex];
    const float sampleB = samples_[frameB * channelCount + channelIndex];
    return sampleA + (sampleB - sampleA) * fraction;
}

} // namespace flode
