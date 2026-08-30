# flöde~ MVP

> **Status:** active Max for Live / Max/MSP prototype. The project is not yet a complete or runtime-verified instrument.

flöde~ is a six-pod sampler, generative sequencer, audio mangler and looper built around a shared master clock. It develops the clocked unpredictability and modular spirit of the early **I Am The Mighty Jungulator** material into a cleaner, more legible and playable contemporary instrument.

## Start here

- [`PROJECT_CONTEXT.md`](PROJECT_CONTEXT.md) — product definition, current truth and constraints
- [`AGENTS.md`](AGENTS.md) — mandatory instructions for Codex and contributors
- [`docs/JUNGULATOR_LINEAGE.md`](docs/JUNGULATOR_LINEAGE.md) — what the early patches prove and how to study them
- [`docs/UI_SPEC.md`](docs/UI_SPEC.md) — locked UI/interaction direction
- [`ROADMAP.md`](ROADMAP.md) — implementation sequence and acceptance gates
- [`docs/SOURCE_FILE_MANIFEST.md`](docs/SOURCE_FILE_MANIFEST.md) — complete handoff inventory

## Current implementation candidates

| Area | Path | Meaning |
| --- | --- | --- |
| Current Pod A | `max/current/flode_podA_MVP_v1.maxpat` | Latest one-pod Max prototype; requires Max/Ableton runtime verification |
| Generative engine | `max/current/js/flode_gen.js` | PURE/JUNG/WEIGHTED/WALK/MEMORY/CHAOS control logic |
| Six-pod experiment | `max/core-phase-01/` | Separate reusable six-pod architecture; not yet merged with the current Pod A |
| Waveform UI experiment | `max/jsui/flode_transparent_waveform_blue.js` | Custom waveform/UI reference |
| Visual prototype | `prototype/showcase-v4/` | p5.js design/interaction reference, not audio DSP |
| Early Jungulator study | `reference/jungulator/` | Required lineage material; reconstructed and legacy files are clearly labelled |

## Locked MVP direction

- Six independent sampler PODs A–F in one resizable instrument
- Large waveform/slice view and direct manipulation per pod
- Drag/drop audio, loop range, speed, volume and pan
- Random/Jung and Jitter as large horizontal performance controls
- Gen modes: PURE, JUNG, WEIGHTED, WALK, MEMORY and CHAOS
- Transient slicing, density and bounded generative variation
- Shared master BPM/clock with Sync/Free operation per pod
- Mute, Solo, Record, Panic and choke groups
- Per-pod FX plus a reorderable master FX chain
- Max for Live / Max patch first; production `.amxd` and standalone packaging later

## UI direction

The interface must feel like an audio instrument, not a web dashboard. The visual direction combines Fors-style reduction and hierarchy with flöde~'s larger waveform-first performance controls. Waveforms, playback, Random/Jung, Jitter and Volume stay easy to grab. Rotary knobs are reserved mainly for Pan and FX. No fake hardware, glossy plastic, gradients or grids of tiny controls.

Fors Opal is a **principle reference, not a skin to copy**: show the controls relevant to the current action, keep parameter families coherent, use colour as orientation/state, and let optional Focus View reveal deeper pod editing without shrinking the six-pod overview.

## Run the current Pod A candidate

1. Keep `max/current/js/flode_gen.js` in its committed relative path.
2. Open `max/current/flode_podA_MVP_v1.maxpat` in Max 9.
3. Drop a WAV or AIFF file onto the waveform.
4. Enable Max audio for standalone patch testing.
5. Turn **GEN RUN** on.
6. Select a Gen Mode and adjust **Random / Jung** and **Jitter**.
7. Record all runtime errors and behavioural observations before refactoring.

The presence of both `dac~` and `plugout~` is a development convenience, not proof of a finished `.amxd`. Production Max for Live packaging must be verified inside Ableton Live.

## External demo

No public demo URL is published yet. When one exists, keep it at the top of this README. The browser showcase is available locally in `prototype/showcase-v4/`.
