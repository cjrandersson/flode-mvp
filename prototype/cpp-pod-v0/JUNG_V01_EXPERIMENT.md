# JUNG v0.1 — first experimental intervention

## Status and provenance

This is a new CJ-approved experiment informed by forensic evidence from the
original Jungulator. Its parameter values are **not** claimed to reconstruct the
original algorithm.

The experiment implements one behavior only: a bounded, master-quantized
snare-rush slice repeat followed by an exact return to the uninterrupted Apache
timeline.

## Fixed configuration

| Parameter | Value |
| --- | ---: |
| Master BPM | `115` (provisional) |
| Meter | `4/4` |
| Master grid | `16n` (`4` ticks per beat) |
| Decision cadence | every `4` bars / `64` ticks |
| Intervention probability | `15%` |
| Seed | `42691` |
| Intervention duration | `4 × 16n` ticks |
| Slice length | `1 × 16n` tick |
| Repeat depth | `4` retriggers |
| Playback-rate contour | `1.0, 1.5, 1.5, 1.0` |
| Cooldown | minimum `4` bars after return |
| Comparison length | `8` bars |

SplitMix64 is specified directly in the controller so the random sequence is
reproducible across standard-library implementations. Seed `42691` produces a
first eligible roll of `0.13691238828509866`, which is below `0.15`.

## One-clock execution

```text
MASTER 115 BPM / 16n TICKS
            |
      tick 64 decision
            |
   roll 0.136912 < 0.15
            |
 IDLE → RUSH [ticks 64, 65, 66, 67] → RETURN [tick 68] → IDLE
             rates 1.0, 1.5, 1.5, 1.0
```

There is no POD-owned BPM or free-running intervention timer. Every transition
is requested by the same `MasterClock` tick sequence.

At tick 64 the renderer captures one `16n` source slice from the baseline Apache
position. It retriggers that same slice once per tick. `PodEngine::speed` applies
the contour, so time and pitch remain coupled. While active, the controller does
not evaluate another decision.

At tick 68 the POD returns to:

```text
master output frame modulo source frame count
```

This is the exact sample position the uninterrupted baseline occupies at the
same master frame. Completed-intervention memory affects future decisions only:
the next four-bar decision at tick 128 is blocked by cooldown without consuming
another random value.

## Build and automated validation

Run from the repository root:

```sh
cmake -S prototype/cpp-pod-v0 -B prototype/cpp-pod-v0/build
cmake --build prototype/cpp-pod-v0/build
ctest --test-dir prototype/cpp-pod-v0/build --output-on-failure
```

The tests cover:

- master tick-to-frame positions;
- the seed and exact decision rolls;
- the four-step rate contour;
- explicit intervention duration and return;
- no decision while an intervention is active;
- cooldown without RNG consumption;
- identical replays from the same seed;
- audio equality before the intervention;
- a non-zero audio difference during the intervention;
- exact baseline equality after return;
- loading, rendering and reopening the real Apache WAV pair.

## Generate the listening pair

```sh
prototype/cpp-pod-v0/build/flode_jung_v01_render \
  "patches/flode_alpha_01/media/Apache Break ( Driven Silk Red ).wav" \
  prototype/cpp-pod-v0/build/apache-baseline-8-bars.wav \
  prototype/cpp-pod-v0/build/apache-jung-v01.wav
```

Expected deterministic metadata:

```text
stereo PCM16, 44100 Hz
736278 frames
16.695646259 seconds
intervention frames [368139, 391148)
source slice start 1276, length 5752 frames
```

Expected SHA-256 values:

```text
03f22bc90109da0663a04cf42fcf5f5c578078beefc1294b4b967df1c69aac66  apache-baseline-8-bars.wav
215b81138562d9367782fe04400fd55cc980af8a52cdff824106936a341fac6d  apache-jung-v01.wav
```

## Listening procedure

Listen to the baseline first, then the JUNG version:

```sh
ffplay -autoexit -nodisp prototype/cpp-pod-v0/build/apache-baseline-8-bars.wav
ffplay -autoexit -nodisp prototype/cpp-pod-v0/build/apache-jung-v01.wav
```

The first four bars are identical. At approximately `8.348 s`, JUNG repeats one
sixteenth-note slice four times. The middle two repeats run at `1.5x`, so they are
shorter and pitched higher rather than time-corrected. At approximately `8.870 s`
the output returns to the exact baseline phase and remains identical for the rest
of the file.

CJ should evaluate:

1. Does the intervention read as an intentional rush rather than a generic glitch?
2. Is the `1.5x` center of the contour too mild or too aggressive?
3. Does the tick-68 return feel rhythmically coherent?
4. Are the raw retrigger boundaries musically useful, or do they require a minimal
   de-click treatment before the next experiment?

## Known limitations

- `115 BPM` is a provisional master setting; the Apache source is not analyzed,
  stretched or tempo-locked.
- The Apache loop is natural-time playback, so its `8.318889 s` duration does not
  exactly equal four bars at 115 BPM (`8.347826 s`).
- Retrigger boundaries are deliberately raw in this first listening experiment;
  no new smoothing parameter was invented.
- This is an offline comparison renderer, not live device streaming.
- Memory is deliberately limited to the completed-event cooldown.
- There are no additional modes, UI controls, or JUNG decisions.

Passing tests establish timing, bounds and reproducibility. They do not establish
musical success; that decision belongs to CJ's listening checkpoint.
