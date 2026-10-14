#include "flode/Pod.hpp"
#include "flode/WavFileSource.hpp"

#include <audioclient.h>
#include <avrt.h>
#include <ksmedia.h>
#include <mmdeviceapi.h>
#include <wrl/client.h>

#include <algorithm>
#include <atomic>
#include <cmath>
#include <cstdio>
#include <cstdint>
#include <cstring>
#include <exception>
#include <filesystem>
#include <functional>
#include <future>
#include <iomanip>
#include <iostream>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>
#include <thread>
#include <utility>
#include <vector>

namespace {

using Microsoft::WRL::ComPtr;

static_assert(std::atomic<float>::is_always_lock_free,
              "LIVE POD controls require lock-free float atomics");

enum class Command {
    None,
    Play,
    Stop,
    Restart
};

enum class SampleEncoding {
    Float32,
    Pcm
};

struct DeviceFormat {
    SampleEncoding encoding = SampleEncoding::Float32;
    WORD channels = 0;
    WORD containerBits = 0;
    WORD validBits = 0;
    WORD bytesPerSample = 0;
    DWORD sampleRate = 0;
};

struct StartupResult {
    bool ok = false;
    std::string message;
};

class CoTaskMemFormat {
public:
    ~CoTaskMemFormat() { CoTaskMemFree(value_); }

    WAVEFORMATEX** address() noexcept { return &value_; }
    WAVEFORMATEX* get() const noexcept { return value_; }

private:
    WAVEFORMATEX* value_ = nullptr;
};

class WinHandle {
public:
    explicit WinHandle(HANDLE value = nullptr) noexcept : value_(value) {}
    ~WinHandle() {
        if (value_) CloseHandle(value_);
    }

    WinHandle(const WinHandle&) = delete;
    WinHandle& operator=(const WinHandle&) = delete;

