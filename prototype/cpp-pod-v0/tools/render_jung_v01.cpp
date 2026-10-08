#include "flode/JungRender.hpp"
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

namespace {

bool pathsMatch(const std::filesystem::path& a, const std::filesystem::path& b) {
    std::error_code aError;
    std::error_code bError;
    const auto resolvedA = std::filesystem::weakly_canonical(a, aError);
    const auto resolvedB = std::filesystem::weakly_canonical(b, bError);
    return !aError && !bError && resolvedA == resolvedB;
}

float decodedPeak(const flode::WavFileSource& source) {
    float peak = 0.0f;
    for (std::size_t frame = 0; frame < source.frameCount(); ++frame) {
        const double position = static_cast<double>(frame);
        peak = std::max(peak, std::abs(source.sampleAt(0, position)));
        peak = std::max(peak, std::abs(source.sampleAt(1, position)));
    }
    return peak;
}

const char* eventName(flode::JungEventType type) {
    switch (type) {
    case flode::JungEventType::DecisionHold: return "hold";
    case flode::JungEventType::DecisionCooldown: return "cooldown";
    case flode::JungEventType::InterventionStart: return "start";
    case flode::JungEventType::InterventionStep: return "step";
    case flode::JungEventType::ReturnHome: return "return";
    case flode::JungEventType::None: return "none";
    }
    return "unknown";
}

void printUsage(const char* executable) {
    std::cerr << "Usage: " << executable
              << " INPUT.wav BASELINE_OUTPUT.wav JUNG_OUTPUT.wav\n";
}

} // namespace

int main(int argc, char** argv) {
    if (argc != 4) {
        printUsage(argv[0]);
        return 2;
    }

    try {
        const std::filesystem::path inputPath(argv[1]);
        const std::filesystem::path baselinePath(argv[2]);
        const std::filesystem::path jungPath(argv[3]);
        if (pathsMatch(inputPath, baselinePath) || pathsMatch(inputPath, jungPath) ||
            pathsMatch(baselinePath, jungPath)) {
            throw std::runtime_error("input, baseline output and JUNG output paths must differ");
        }

        const auto source = flode::WavFileSource::load(inputPath);
        const double sampleRate = source->sampleRate();
        if (sampleRate > static_cast<double>(std::numeric_limits<std::uint32_t>::max())) {
            throw std::runtime_error("input sample rate is too large for RIFF/WAVE output");
        }
        const auto outputSampleRate = static_cast<std::uint32_t>(std::llround(sampleRate));
        if (static_cast<double>(outputSampleRate) != sampleRate) {
            throw std::runtime_error("input sample rate must be a whole number");
        }

        constexpr std::uint32_t renderBars = 8;
        const flode::JungConfig config;
        const flode::MasterClock clock(sampleRate, config.clock);
        const auto rendered = flode::renderJungComparison(source, config, renderBars);
        if (rendered.interventions.size() != 1) {
            throw std::runtime_error("approved seed/config must produce one comparison intervention");
        }

        const auto& window = rendered.interventions.front();
        float maximumInsideDifference = 0.0f;
        float maximumOutsideDifference = 0.0f;
        for (std::size_t frame = 0; frame < rendered.baseline.left.size(); ++frame) {
            const float difference = std::max(
                std::abs(rendered.baseline.left[frame] - rendered.jung.left[frame]),
                std::abs(rendered.baseline.right[frame] - rendered.jung.right[frame]));
            if (frame >= window.startFrame && frame < window.endFrame) {
                maximumInsideDifference = std::max(maximumInsideDifference, difference);
            } else {
                maximumOutsideDifference = std::max(maximumOutsideDifference, difference);
            }
        }
        if (maximumInsideDifference <= 1.0e-4f || maximumOutsideDifference != 0.0f) {
            throw std::runtime_error(
                "JUNG comparison failed bounded-difference or deterministic-return verification");
        }

        flode::writeStereoPcm16Wav(
            baselinePath, outputSampleRate, rendered.baseline.left, rendered.baseline.right);
        flode::writeStereoPcm16Wav(
            jungPath, outputSampleRate, rendered.jung.left, rendered.jung.right);

        const auto baselineCheck = flode::WavFileSource::load(baselinePath);
        const auto jungCheck = flode::WavFileSource::load(jungPath);
        if (baselineCheck->frameCount() != rendered.baseline.left.size() ||
            jungCheck->frameCount() != rendered.jung.left.size() ||
            baselineCheck->sampleRate() != sampleRate || jungCheck->sampleRate() != sampleRate ||
            baselineCheck->channelCount() != 2 || jungCheck->channelCount() != 2 ||
            decodedPeak(*baselineCheck) <= 1.0e-6f || decodedPeak(*jungCheck) <= 1.0e-6f) {
            throw std::runtime_error("written comparison WAV verification failed");
        }

        std::cout << std::fixed << std::setprecision(9)
                  << "JUNG v0.1 EXPERIMENTAL CONFIG (not an original reconstruction)\n"
                  << "master: " << config.clock.bpm << " BPM, 4/4, 16n ticks\n"
                  << "decision: every " << config.decisionCadenceBars
                  << " bars, probability " << config.interventionProbability << "\n"
                  << "intervention: " << config.interventionDurationTicks
                  << " ticks, slice " << config.sliceLengthTicks
                  << " tick, repeats " << config.repeatDepth << ", rates";
        for (const double rate : config.rateContour) {
            std::cout << ' ' << rate;
        }
        std::cout << "\ncooldown: " << config.cooldownBars << " bars\n"
                  << "seed: " << config.seed << "\n"
                  << "render: " << renderBars << " bars, "
                  << rendered.baseline.left.size() << " frames, "
                  << (static_cast<double>(rendered.baseline.left.size()) / sampleRate)
                  << " seconds\n";

        for (const auto& event : rendered.events) {
            std::cout << "event: tick " << event.tick
                      << " frame " << clock.frameAtTick(event.tick)
                      << " type " << eventName(event.type);
            if (event.type == flode::JungEventType::InterventionStart ||
                event.type == flode::JungEventType::InterventionStep) {
                std::cout << " step " << event.interventionStep << " rate " << event.rate;
            }
            if (event.decisionRoll >= 0.0) {
                std::cout << " roll " << event.decisionRoll;
            }
            std::cout << " rng_state " << event.rngState << '\n';
        }

        std::cout << "slice: start frame " << window.sliceStartFrame
                  << ", length " << window.sliceLengthFrames << " frames\n"
                  << "bounded difference: frames [" << window.startFrame << ", "
                  << window.endFrame << "), max " << maximumInsideDifference << "\n"
                  << "return verification: exact baseline match outside intervention\n"
                  << "baseline output: " << baselinePath.string() << "\n"
                  << "JUNG output: " << jungPath.string() << "\n"
                  << "verification: PASS\n";
        return 0;
    } catch (const std::exception& error) {
        std::cerr << "flode_jung_v01_render: " << error.what() << '\n';
        return 1;
    }
}
