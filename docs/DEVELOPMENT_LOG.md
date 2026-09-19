# flöde~ Development & Collaboration Log

This document is the running project record for the flöde~ MVP. It records important decisions, agent assignments, architecture changes, experiments, implementation steps, reviews, and handoffs.

The goal is to preserve not only *what* was built, but *why* decisions were made, so that Robin, ChatGPT, specialist agents, Codex, and future contributors can work from the same project history.

---

## Project principles

- flöde~ is a six-pod sampler, generative sequencer, audio mangler and looper built in the Max/MSP ecosystem.
- The project inherits an essential part of its musical identity from the old Max/MSP project **I Am The Mighty Jungulator**.
- The Jungulator heritage is not merely visual or conceptual. Its ability to rhythmically jungle, mangle and glitch arbitrary samples while remaining musically connected to other playing material is considered core behaviour.
- Modernising the architecture must not accidentally sanitise or replace this behaviour with a generic sampler engine.
- Max/MSP-native architecture, timing and signal/event design should remain central.
- UI/UX and DSP architecture should be separated cleanly enough that either can evolve without destabilising the other.

---

## Branch strategy

Current working structure:

```text
main
  └── dev
       └── max-msp
```

### `main`
Stable project branch. Do not develop experimental Max/MSP architecture directly here.

### `dev`
Integration branch. Reviewed work can eventually move here.

### `max-msp`
Dedicated Max/MSP / DSP / playback-engine development branch for the specialist Max agent.

At creation/checkpoint, `max-msp` and `dev` were identical at commit:

`2c29986a9f5e2a0a0c97f54d33cf626d170de563`

---

# 2026-09-18 — Max/MSP specialist workflow established

## Collaboration model

- **Robin** — product owner, creative direction, UI/UX, interaction feel, musical judgement and final product decisions.
- **Primary ChatGPT collaborator** — project continuity, architecture oversight, technical direction, documentation, review and coordination.
- **Max/MSP specialist agent** — deep Max/MSP implementation, DSP, timing, patch architecture, playback and generative-engine analysis.

The purpose is not to let separate agents independently redesign flöde~, but to combine specialist knowledge under one shared architecture and project history.

## Architectural priorities

1. Max/MSP-native signal and event architecture.
2. Shared master clock/BPM and musically reliable timing.
3. Jungulator-derived randomisation, probability and jitter behaviour.
4. Six independent pods A–F.
5. Core sample playback: load, start/end, speed, loop, volume and pan.
6. Controlled generative behaviour that can become chaotic without losing musical relationship to master timing.
7. Clear separation between DSP/playback engine, generative/event logic, transport/synchronisation and UI.
8. Transient detection/slicing as an additional layer rather than a replacement for the Jungulator-derived engine.

---

# 2026-09-19 — Jungulator source recovery

## Source material

Surviving Jungulator material is stored under `/patches/`, including legacy Max exports, the `.mxf` collective and the original Windows standalone/runtime environment.

The original standalone is treated as immutable reference material. Recovery is forensic and additive. Missing behaviour will not be invented merely to make old patches appear complete.

A deeper scan of `jungulator_metro.maxpat` found many `metro` and `random` objects, including values such as `metro 5`, `metro 10`, `random 40`, `random 100`, `random 7` and `random 8`, plus `sfrecord~ 2`. This suggests nested/embedded legacy timing and randomisation structures and may encode part of the characteristic Jungulator behaviour.

The complete original sample-playback/mangling implementation has not yet been proven recovered. The working original standalone therefore remains a critical behavioural reference even if perfect source recovery is impossible.

See `docs/JUNGULATOR_RECOVERY_ANALYSIS.md` for detailed forensic notes.

---

# 2026-09-19 — LOCKED PRODUCT / BEHAVIOUR DECISIONS

The decisions below are considered current product requirements for the playable flöde~ alpha. They should not be silently redesigned by implementation agents. Changes require explicit product discussion with Robin.

## 1. Immediate milestone: playable Alpha 0.1

The current priority is **not** architectural completeness or feature completeness.

The milestone is:

> **flöde~ Alpha 0.1 — “Can we make music with it?”**

Minor bugs and incomplete secondary features are acceptable. The alpha must be runnable and musically useful.

P0 functionality:

- six functioning POD engines;
- sample loading/playback;
- shared BPM / master transport;
- Jungulator-derived mangling behaviour;
- controllable relationship between stability and instability;
- one-shot playback and basic sequencing;
- reliable audio output;
- sufficient state handling to use the instrument musically.

Advanced transient systems, elaborate preset infrastructure, complete MEMORY/CHAOS systems, visual polish, complex routing and other secondary features must not delay the playable alpha.

## 2. Jungulator's human character is a core requirement

The characteristic quality to preserve is **not generic randomness**.

Working design principle:

> **Rhythmically constrained, but locally unstable.**

The global musical pulse should remain intelligible while events inside that pulse are allowed to become imperfect, unstable, late/early, short/long, repitched, repeated, reversed or otherwise locally disturbed.

The desired character includes moments that sound human, imperfect, slightly wrong or even temporarily “false”, followed by a return to musical coherence.

Potential contributing mechanisms to investigate rather than assume include:

