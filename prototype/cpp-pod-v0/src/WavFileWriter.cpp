#include "flode/WavFileWriter.hpp"

#include <algorithm>
#include <cmath>
#include <cstdint>
#include <fstream>
#include <limits>
#include <stdexcept>

namespace flode {
namespace {

void writeId(std::ostream& output, const char (&id)[5]) {
    output.write(id, 4);
}

void writeU16(std::ostream& output, std::uint16_t value) {
    const char bytes[] = {
        static_cast<char>(value & 0xffU),
        static_cast<char>((value >> 8U) & 0xffU)
    };
    output.write(bytes, sizeof(bytes));
}

void writeU32(std::ostream& output, std::uint32_t value) {
    const char bytes[] = {
        static_cast<char>(value & 0xffU),
        static_cast<char>((value >> 8U) & 0xffU),
        static_cast<char>((value >> 16U) & 0xffU),
        static_cast<char>((value >> 24U) & 0xffU)
    };
    output.write(bytes, sizeof(bytes));
}

std::int16_t toPcm16(float sample) noexcept {
    const float clamped = std::clamp(sample, -1.0f, 1.0f);
    if (clamped <= -1.0f) {
        return std::numeric_limits<std::int16_t>::min();
    }
    return static_cast<std::int16_t>(std::lrint(clamped * 32767.0f));
}

} // namespace

void writeStereoPcm16Wav(const std::filesystem::path& outputPath,
                         std::uint32_t sampleRate,
                         const std::vector<float>& left,
                         const std::vector<float>& right) {
    if (sampleRate == 0) {
        throw std::invalid_argument("output sample rate must be greater than zero");
    }
    if (left.size() != right.size()) {
        throw std::invalid_argument("rendered channel lengths do not match");
    }

    constexpr std::uint32_t bytesPerFrame = 4;
    const auto maximumFrames =
        static_cast<std::size_t>(std::numeric_limits<std::uint32_t>::max() / bytesPerFrame);
    if (left.size() > maximumFrames) {
        throw std::runtime_error("render is too long for a standard RIFF/WAVE file");
    }

    const auto dataSize = static_cast<std::uint32_t>(left.size() * bytesPerFrame);
    std::ofstream output(outputPath, std::ios::binary | std::ios::trunc);
    if (!output) {
        throw std::runtime_error("cannot open output WAV '" + outputPath.string() + "'");
    }

    writeId(output, "RIFF");
    writeU32(output, 36U + dataSize);
    writeId(output, "WAVE");
    writeId(output, "fmt ");
    writeU32(output, 16);
    writeU16(output, 1); // integer PCM
    writeU16(output, 2); // stereo
    writeU32(output, sampleRate);
    writeU32(output, sampleRate * bytesPerFrame);
    writeU16(output, bytesPerFrame);
    writeU16(output, 16);
    writeId(output, "data");
    writeU32(output, dataSize);

    for (std::size_t frame = 0; frame < left.size(); ++frame) {
        writeU16(output, static_cast<std::uint16_t>(toPcm16(left[frame])));
        writeU16(output, static_cast<std::uint16_t>(toPcm16(right[frame])));
    }

    if (!output) {
        throw std::runtime_error("failed while writing output WAV '" + outputPath.string() + "'");
    }
}

} // namespace flode
