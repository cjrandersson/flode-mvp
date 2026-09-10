# flöde~ MVP

> **Live browser study:** https://flode-pod-a.cjr-andersson.chatgpt.site  
> **Status:** active Max for Live / Max/MSP prototype plus playable browser study. The project is not yet a complete or runtime-verified instrument.

flöde~ is a six-pod sampler, generative sequencer, audio mangler and looper built around a shared master clock. It develops the clocked unpredictability and modular spirit of the early **I Am The Mighty Jungulator** material into a cleaner, more legible and playable contemporary instrument.

## Start here

- [`PROJECT_CONTEXT.md`](PROJECT_CONTEXT.md) - product definition, current truth and constraints
- [`AGENTS.md`](AGENTS.md) - mandatory instructions for Codex and contributors
- [`docs/JUNGULATOR_LINEAGE.md`](docs/JUNGULATOR_LINEAGE.md) - what the early patches prove and how to study them
- [`docs/UI_SPEC.md`](docs/UI_SPEC.md) - current UI/interaction direction
- [`design/current-grey/2026-09-10/`](design/current-grey/2026-09-10/) - current grey UI references from the 2026-09-10 session
- [`prototype/web-pod-a-2026-09-10/`](prototype/web-pod-a-2026-09-10/) - playable browser mirror
- [`docs/CHANGELOG_2026-09-10.md`](docs/CHANGELOG_2026-09-10.md) - overnight build note
- [`ROADMAP.md`](ROADMAP.md) - implementation sequence and acceptance gates
- [`docs/SOURCE_FILE_MANIFEST.md`](docs/SOURCE_FILE_MANIFEST.md) - handoff inventory

## Current implementation candidates

| Area | Path | Meaning |
| --- | --- | --- |
| Current Pod A | `max/current/flode_podA_MVP_v1.maxpat` | Latest one-pod Max prototype; requires Max/Ableton runtime verification |
| Generative engine | `max/current/js/flode_gen.js` | PURE/JUNG/WEIGHTED/WALK/MEMORY/CHAOS control logic |
| Six-pod experiment | `max/core-phase-01/` | Separate reusable six-pod architecture; not yet merged with the current Pod A |
| Current six-POD visual | `design/current-grey/2026-09-10/full-ui-master-console.svg` | Current grey/satin full-instrument reference |
| Current Pod A visual | `design/current-grey/2026-09-10/pod-a-jung-focus.svg` | Focused POD reference with JUNG controls |
| Browser study | `prototype/web-pod-a-2026-09-10/` | Playable repository mirror of the current interaction study |
| Waveform UI experiment | `max/jsui/flode_transparent_waveform_blue.js` | Custom waveform/UI reference |
| Earlier visual prototype | `prototype/showcase-v4/` | p5.js design/interaction reference, not audio DSP |
| Early Jungulator study | `reference/jungulator/` | Required lineage material; reconstructed and legacy files are clearly labelled |

## Current UI direction

The primary visual target is now the **light grey / satin flöde~ interface developed on 2026-09-10**. It replaces the earlier dark baseline as the current implementation reference.

- Six visibly separated PODs A-F in a 3x2 overview
- Large waveform and direct loop start/end editing
- Focused POD view with the same hierarchy at larger scale
- Directly visible Gen Modes: PURE, JUNG, WEIGHTED, WALK, MEMORY, CHAOS
- Large Random/Jung, Jitter and RND2 performance controls
- Three-band LOW / MID / HIGH EQ in Focus View
- Speed, Loop and Sync controls close to playback interaction
- Restrained identity colour per POD
- Unified lower MASTER strip
- BPM and Tap beside MASTER
- Rec / Play / Stop, Swing, MIDI Clock Out, output metering and master FX in the master area

Fors Opal remains a **principle reference, not a skin to copy**: reduction, hierarchy, coherent parameter families and progressive disclosure without sacrificing flöde~'s waveform-first character.

## Browser study

**Live tested build:** https://flode-pod-a.cjr-andersson.chatgpt.site

The versioned GitHub mirror lives in [`prototype/web-pod-a-2026-09-10/`](prototype/web-pod-a-2026-09-10/). It includes browser audio, a generated demo loop, local audio loading, waveform loop selection, six Gen Modes, Random/Jung, Jitter, RND2, Speed, EQ UI and master controls.

### RND2 finding from the 2026-09-10 test

Audio output was confirmed working. The pitch-changing behaviour was traced to **RND2**.

RND2 currently modulates playback rate / speed, so pitch changes together with speed. The loop start/end range itself is not intended to randomise pitch. Keep this relationship explicit until the DSP architecture decides whether pitch and speed should later be decoupled.

## Locked MVP direction

- Six independent sampler PODs A-F in one resizable instrument
- Large waveform/slice view and direct manipulation per pod
- Drag/drop audio, loop range, speed, volume and pan
- Random/Jung, Jitter and RND2 as performance controls
- Gen modes: PURE, JUNG, WEIGHTED, WALK, MEMORY and CHAOS
- Transient slicing, density and bounded generative variation
- Shared master BPM/clock with Sync/Free operation per pod
- Mute, Solo, Record, Panic and choke groups
- Per-pod FX plus a reorderable master FX chain
- Max for Live / Max patch first; production `.amxd` and standalone packaging later

## Run the current Pod A Max candidate

1. Keep `max/current/js/flode_gen.js` in its committed relative path.
2. Open `max/current/flode_podA_MVP_v1.maxpat` in Max 9.
3. Drop a WAV or AIFF file onto the waveform.
4. Enable Max audio for standalone patch testing.
5. Turn **GEN RUN** on.
6. Select a Gen Mode and adjust **Random / Jung** and **Jitter**.
7. Record all runtime errors and behavioural observations before refactoring.

The presence of both `dac~` and `plugout~` is a development convenience, not proof of a finished `.amxd`. Production Max for Live packaging must be verified inside Ableton Live.

## 2026-09-10 source note

The original high-resolution PNG renders created during the ChatGPT design session remain the visual masters in the conversation/library. The GitHub connector used for this update cannot directly upload those generated PNG binaries, so the current visual references are committed as editable repo-native SVG versions rather than being omitted.