- multiple asynchronous or semi-independent timing processes;
- timing jitter / microtiming;
- playback-rate changes where time and pitch remain coupled;
- segment-length variation;
- retrigger/repetition behaviour;
- imperfect slice/start positions;
- occasional inclusion or truncation of material around a transient;
- event-ordering quirks;
- correlated rather than purely independent randomness;
- instability that persists briefly before resolving back toward the shared pulse.

Do **not** automatically “fix” old timing irregularities, pitch instability, imperfect slices or scheduler behaviour until we know whether they contribute musically.

The original standalone application is the behavioural oracle for A/B testing.

Drum material should be a primary test source because timing, transient and playback-rate behaviour is especially audible there.

## 3. Improve technical artefacts without sterilising musical artefacts

flöde~ may improve on the original Jungulator where the improvement removes unwanted technical failure without removing its character.

Specifically, sample jumps/start points should support a very short de-click envelope or crossfade to reduce unwanted clicks and pops.

However, clicks and hard edges can sometimes be musically useful, especially when processed by effects. Therefore the engine should preserve the possibility of a raw/hard-edge behaviour rather than enforcing heavy smoothing everywhere.

Conceptual range:

```text
EDGE: RAW <----------> SMOOTH
```

The implementation should use the minimum smoothing necessary to prevent unwanted discontinuity clicks while preserving transient attack and rhythmic aggression.

Design rule:

> **Correct technical artefacts without correcting musical instability.**

## 4. Two complementary POD behaviours

Each POD should be capable of serving two related musical roles.

### LOOP / JUNG behaviour

Longer audio is treated as a landscape through which the Jungulator engine can move.

The engine may manipulate position, segment, rate, repetition, direction, timing and related parameters while remaining connected to master timing.

### ONE-SHOT / SEQ behaviour

A short sample such as kick, snare, hi-hat, percussion or stab is treated as an event.

The sequencer determines **when** it is triggered. Jungulator-derived logic may then determine **how** that particular trigger is played.

This explicitly addresses a weakness of the original Jungulator: isolated one-shot samples were less useful than longer material because there was little temporal material for the mangler to explore.

Sequencing transforms one-shots into a major strength of flöde~.

Example:

```text
Kick:    X---X---X---X---
Hi-hat:  --X---X---X---X-
```

The underlying beat can remain stable while Jungulator behaviour introduces probability, rate/pitch variation, microtiming, retriggering, reverse or other controlled disturbances.

## 5. Basic per-POD sequencer is P0

One-shot sequencing is part of Alpha 0.1 rather than a later decorative feature.

Initial engine model should remain deliberately small. Baseline state may include:

```text
pod_id
pattern
step
active
velocity
probability
pattern_length
```

The first implementation can focus on a 16-step pattern with trigger on/off, velocity, probability and configurable pattern length.

Possible later extensions, not required to block Alpha 0.1:

- microtiming;
- ratchets/retriggers;
- per-step playback rate;
- per-step direction;
- per-step Jung amount;
- alternate rhythmic resolutions;
- polymetric/polyrhythmic pattern lengths.

Different PODs should ultimately be able to use different pattern lengths while sharing the global master clock.

A future per-step Jung amount is particularly interesting because it allows a stable pattern to selectively destabilise individual events rather than globally mangling every trigger.

## 6. Sequencer UI is detachable, state is not

Each POD's sequencer may be opened as a separate window that can be moved away from the main flöde~ interface, including onto another monitor.

This is intended to prevent the primary instrument interface from becoming visually jammed or stressful.

Critical architecture rule:

> **The detachable sequencer is another view of the POD, not another sequencer engine.**

Sequencer state belongs to the POD/engine layer. Closing its window must not stop or reset the sequence.

The view reads and writes shared POD state.

Desired interaction model:

- normally, one sequencer window can follow the currently selected POD;
- a sequencer view can be **pinned/detached** to a specific POD;
- multiple pinned POD sequencer windows may be placed on different screens;
- closing a view has no effect on playback/state;
- UI layout must remain decoupled from DSP/timing/state implementation.

This provides both a simple mode and a multi-monitor/power-user mode without duplicating musical state.

## 7. UI ownership and implementation boundary

Robin owns:

- UI layout;
- spacing;
- visual hierarchy;
- colour system / colour coding;
- transport/BPM/record/play placement;
- how controls are visually exposed;
- overall interaction feel.

The engineering/Max side owns:

- DSP;
- timing and sync;
- playback engines;
- sequencing state and behaviour;
- Jungulator logic;
- routing;
- stable parameter/state interfaces that the UI can control.

Engineering may specify that a parameter/state must exist, but should not redesign the visible interface without explicit product direction.

The UI must not block Alpha 0.1. A temporary developer-facing control surface may be used while the final visual interface evolves separately.

## 8. Current development philosophy

We are **not** trying to restore old Max code merely for historical purity.

We are extracting the musical/behavioural DNA of Jungulator and rebuilding it in a modern, understandable architecture while preserving the qualities that made the original unusual.

Original behaviour should be studied before being modernised.

The intended trajectory is:

```text
preserve
  -> understand
  -> specify behaviour
  -> build playable minimum
  -> A/B against original
  -> tune character
  -> expand
```

The target is not a generic glitch sampler with a Jungulator label. The target is a playable instrument that retains Jungulator's constrained instability while extending it in ways the original could not support, especially sequencing and one-shot performance.

Status: **LOCKED FOR ALPHA 0.1**
