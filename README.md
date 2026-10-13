# flöde~ — C++ POD prototype

**Branch:** `cpp-pod-v0` · **Tracking:** [Issue #8](https://github.com/cjrandersson/flode-mvp/issues/8)  
**Status (2026-10-13):** One POD can load and process WAV audio and produce an audible offline render. A real-time playable instrument is **not implemented yet**.

This branch is a focused, reversible **C++17 prototype** for flöde~'s sample-playback engine and the first bounded JUNG experiment. Its immediate goal is a single POD that plays through an audio device with working LOAD, PLAY/STOP, START/END, LOOP, VOL and PAN. The full six-POD product is not implemented here.

## Current capabilities

- Dependency-free mono/stereo PCM WAV reader (8/16/24/32-bit integer).
- `PodEngine` with play, stop, seek, region boundaries, loop/one-shot, SPEED, pitch-coupled rate, volume, equal-power PAN, dry output and FX-send output.
- Normalized playhead position and slice-marker state (no waveform view or transient analysis yet).
- Offline WAV rendering and source-file overwrite protection.
- Deterministic, master-quantized JUNG v0.1 experiment: one bounded slice-repeat intervention followed by an exact return to the underlying sample timeline.
- CMake build and six registered CTest checks, including Apache WAV rendering.

The actual Apache one-POD render has been listened to successfully. The JUNG v0.1 A/B listening checkpoint has also been accepted as an experiment. **These are offline results, not evidence of real-time device playback.**

## Build and test

Requires a C++17 compiler and CMake 3.20 or later. Run from the **repository root**:

```sh
cmake -S prototype/cpp-pod-v0 -B prototype/cpp-pod-v0/build
cmake --build prototype/cpp-pod-v0/build
ctest --test-dir prototype/cpp-pod-v0/build --output-on-failure
```

## Hear the current POD

Generate a WAV with the included sample:

```sh
prototype/cpp-pod-v0/build/flode_pod_v0_render \
  "patches/flode_alpha_01/media/Apache Break ( Driven Silk Red ).wav" \
  prototype/cpp-pod-v0/build/apache-pod-v0.wav
```

Play the generated file with any audio player, or:

```sh
ffplay -autoexit -nodisp prototype/cpp-pod-v0/build/apache-pod-v0.wav
```

This command **renders a file**; it does not stream live audio. Refer to the [C++ prototype README](prototype/cpp-pod-v0/README.md) for parameter details and to [JUNG v0.1](prototype/cpp-pod-v0/JUNG_V01_EXPERIMENT.md) for the documented A/B render.

## What is pending for a real-time POD

1. **Audio-device callback:** connect `PodEngine::process()` to an audio output stream; confirm stable, continuous playback.
2. **Live parameter control:** provide a thread-safe way to update PLAY/STOP, VOL, PAN, SPEED and LOOP without interrupting audio.
3. **File loading and waveform:** connect LOAD to the WAV reader; display real sample peaks and the engine-owned playhead.
4. **START/END gestures:** connect editable region handles to the existing normalized region state.
5. **Loop-boundary quality:** add minimal de-click treatment and verify uninterrupted looping.

These are implementation tasks, **not completed features**. A simple audible single POD takes priority over further JUNG modes, additional effects or multi-POD orchestration.

## Source map

| Area | Files |
| --- | --- |
| POD state and processing | `prototype/cpp-pod-v0/include/flode/Pod.hpp`, `src/Pod.cpp` |
| WAV input/output | `include/flode/WavFileSource.hpp`, `src/WavFileSource.cpp`, `include/flode/WavFileWriter.hpp`, `src/WavFileWriter.cpp` |
| JUNG controller and render | `include/flode/Jung.hpp`, `src/Jung.cpp`, `src/JungRender.cpp` |
| Offline CLI renderers | `tools/render_pod.cpp`, `tools/render_jung_v01.cpp` |
| Tests and build | `tests/`, `CMakeLists.txt` |

All paths in the last table are relative to `prototype/cpp-pod-v0/`. Work is scoped to this branch; no merge is implied.