    HANDLE get() const noexcept { return value_; }

private:
    HANDLE value_ = nullptr;
};

std::string hresultText(HRESULT result) {
    char text[16]{};
    std::snprintf(text, sizeof(text), "0x%08lX", static_cast<unsigned long>(result));
    return text;
}

void check(HRESULT result, const char* operation) {
    if (FAILED(result)) {
        throw std::runtime_error(std::string(operation) + " failed (" +
                                 hresultText(result) + ")");
    }
}

DeviceFormat describeFormat(const WAVEFORMATEX& format) {
    DeviceFormat result;
    result.channels = format.nChannels;
    result.containerBits = format.wBitsPerSample;
    result.validBits = format.wBitsPerSample;
    result.bytesPerSample = format.nChannels == 0
        ? 0
        : static_cast<WORD>(format.nBlockAlign / format.nChannels);
    result.sampleRate = format.nSamplesPerSec;

    bool isFloat = format.wFormatTag == WAVE_FORMAT_IEEE_FLOAT;
    bool isPcm = format.wFormatTag == WAVE_FORMAT_PCM;
    if (format.wFormatTag == WAVE_FORMAT_EXTENSIBLE &&
        format.cbSize >= sizeof(WAVEFORMATEXTENSIBLE) - sizeof(WAVEFORMATEX)) {
        const auto& extended = reinterpret_cast<const WAVEFORMATEXTENSIBLE&>(format);
        isFloat = IsEqualGUID(extended.SubFormat, KSDATAFORMAT_SUBTYPE_IEEE_FLOAT);
        isPcm = IsEqualGUID(extended.SubFormat, KSDATAFORMAT_SUBTYPE_PCM);
        if (extended.Samples.wValidBitsPerSample > 0) {
            result.validBits = extended.Samples.wValidBitsPerSample;
        }
    }

    if (result.channels == 0 || result.sampleRate == 0 || result.bytesPerSample == 0) {
        throw std::runtime_error("the default audio device returned an invalid mix format");
    }
    if (isFloat && result.containerBits == 32 && result.bytesPerSample == 4) {
        result.encoding = SampleEncoding::Float32;
        return result;
    }
    if (isPcm && (result.containerBits == 8 || result.containerBits == 16 ||
                  result.containerBits == 24 || result.containerBits == 32) &&
        result.validBits > 0 && result.validBits <= result.containerBits &&
        result.bytesPerSample == result.containerBits / 8) {
        result.encoding = SampleEncoding::Pcm;
        return result;
    }

    throw std::runtime_error("unsupported default-device sample format");
}

float channelSample(float left, float right, WORD channel) noexcept {
    if (channel == 0) return left;
    if (channel == 1) return right;
    return 0.0f;
}

void writePcmSample(BYTE* destination, float value, const DeviceFormat& format) noexcept {
    value = std::clamp(value, -1.0f, 1.0f);
    if (format.containerBits == 8) {
        destination[0] = static_cast<BYTE>(std::lround((value + 1.0f) * 127.5f));
        return;
    }

    const auto magnitude = (std::int64_t{1} << (format.validBits - 1)) - 1;
    const auto encoded = static_cast<std::int64_t>(std::llround(value * magnitude));
    const auto raw = static_cast<std::uint64_t>(encoded)
        << (format.containerBits - format.validBits);
    for (WORD byte = 0; byte < format.bytesPerSample; ++byte) {
        destination[byte] = static_cast<BYTE>((raw >> (8U * byte)) & 0xffU);
    }
}

void interleave(BYTE* destination,
                const std::vector<float>& left,
                const std::vector<float>& right,
                UINT32 frames,
                const DeviceFormat& format) noexcept {
    for (UINT32 frame = 0; frame < frames; ++frame) {
        for (WORD channel = 0; channel < format.channels; ++channel) {
            float sample = channelSample(left[frame], right[frame], channel);
            if (format.channels == 1) {
                sample = 0.5f * (left[frame] + right[frame]);
            }

            BYTE* output = destination +
                (static_cast<std::size_t>(frame) * format.channels + channel) *
                    format.bytesPerSample;
            if (format.encoding == SampleEncoding::Float32) {
                std::memcpy(output, &sample, sizeof(sample));
            } else {
                writePcmSample(output, sample, format);
            }
        }
    }
}

void applyCommand(flode::PodEngine& pod, Command command) noexcept {
    switch (command) {
    case Command::Play:
        pod.play();
        break;
    case Command::Stop:
        pod.stop();
        break;
    case Command::Restart:
        pod.seekNormalized(0.0);
        pod.play();
        break;
    case Command::None:
        break;
    }
}

void applyRealtimeControls(flode::PodEngine& pod,
                           const std::atomic<float>& requestedVolume,
                           const std::atomic<float>& requestedPan) noexcept {
    pod.setVolume(requestedVolume.load(std::memory_order_relaxed));
    pod.setPan(requestedPan.load(std::memory_order_relaxed));
}

void runAudio(std::shared_ptr<const flode::AudioSource> source,
              std::atomic<Command>& pendingCommand,
              const std::atomic<float>& requestedVolume,
              const std::atomic<float>& requestedPan,
              std::atomic<bool>& quit,
              std::promise<StartupResult> startup) noexcept {
    bool startupReported = false;
    try {
        check(CoInitializeEx(nullptr, COINIT_MULTITHREADED), "CoInitializeEx");
        struct CoUninitializer {
            ~CoUninitializer() { CoUninitialize(); }
        } coUninitializer;

        ComPtr<IMMDeviceEnumerator> enumerator;
        check(CoCreateInstance(__uuidof(MMDeviceEnumerator), nullptr, CLSCTX_ALL,
                               IID_PPV_ARGS(&enumerator)),
              "create audio-device enumerator");

        ComPtr<IMMDevice> device;
        check(enumerator->GetDefaultAudioEndpoint(eRender, eConsole, &device),
              "open default audio output");

        ComPtr<IAudioClient> audioClient;
        check(device->Activate(__uuidof(IAudioClient), CLSCTX_ALL, nullptr,
                               reinterpret_cast<void**>(audioClient.GetAddressOf())),
              "activate WASAPI client");

        CoTaskMemFormat mixFormat;
        check(audioClient->GetMixFormat(mixFormat.address()), "read device mix format");
        const DeviceFormat deviceFormat = describeFormat(*mixFormat.get());

        WinHandle audioReady(CreateEventW(nullptr, FALSE, FALSE, nullptr));
        if (!audioReady.get()) {
            throw std::runtime_error("create WASAPI event failed");
        }

        constexpr DWORD streamFlags =
            AUDCLNT_STREAMFLAGS_EVENTCALLBACK | AUDCLNT_STREAMFLAGS_NOPERSIST;
        check(audioClient->Initialize(AUDCLNT_SHAREMODE_SHARED, streamFlags,
                                      0, 0, mixFormat.get(), nullptr),
              "initialize WASAPI shared stream");
        check(audioClient->SetEventHandle(audioReady.get()), "set WASAPI event handle");

        UINT32 bufferFrames = 0;
        check(audioClient->GetBufferSize(&bufferFrames), "read WASAPI buffer size");
        if (bufferFrames == 0) {
            throw std::runtime_error("WASAPI returned an empty audio buffer");
        }

        ComPtr<IAudioRenderClient> renderClient;
        check(audioClient->GetService(IID_PPV_ARGS(&renderClient)),
              "open WASAPI render client");

        flode::PodState state;
        state.volume = requestedVolume.load(std::memory_order_relaxed);
        state.pan = requestedPan.load(std::memory_order_relaxed);
        state.loop = true;

        flode::PodEngine pod;
        pod.setSource(std::move(source));
        pod.setState(state);
        pod.seekNormalized(0.0);
        pod.play();

        std::vector<float> left(bufferFrames, 0.0f);
        std::vector<float> right(bufferFrames, 0.0f);

        DWORD mmcssTaskIndex = 0;
        HANDLE mmcssHandle = AvSetMmThreadCharacteristicsW(L"Pro Audio", &mmcssTaskIndex);
        struct MmcssReverter {
            HANDLE value;
            ~MmcssReverter() {
                if (value) AvRevertMmThreadCharacteristics(value);
            }
        } mmcssReverter{mmcssHandle};

        check(audioClient->Start(), "start WASAPI stream");
        startup.set_value({true,
            "WASAPI shared output: " + std::to_string(deviceFormat.sampleRate) + " Hz, " +
            std::to_string(deviceFormat.channels) + " channel(s), buffer " +
            std::to_string(bufferFrames) + " frames"});
        startupReported = true;

        while (!quit.load(std::memory_order_acquire)) {
            const DWORD waitResult = WaitForSingleObject(audioReady.get(), 250);
            if (waitResult == WAIT_TIMEOUT) {
                applyCommand(pod, pendingCommand.exchange(Command::None));
                applyRealtimeControls(pod, requestedVolume, requestedPan);
                continue;
            }
            if (waitResult != WAIT_OBJECT_0) {
                throw std::runtime_error("waiting for WASAPI buffer failed");
            }

            applyCommand(pod, pendingCommand.exchange(Command::None));
            applyRealtimeControls(pod, requestedVolume, requestedPan);

            UINT32 padding = 0;
            check(audioClient->GetCurrentPadding(&padding), "read WASAPI padding");
            if (padding > bufferFrames) {
                throw std::runtime_error("WASAPI reported invalid buffer padding");
            }

            const UINT32 availableFrames = bufferFrames - padding;
            if (availableFrames == 0) continue;

            BYTE* output = nullptr;
            check(renderClient->GetBuffer(availableFrames, &output),
                  "acquire WASAPI render buffer");

            const auto rendered = pod.process(
                {left.data(), right.data(), nullptr, nullptr},
                availableFrames,
                static_cast<double>(deviceFormat.sampleRate));

            DWORD releaseFlags = 0;
            if (rendered == 0) {
                releaseFlags = AUDCLNT_BUFFERFLAGS_SILENT;
            } else {
                interleave(output, left, right, availableFrames, deviceFormat);
            }
            check(renderClient->ReleaseBuffer(availableFrames, releaseFlags),
                  "release WASAPI render buffer");
        }

        check(audioClient->Stop(), "stop WASAPI stream");
    } catch (const std::exception& error) {
        quit.store(true, std::memory_order_release);
        if (!startupReported) {
            try {
                startup.set_value({false, error.what()});
            } catch (...) {
            }
        } else {
            std::cerr << "\nLive audio stopped: " << error.what() << '\n';
        }
    }
}

void printUsage(const char* executable) {
    std::cerr << "Usage: " << executable << " INPUT.wav\n";
}

} // namespace

