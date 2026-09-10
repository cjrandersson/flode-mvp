# flöde~ project context

## Product definition

flöde~ is a six-channel sampler with a generative sequencer, audio-mangling and loop functions. Six equal PODs reshape, fragment and recombine audio in real time while remaining tied to a shared master clock/BPM when Sync is enabled.

The aim is a playable instrument that can move from subtle variation to complex self-organising sound without hiding what the generative engine is doing.

## Primary platform

- **Now:** Max 9 / Max for Live development patch
- **MVP package target:** production `.amxd` verified in Ableton Live 12
- **Later:** standalone application/export if the Max/RNBO architecture supports it cleanly
- **Reference prototypes:** browser, p5.js and Figma studies for layout/interaction and rapid interaction testing

## Current truth

The project is not complete.

- `max/current/flode_podA_MVP_v1.maxpat` is the latest one-pod Max candidate.
- `max/current/js/flode_gen.js` implements the six current generative mode algorithms and outputs speed plus future position/velocity intent.
- `max/core-phase-01/` demonstrates a separate reusable six-pod clock/probability structure.
- `prototype/web-pod-a-2026-09-10/` is the current repository browser study and mirrors the interaction model tested on 2026-09-10.
- The live browser study is available at https://flode-pod-a.cjr-andersson.chatgpt.site.
- `design/current-grey/2026-09-10/` contains the current full six-POD and focused POD UI references.
- These branches of work have not yet been merged into one runtime-verified instrument.
- Transient slicing, complete position triggering, robust host sync, session state, pod FX, master FX and final six-pod integration remain incomplete.
- Browser, p5.js and design images are not substitutes for verified Max/Ableton DSP.

## 2026-09-10 tested behaviour

Audio output in the browser study was confirmed working.

RND2 currently modulates playback speed / velocity. Because playback rate changes, pitch changes with it. This was identified during listening tests as the source of the apparent pitch randomisation. The loop start/end range itself is not intended to alter pitch.

Treat this behaviour as explicit current-state documentation until the DSP architecture decides whether speed and pitch should remain coupled or be separated.

## Architectural direction

Build and validate one canonical reusable POD abstraction before instantiating it A-F.

Each POD ultimately owns:

- sample buffer and drag/drop load state
- waveform, playhead, loop and slice positions
- speed/pitch and playback direction
- Volume, Pan, Mute, Solo and Record/status
- Random/Jung amount, Jitter, RND2 and Gen Mode
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

**Random / Jung** controls the depth of generative influence. **Jitter** adds smaller event-level deviation. **RND2** is currently used for speed/velocity modulation in the browser study. Generative modulation must show base value, current generated value and lock/protection state wherever feasible.

## Current UI direction

The approved visual baseline is now the **light grey / satin interface developed on 2026-09-10**, replacing the earlier dark baseline as the primary target.

- 3x2 six-pod overview
- optional Focus View for deeper editing of one pod
- waveform first, then primary playback/mix controls, generative controls and secondary functions
- lower density and larger interaction zones
- clear but subtle boundaries between PODs
- large horizontal Random/Jung, Jitter and RND2 controls
- Volume and Pan remain prominent tactile controls
- three-band EQ uses dedicated knobs in Focus View
- restrained per-POD identity colour on letters, waveform/active states and selected controls
- neutral grey/satin body surfaces with near-black waveform/editing areas
- strong orange orientation for core active controls, with cyan/violet and other accents used deliberately
- six Gen Modes remain directly visible and selectable
- MASTER area is a unified lower strip
- BPM and Tap sit beside MASTER
- Rec / Play / Stop, Swing, MIDI Clock Out, output metering and master FX live in the master strip
- neutral grotesk typography; monospaced numerals where timing/status precision matters
- avoid glossy fake hardware, decorative gradients, glow and dashboard-like visual clutter

Fors Opal informs reduction, hierarchy, component consistency and progressive disclosure. It is not a visual template to clone.

## Current visual references

- `design/current-grey/2026-09-10/full-ui-master-console.svg`
- `design/current-grey/2026-09-10/pod-a-jung-focus.svg`
- `prototype/web-pod-a-2026-09-10/index.html`

The original high-resolution PNG renders from the 2026-09-10 ChatGPT design session remain the visual masters in the conversation/library.

## Historical relationship

The early I Am The Mighty Jungulator collective is design and architectural lineage. It contains evidence of buffer/waveform playback, clocked randomness, memory/pattern systems, MIDI/VST routing, multiple pods and delay/resonator paths. Because the binary collective could not be losslessly decompiled and required old assets/plugins, every inherited decision must identify whether it is observed, inferred or newly designed. See `docs/JUNGULATOR_LINEAGE.md`.

## Definition of MVP complete

MVP is complete only when one six-pod `.amxd` passes the Max/Ableton runtime gates in `ROADMAP.md`, restores state correctly, produces stable stereo audio and exposes the locked performance controls without console errors or broken dependencies.
