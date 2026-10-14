# flöde~ — C++ POD v0

**Scope:** Dependency-free C++17 sample engine and offline JUNG v0.1 test renderer.  
**Current state:** CMake build, offline Apache WAV rendering and a Windows WASAPI live-player CLI. No connected GUI yet. See [Issue #9](https://github.com/cjrandersson/flode-mvp/issues/9).

## Signal path

```text
WAV AudioSource
    ↓
active region / playback cursor
    ↓
rate = SPEED × 2^(PITCH_CENTS / 1200)
    ↓
VOLUME → equal-power PAN
    ├─ dry stereo L/R
    └─ post-volume/post-pan FX-send L/R
```

`PodEngine` exposes normalized region bounds, slice-marker storage and `playheadNormalized()`. It processes audio buffers but does not own an audio device, waveform renderer or independent musical clock.

## Implemented

- WAV input: integer PCM 8/16/24/32-bit, mono/stereo, with sample-rate metadata.
- State: PLAY/STOP, seek, region START/END, LOOP or one-shot, SPEED, PITCH_CENTS, VOLUME, PAN and FX send.
- Processing: source-rate conversion through the playback cursor, rate/pitch coupling, equal-power pan, dry and send buffers.
- Offline output: PCM16 WAV writer and CLI renderer, guarded against input-file overwrite.
- Windows live output: dependency-free WASAPI shared-mode player with PLAY, STOP and RESTART commands.
- JUNG v0.1: deterministic master-tick controller with one bounded slice-repeat intervention and exact return to baseline phase.
- Tests: six CMake/CTest checks for POD, WAV, JUNG timing/rendering and Apache sample rendering.

Current engine limits include SPEED 0.05–4.0, pitch ±500 cents, normalized region/volume values 0–1 and PAN −1…+1. Pitch changes playback rate and duration; no automatic time-stretch or sample BPM detection.

## Build and test

From the repository root:

```sh
cmake -S prototype/cpp-pod-v0 -B prototype/cpp-pod-v0/build
cmake --build prototype/cpp-pod-v0/build
ctest --test-dir prototype/cpp-pod-v0/build --output-on-failure
```

Requires CMake 3.20+ and a C++17 compiler. The current library/CLI has no third-party runtime dependencies.

## Hear POD A live on Windows

From PowerShell at the repository root, configure and build with Visual Studio 2022:

```powershell
$cmakeBin = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2022\BuildTools\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin"
& "$cmakeBin\cmake.exe" -S prototype/cpp-pod-v0 -B prototype/cpp-pod-v0/build -G "Visual Studio 17 2022" -A x64
& "$cmakeBin\cmake.exe" --build prototype/cpp-pod-v0/build --config Release
& "$cmakeBin\ctest.exe" --test-dir prototype/cpp-pod-v0/build -C Release --output-on-failure

& ".\prototype\cpp-pod-v0\build\Release\flode_pod_v0_live.exe" `
  ".\patches\flode_alpha_01\media\Apache Break ( Driven Silk Red ).wav"
```

Playback starts immediately through the current Windows default output device and loops. Press Enter after each command:

- `p` — play/resume
- `s` — stop (silence without closing the device)
- `r` — restart from the beginning and play
- `q` — quit

The program prints the WAV metadata and the WASAPI device mix format only after the default audio endpoint has opened and its stream has started. That proves device initialization, but hearing clean audio still requires a listening check on the selected speakers or headphones.

## Render Apache Break through the POD

```sh
prototype/cpp-pod-v0/build/flode_pod_v0_render \
  "patches/flode_alpha_01/media/Apache Break ( Driven Silk Red ).wav" \
  prototype/cpp-pod-v0/build/apache-pod-v0.wav

ffplay -autoexit -nodisp prototype/cpp-pod-v0/build/apache-pod-v0.wav
```

Expected default: stereo 44.1 kHz PCM16, 366,863 frames / 8.318889 s, one pass. The renderer reloads its output and checks metadata and non-silence. This is **offline file generation**, not live playback.

For a SPEED/PITCH test, add two numeric arguments after the output path, for example `0.75 -300`.

## Render the JUNG v0.1 comparison

```sh
prototype/cpp-pod-v0/build/flode_jung_v01_render \
  "patches/flode_alpha_01/media/Apache Break ( Driven Silk Red ).wav" \
  prototype/cpp-pod-v0/build/apache-baseline-8-bars.wav \
  prototype/cpp-pod-v0/build/apache-jung-v01.wav
```

Experiment settings, deterministic intervention timestamps and listening evidence are documented in [JUNG_V01_EXPERIMENT.md](./JUNG_V01_EXPERIMENT.md). These constants are experimental, not a claim of reproducing the historical algorithm.

## Next real-time milestone

1. Support safe live changes to VOL, PAN, SPEED and LOOP in addition to PLAY/STOP.
2. Connect file LOAD, waveform/playhead and editable START/END controls to engine state.
3. Add minimal loop-boundary de-click and verify the result by listening.

No GUI, transient-analysis generator, three-band EQ or extra JUNG modes are included in this C++ checkpoint. **The immediate acceptance test is Apache Break playing continuously while PLAY/STOP responds in real time.**

> Automated audio tests are deterministic, but they do not prove audible device performance. The live CLI confirms that WASAPI opened and started; a person must still confirm clean audio from the intended output device.
