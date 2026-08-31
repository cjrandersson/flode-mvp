# flöde~ project context

## Product definition

flöde~ is a six-channel sampler with a generative sequencer, audio-mangling and loop functions. Six equal PODs reshape, fragment and recombine audio in real time while remaining tied to a shared master clock/BPM when Sync is enabled.

The aim is a playable instrument that can move from subtle variation to complex self-organising sound without hiding what the generative engine is doing.

## Primary platform

- **Now:** Max 9 / Max for Live development patch
- **MVP package target:** production `.amxd` verified in Ableton Live 12
- **Later:** standalone application/export if the Max/RNBO architecture supports it cleanly
- **Reference prototypes:** p5.js and Figma exports for layout/interaction only

## Current truth

The project is not complete.

- `max/current/flode_podA_MVP_v1.maxpat` is the latest one-pod candidate.
- `max/current/js/flode_gen.js` implements the six current generative mode algorithms and outputs speed plus future position/velocity intent.
- `max/core-phase-01/` demonstrates a separate reusable six-pod clock/probability structure.
- These branches of work have not yet been merged into one runtime-verified instrument.
- Transient slicing, complete position triggering, robust host sync, session state, pod FX, master FX and final six-pod integration remain incomplete.
- The p5 showcase and design images are not DSP implementations.

## Architectural direction

Build and validate one canonical reusable POD abstraction before instantiating it A–F.

Each POD ultimately owns:

- sample buffer and drag/drop load state
- waveform, playhead, loop and slice positions
- speed/pitch and playback direction
- Volume, Pan, Mute, Solo and Record/status
- Random/Jung amount, Jitter and Gen Mode
- transient slicing/density and probability
- Sync/Free mode, timing division and choke group
- optional pod FX and modulation state

Global state owns:

- host/MIDI/internal clock resolution
- BPM, transport, quantisation and swing
- global variation controls and parameter locks
- routing, master FX, output, limiter, recorder and Panic

## Locked Gen Modes

| Mode | Behaviour |
| --- | --- |
| PURE | Independent uniform random values; no weighting or history |
| JUNG | Clocked unpredictability with repeats, pauses and occasional extremes |
| WEIGHTED | Random values biased toward useful regions/targets |
| WALK | Bounded movement derived from the previous state |
| MEMORY | Rolling history that can recur as self-made patterns |
| CHAOS | Nonlinear deterministic feedback constrained to safe ranges |

**Random / Jung** controls the depth of generative influence. **Jitter** adds smaller event-level deviation. Generative modulation must show base value, current generated value and lock/protection state wherever feasible.

## UI direction

The approved baseline is dark, precise, organic and playable:

- 3×2 six-pod overview
- optional Focus View for deeper editing of one pod
- waveform → primary slider → generative controls → secondary functions
- lower density and larger interaction zones
- large horizontal playback/Volume/Random/Jung/Jitter controls
- Pan and selected FX may use knobs
- matte charcoal and near-black surfaces
- restrained per-pod colour on waveform, slider fills and active states only
- neutral grotesk typography; monospaced numerals for timing/status values
- no gradients, glow, glass effects, fake hardware or plastic knobs

Fors Opal informs the reduction, hierarchy, component consistency and progressive disclosure. It is not a visual template to clone.

## Historical relationship

The early I Am The Mighty Jungulator collective is design and architectural lineage. It contains evidence of buffer/waveform playback, clocked randomness, memory/pattern systems, MIDI/VST routing, multiple pods and delay/resonator paths. Because the binary collective could not be losslessly decompiled and required old assets/plugins, every inherited decision must identify whether it is observed, inferred or newly designed. See `docs/JUNGULATOR_LINEAGE.md`.

## Definition of MVP complete

MVP is complete only when one six-pod `.amxd` passes the Max/Ableton runtime gates in `ROADMAP.md`, restores state correctly, produces stable stereo audio and exposes the locked performance controls without console errors or broken dependencies.
