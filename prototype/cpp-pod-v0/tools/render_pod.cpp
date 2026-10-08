#include "flode/Pod.hpp"
#include "flode/WavFileSource.hpp"
#include "flode/WavFileWriter.hpp"

#include <algorithm>
#include <cmath>
#include <cstdint>
#include <filesystem>
#include <iomanip>
#include <iostream>
#include <limits>
#include <stdexcept>
#include <string>
#include <vector>

namespace {

constexpr std::size_t kRenderBlockSize = 512;

double parseNumber(const char* text, const char* name) {
    std::size_t consumed = 0;
    const std::string valueText(text);
    const double value = std::stod(valueText, &consumed);
    if (consumed != valueText.size() || !std::isfinite(value)) {
        throw std::runtime_error(std::string(name) + " must be a finite number");
    }
    return value;
}

float verifyOutput(const std::filesystem::path& outputPath,
                   std::size_t expectedFrames,
                   double expectedSampleRate) {
    const auto rendered = flode::WavFileSource::load(outputPath);
    if (rendered->channelCount() != 2 || rendered->frameCount() != expectedFrames ||
        rendered->sampleRate() != expectedSampleRate) {
        throw std::runtime_error("output WAV verification failed: metadata mismatch");
    }

    float peak = 0.0f;
    for (std::size_t frame = 0; frame < rendered->frameCount(); ++frame) {
        const double position = static_cast<double>(frame);
        peak = std::max(peak, std::abs(rendered->sampleAt(0, position)));
        peak = std::max(peak, std::abs(rendered->sampleAt(1, position)));
    }
    if (peak <= 1.0e-6f) {
        throw std::runtime_error("output WAV verification failed: render is silent");
    }
    return peak;
}

void printUsage(const char* executable) {
    std::cerr << "Usage: " << executable
              << " INPUT.wav OUTPUT.wav [SPEED] [PITCH_CENTS]\n";
}

} // namespace

int main(int argc, char** argv) {
    if (argc < 3 || argc > 5) {
        printUsage(argv[0]);
        return 2;
    }

    try {
        const std::filesystem::path inputPath(argv[1]);
        const std::filesystem::path outputPath(argv[2]);
        const double requestedSpeed = argc >= 4 ? parseNumber(argv[3], "SPEED") : 1.0;
        const double requestedPitch = argc >= 5 ? parseNumber(argv[4], "PITCH_CENTS") : 0.0;

        std::error_code inputPathError;
        std::error_code outputPathError;
        const auto resolvedInput = std::filesystem::weakly_canonical(inputPath, inputPathError);
        const auto resolvedOutput = std::filesystem::weakly_canonical(outputPath, outputPathError);
        if (!inputPathError && !outputPathError && resolvedInput == resolvedOutput) {
            throw std::runtime_error("input and output WAV paths must be different");
        }

        const auto source = flode::WavFileSource::load(inputPath);
        if (source->frameCount() < 2) {
            throw std::runtime_error("input WAV must contain at least two frames");
        }

        const double sourceSampleRate = source->sampleRate();
        if (sourceSampleRate > static_cast<double>(std::numeric_limits<std::uint32_t>::max())) {
            throw std::runtime_error("input sample rate is too large for RIFF/WAVE output");
        }
        const auto outputSampleRate = static_cast<std::uint32_t>(std::llround(sourceSampleRate));
        if (static_cast<double>(outputSampleRate) != sourceSampleRate) {
            throw std::runtime_error("input sample rate must be a whole number");
        }

        flode::PodState state;
        state.speed = requestedSpeed;
        state.pitchCents = requestedPitch;
        state.volume = 1.0;
        state.pan = 0.0;
        state.fxSend = 0.0;
        state.loop = false;

        flode::PodEngine pod;
        pod.setSource(source);
        pod.setState(state);
        pod.seekNormalized(0.0);
        pod.play();
        if (!pod.isPlaying()) {
            throw std::runtime_error("POD refused to start the loaded source");
        }

        const double estimatedFrames =
            static_cast<double>(source->frameCount()) / pod.effectivePlaybackRate();
        if (!std::isfinite(estimatedFrames) ||
            estimatedFrames > static_cast<double>(std::numeric_limits<std::size_t>::max())) {
            throw std::runtime_error("requested playback rate creates an invalid render length");
        }

        std::vector<float> renderedLeft;
        std::vector<float> renderedRight;
        renderedLeft.reserve(static_cast<std::size_t>(std::ceil(estimatedFrames)));
        renderedRight.reserve(renderedLeft.capacity());

        std::vector<float> blockLeft(kRenderBlockSize);
        std::vector<float> blockRight(kRenderBlockSize);
        while (pod.isPlaying()) {
            const auto renderedFrames = pod.process(
                {blockLeft.data(), blockRight.data(), nullptr, nullptr},
                kRenderBlockSize,
                sourceSampleRate);
            renderedLeft.insert(renderedLeft.end(), blockLeft.begin(),
                                blockLeft.begin() + static_cast<std::ptrdiff_t>(renderedFrames));
            renderedRight.insert(renderedRight.end(), blockRight.begin(),
                                 blockRight.begin() + static_cast<std::ptrdiff_t>(renderedFrames));
        }

        if (renderedLeft.empty()) {
            throw std::runtime_error("POD produced no audio frames");
        }

        flode::writeStereoPcm16Wav(
            outputPath, outputSampleRate, renderedLeft, renderedRight);
        const float peak = verifyOutput(outputPath, renderedLeft.size(), sourceSampleRate);

        std::cout << std::fixed << std::setprecision(6)
                  << "source: " << source->frameCount() << " frames, "
                  << source->channelCount() << " channel(s), "
                  << sourceSampleRate << " Hz\n"
                  << "pod rate: " << pod.effectivePlaybackRate()
                  << " (speed " << pod.state().speed
                  << ", pitch " << pod.state().pitchCents << " cents)\n"
                  << "rendered: " << renderedLeft.size() << " frames, "
                  << (static_cast<double>(renderedLeft.size()) / sourceSampleRate)
                  << " seconds\n"
                  << "output: " << outputPath.string() << "\n"
                  << "verification: PASS (decoded peak " << peak << ")\n";
        return 0;
    } catch (const std::exception& error) {
        std::cerr << "flode_pod_v0_render: " << error.what() << '\n';
        return 1;
    }
}
