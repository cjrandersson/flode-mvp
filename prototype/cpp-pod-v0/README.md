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

## What the prototype now implements

- `AudioSource` interface;
- dependency-free mono/stereo integer PCM WAV loading (8/16/24/32-bit);
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
- rendered-frame accounting with a silent output tail;
- an offline one-POD renderer with input/output overwrite protection;
- output reload, metadata and non-silence verification;
- standalone CMake smoke tests, including the real Apache Break asset.

## Deliberately not in this checkpoint

1. live audio-device streaming;
2. a host/master-transport trigger adapter;
3. direct START / END manipulation plumbing;
4. transient marker generation and GRID division generation;
5. de-click at region boundaries;
6. 3-band EQ;
7. integration adapter for the eventual host (Max external / JUCE / iPlug2);
8. waveform UI connection using the existing approved UI lab;
9. JUNG, which remains gated on basic playback being audibly verified.

## Build

```sh
cmake -S prototype/cpp-pod-v0 -B prototype/cpp-pod-v0/build
cmake --build prototype/cpp-pod-v0/build
ctest --test-dir prototype/cpp-pod-v0/build --output-on-failure
```

No third-party libraries are required for this checkpoint.

## Render and hear the first Apache POD

Run from the repository root after building:

```sh
prototype/cpp-pod-v0/build/flode_pod_v0_render \
  "patches/flode_alpha_01/media/Apache Break ( Driven Silk Red ).wav" \
  prototype/cpp-pod-v0/build/apache-pod-v0.wav
```

The renderer loads the 24-bit Apache source, passes every frame through
`PodEngine`, writes a 16-bit stereo WAV, reopens it and fails if the output is
corrupt, has unexpected metadata or is silent. The expected default report is:

```text
source: 366863 frames, 2 channel(s), 44100.000000 Hz
pod rate: 1.000000 (speed 1.000000, pitch 0.000000 cents)
rendered: 366863 frames, 8.318889 seconds
verification: PASS (decoded peak 0.707092)
```

Listen with any WAV player, or with FFplay when available:

```sh
ffplay -autoexit -nodisp prototype/cpp-pod-v0/build/apache-pod-v0.wav
```

Expected audible result: one recognizable Apache Break pass, centered with the
POD's equal-power pan law. It is not tempo-stretched, clock-retriggered, looped
or de-clicked in this checkpoint.

Optional positional arguments exercise the locked rate/pitch coupling:

```sh
prototype/cpp-pod-v0/build/flode_pod_v0_render \
  "patches/flode_alpha_01/media/Apache Break ( Driven Silk Red ).wav" \
  prototype/cpp-pod-v0/build/apache-slow-low.wav \
  0.75 -300
```

`SPEED` is a playback-rate multiplier, not another BPM. `PITCH_CENTS` also
changes playback duration; there is deliberately no tempo preservation.

## Verification status

The automated Apache load/render/reload test passes in the cloud runner and is
deterministic across repeated runs. The runner has no audio device, so this is
not a claim that anyone listened there. The actual audible checkpoint remains a
manual listen on CJ's machine before JUNG work begins.
