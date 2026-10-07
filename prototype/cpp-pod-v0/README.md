# flöde~ POD v0 — C++ Step One

This is the first dependency-free C++ sketch of the locked POD core.

## Signal path

```text
AudioSource
    ↓
active region / slice domain
    ↓
playback cursor
    ↓
effective rate = SPEED × 2^(PITCH_CENTS / 1200)
    ↓
VOLUME
    ↓
PAN
    ├── dry L/R
    └── FX SEND L/R → shared master FX
```

The waveform itself is intentionally not rendered here. The engine exposes
`playheadNormalized()` and normalized active-region/slice state so the UI can
draw a stable waveform with a moving cursor.

## Locked behaviour represented here

- no sample BPM;
- no per-sample BPM detection;
- no time-stretch or tempo-lock;
- no POD-owned clock;
- pitch is clamped to ±500 cents;
- pitch is deliberately rate-coupled, so changing pitch also changes duration;
- transient slicing is the default mode;
- grid is the only fallback slice mode;
- one dry stereo output plus one post-volume/post-pan FX send;
- no JUNG engine.

## What this first commit actually implements

- `AudioSource` interface;
- `PodState`;
- active region bounds;
- play / stop / seek;
- normalized playhead state for waveform cursor motion;
- speed + pitch-cents combined playback rate;
- mono/stereo source handling;
- equal-power pan;
- dry + FX-send rendering;
- loop / one-shot region behaviour;
- normalized slice-marker storage and clamping;
- standalone CMake smoke test.

## Deliberately next, not hidden inside this commit

1. real file-backed audio source;
2. direct START / END manipulation plumbing;
3. transient marker generation and GRID division generation;
4. de-click at region boundaries;
5. 3-band EQ;
6. integration adapter for the eventual host (Max external / JUCE / iPlug2);
7. waveform UI connection using the existing approved UI lab;
8. JUNG only after the POD is musically solid.

## Build

```sh
cmake -S prototype/cpp-pod-v0 -B build/cpp-pod-v0
cmake --build build/cpp-pod-v0
ctest --test-dir build/cpp-pod-v0 --output-on-failure
```

No third-party libraries are required for this checkpoint.
