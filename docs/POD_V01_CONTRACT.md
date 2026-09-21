# flöde~ POD v0.1 contract

**Status:** `TARGET` contract; runtime implementation not yet created  
**Branch:** `max-msp`  
**Milestone:** Issue #5, Stage 1 — lock the minimal POD v0.1 signal path and state  
**Date:** 2026-09-22

This document fixes the smallest interface needed to build the first playable POD without redesigning the visible product UI or modifying preserved Jungulator material.

## Alpha boundary

The first POD is a developer-facing proof of behaviour. It has one shared master transport, one sample buffer, one playback voice, one stereo output, and an optional constrained JUNG decision layer. It does not introduce additional modes, a production UI, automatic transient analysis, pitch-preserving timestretch, effects, recording, or the one-shot sequencer.

## Ownership

| Layer | Owner | Responsibility |
| --- | --- | --- |
| Master transport | top-level Max patch | The only BPM, run state, and tempo-relative tick source |
| POD user state | POD state layer | Sample reference, gain, pan, base rate, JUNG enable, and seed |
| JUNG runtime state | JavaScript for Max | Short memory, tendencies, weighted decisions, event counter, and RNG state |
| Event execution | native Max | Quantized scheduling, bounded local offset, playback commands, and de-click envelope |
| Audio | native MSP | Buffer read, rate/pitch-coupled playback, gain, pan, and stereo output |

Persistent user state must have one authoritative owner. JavaScript may own transient behavioural history, but it must not duplicate persistent controls as a second source of truth.

## One-clock rule

```text
MASTER BPM / TRANSPORT
        |
   tempo-relative tick
        |
   POD event boundary
        |
 bounded local offset
        |
 playback event
```

There is no free-running POD BPM. Local instability may displace or alter an event, but it must not create a second tempo engine. Stage 1 will use Max's transport and a tempo-relative `metro`; the exact initial subdivision is `16n`.

## Minimal POD state

| Key | Type | Initial value | Bounds / meaning |
| --- | --- | ---: | --- |
| `api_version` | int | `1` | Contract version; reject unsupported values |
| `pod_id` | symbol | `A` | POD identity; Alpha checkpoint implements A only |
| `sample_path` | symbol | empty | Source loaded into the POD buffer |
| `sample_loaded` | int | `0` | Derived runtime state, not a user control |
| `gain` | float | `0.80` | Clamp `0.0–1.0` before DSP |
| `pan` | float | `0.0` | Clamp `-1.0–1.0` |
| `base_rate` | float | `1.0` | Positive normal rate; rate remains pitch-coupled |
| `jung_enabled` | int | `0` | `0` gives stable synchronized playback |
| `seed` | int | `42691` | Deterministic development seed |
| `slice_count` | int | `16` | Equal regions for the first behavioural checkpoint |
| `debug_enabled` | int | `1` | Decision logging; must be disableable |

The state intentionally excludes future sequencer, MEMORY-mode, CHAOS-mode, effects, transient-analysis, preset-browser, and production-UI data.

## Minimal event contract

The JUNG layer emits an ordered Max list. The transport format is deliberately explicit and versioned:

```text
event <apiVersion> <eventId> <podId> <tick> <decision> <sliceIndex> <rate> <offsetMs> <repeat> <reverse> <seedState>
```

Example:

```text
event 1 143 A 32 nearby 7 0.98 3 1 0 187245143
```

| Field | Requirement |
| --- | --- |
| `eventId` | Monotonically increasing within the POD session |
| `tick` | Master-clock tick that requested the decision |
| `decision` | One of `hold`, `repeat`, `nearby`, `different`, or `surprise` |
| `sliceIndex` | Integer clamped to `0..slice_count-1` |
| `rate` | Finite, non-zero playback ratio; negative only when `reverse=1` |
| `offsetMs` | Bounded local displacement; initial hard bound `-12..12 ms` |
| `repeat` | Initial hard bound `1..3` |
| `reverse` | Boolean; rare in the first JUNG implementation |
| `seedState` | Observable deterministic RNG state after the decision |

The playback layer validates every field before it reaches DSP. Invalid events are logged and dropped; they must not be silently converted into unbounded values.

## Locked signal path

```text
drop/load
  -> scoped buffer~
  -> event-selected start/end region
  -> groove~ (rate and pitch coupled)
  -> very short event envelope / de-click
  -> POD gain
  -> POD pan
  -> stereo master output
```

The first implementation uses native Max/MSP throughout this path. JavaScript does not process audio. The envelope corrects discontinuity clicks but must not quantize away local timing or smooth away transient aggression.

## Resource isolation

All named POD resources must include a top-level instance scope and POD identity. The intended abstraction form is:

```text
#1.pod.#2.buffer
#1.pod.#2.state
#1.pod.#2.debug
```

The top-level patch will instantiate the abstraction with its local `#0` scope and POD `A`. Preserved files under `patches/jungulator_*` and `patches/iamthepcjungulator.mxf` remain untouched.

## Observable debug output

For every requested event, log at least:

```text
eventId tick decision slice rate offsetMs repeat reverse seedState
```

Short-memory summaries needed by the first JUNG pass are `sameSliceCount`, `recentAvgRate`, `eventsSinceSurprise`, and `recentIntensity`. A large debugging UI is out of scope.

## Stage 1 exit criteria

Stage 1 is complete only when:

- a new additive Max project and POD abstraction implement this contract;
- exactly one transport drives a `16n` POD tick;
- POD resources are instance-scoped;
- the empty/unloaded patch opens without missing third-party objects;
- state changes and ticks are visible in diagnostics;
- the native audio path is present but cannot emit runaway gain or invalid buffer positions;
- Max-side open/runtime results are recorded in Issue #5.

## Current evidence and status

- `IMPLEMENTED`: this versioned contract.
- `VERIFIED`: upstream `max-msp` head and Issue #5 constraints were inspected; Max 9 is installed on the implementation host.
- `UNVERIFIED`: all new runtime, scheduling, state persistence, DSP, and Max for Live behaviour.
- `BLOCKER`: none for creating the Stage 1 patch. The Apache reference WAV is not present in the repository and will be needed for Stage 2 or must be selected manually by CJ.

## Exact next step

Create the additive `patches/flode_alpha_01/` Max project with a top-level developer harness and `flode_pod_v01.maxpat` abstraction implementing this contract. Validate JSON/object connections, then open it in installed Max 9 and record console/runtime results before declaring Stage 1 complete.