int main(int argc, char** argv) {
    if (argc != 2) {
        printUsage(argv[0]);
        return 2;
    }

    try {
        const std::filesystem::path inputPath(argv[1]);
        const auto source = flode::WavFileSource::load(inputPath);
        if (source->frameCount() < 2) {
            throw std::runtime_error("input WAV must contain at least two frames");
        }

        std::atomic<Command> pendingCommand{Command::None};
        std::atomic<float> requestedVolume{0.8f};
        std::atomic<float> requestedPan{0.0f};
        std::atomic<bool> quit{false};
        std::promise<StartupResult> startupPromise;
        auto startupFuture = startupPromise.get_future();

        std::thread audioThread(runAudio, source, std::ref(pendingCommand),
                                std::cref(requestedVolume), std::cref(requestedPan),
                                std::ref(quit), std::move(startupPromise));

        const StartupResult startup = startupFuture.get();
        if (!startup.ok) {
            quit.store(true);
            audioThread.join();
            throw std::runtime_error(startup.message);
        }

        std::cout << std::fixed << std::setprecision(3)
                  << "flode POD A live\n"
                  << "source: " << inputPath.string() << '\n'
                  << "WAV: " << source->sampleRate() << " Hz, "
                  << source->channelCount() << " channel(s), "
                  << (static_cast<double>(source->frameCount()) / source->sampleRate())
                  << " seconds\n"
                  << startup.message << '\n'
                  << "Playback started. Commands: [p]lay/resume, [s]top, "
                     "[r]estart, vol 0..1, pan -1..1, [q]uit\n";

        std::string line;
        while (!quit.load(std::memory_order_acquire) && std::getline(std::cin, line)) {
            std::istringstream input(line);
            std::string command;
            input >> command;

            if (command == "p" || command == "play") {
                pendingCommand.store(Command::Play, std::memory_order_release);
            } else if (command == "s" || command == "stop") {
                pendingCommand.store(Command::Stop, std::memory_order_release);
            } else if (command == "r" || command == "restart") {
                pendingCommand.store(Command::Restart, std::memory_order_release);
            } else if (command == "vol" || command == "pan") {
                double value = 0.0;
                std::string extra;
                if (!(input >> value) || !std::isfinite(value) || (input >> extra)) {
                    std::cout << "Usage: " << command
                              << (command == "vol" ? " 0.0..1.0\n" : " -1.0..1.0\n");
                    continue;
                }

                if (command == "vol") {
                    const float clamped = static_cast<float>(std::clamp(value, 0.0, 1.0));
                    requestedVolume.store(clamped, std::memory_order_relaxed);
                    std::cout << "Volume target: " << clamped << '\n';
                } else {
                    const float clamped = static_cast<float>(std::clamp(value, -1.0, 1.0));
                    requestedPan.store(clamped, std::memory_order_relaxed);
                    std::cout << "Pan target: " << clamped << '\n';
                }
            } else if (command == "q" || command == "quit") {
                quit.store(true, std::memory_order_release);
            } else if (!command.empty()) {
                std::cout << "Unknown command. Use p, s, r, vol, pan, or q.\n";
            }
        }

        quit.store(true, std::memory_order_release);
        audioThread.join();
        return 0;
    } catch (const std::exception& error) {
        std::cerr << "flode_pod_v0_live: " << error.what() << '\n';
        return 1;
    }
}
