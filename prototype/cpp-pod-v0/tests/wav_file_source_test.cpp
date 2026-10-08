#include "flode/WavFileSource.hpp"

#include <cassert>
#include <cmath>
#include <cstdint>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <vector>

namespace {

void appendU16(std::vector<std::uint8_t>& bytes, std::uint16_t value) {
    bytes.push_back(static_cast<std::uint8_t>(value & 0xffU));
    bytes.push_back(static_cast<std::uint8_t>((value >> 8U) & 0xffU));
}

void appendU32(std::vector<std::uint8_t>& bytes, std::uint32_t value) {
    bytes.push_back(static_cast<std::uint8_t>(value & 0xffU));
    bytes.push_back(static_cast<std::uint8_t>((value >> 8U) & 0xffU));
    bytes.push_back(static_cast<std::uint8_t>((value >> 16U) & 0xffU));
    bytes.push_back(static_cast<std::uint8_t>((value >> 24U) & 0xffU));
}

void appendId(std::vector<std::uint8_t>& bytes, const char (&id)[5]) {
    bytes.insert(bytes.end(), id, id + 4);
}

void appendS24(std::vector<std::uint8_t>& bytes, std::int32_t value) {
    const auto raw = static_cast<std::uint32_t>(value);
    bytes.push_back(static_cast<std::uint8_t>(raw & 0xffU));
    bytes.push_back(static_cast<std::uint8_t>((raw >> 8U) & 0xffU));
    bytes.push_back(static_cast<std::uint8_t>((raw >> 16U) & 0xffU));
}

bool near(float actual, float expected, float epsilon = 1.0e-6f) {
    return std::abs(actual - expected) <= epsilon;
}

} // namespace

int main() {
    constexpr std::uint16_t channels = 2;
    constexpr std::uint32_t sampleRate = 44100;
    constexpr std::uint16_t bitsPerSample = 24;
    constexpr std::uint16_t blockAlign = channels * (bitsPerSample / 8);
    constexpr std::uint32_t dataSize = 3 * blockAlign;

    std::vector<std::uint8_t> bytes;
    appendId(bytes, "RIFF");
    appendU32(bytes, 36 + dataSize);
    appendId(bytes, "WAVE");
    appendId(bytes, "fmt ");
    appendU32(bytes, 16);
    appendU16(bytes, 1);
    appendU16(bytes, channels);
    appendU32(bytes, sampleRate);
    appendU32(bytes, sampleRate * blockAlign);
    appendU16(bytes, blockAlign);
    appendU16(bytes, bitsPerSample);
    appendId(bytes, "data");
    appendU32(bytes, dataSize);
    appendS24(bytes, -8388608);
    appendS24(bytes, 8388607);
    appendS24(bytes, 0);
    appendS24(bytes, 0);
    appendS24(bytes, 4194304);
    appendS24(bytes, -4194304);

    const auto path = std::filesystem::current_path() / "flode_wav_source_test_pcm24.wav";
    {
        std::ofstream output(path, std::ios::binary);
        assert(output);
        output.write(reinterpret_cast<const char*>(bytes.data()),
                     static_cast<std::streamsize>(bytes.size()));
        assert(output);
    }

    const auto source = flode::WavFileSource::load(path);
    assert(source->channelCount() == channels);
    assert(source->sampleRate() == sampleRate);
    assert(source->frameCount() == 3);
    assert(near(source->sampleAt(0, 0.0), -1.0f));
    assert(near(source->sampleAt(1, 0.0), 8388607.0f / 8388608.0f));
    assert(near(source->sampleAt(0, 1.5), 0.25f));
    assert(near(source->sampleAt(1, 2.0), -0.5f));

    std::filesystem::remove(path);
    std::cout << "flode WAV file source test: PASS\n";
    return 0;
}
