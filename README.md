<img width="1115" height="680" alt="image" src="https://github.com/user-attachments/assets/3948386f-8366-4539-8d8c-84193204560c" />

# flöde~ MVP

flöde~ is a six-pod sampler, generative sequencer, audio mangler and looper built around a shared master clock/BPM. The project evolves the character and workflow of the original I Am The Mighty Jungulator into a cleaner, more robust Max/MSP / Max for Live / standalone instrument.

---

# 🎛️ Development Status — Team Cockpit

> **This is the operational source of truth for where flöde~ is right now.**  
> Update this section whenever implementation status, milestone completion, ownership, blockers or the immediate next step changes.

| | Current state |
|---|---|
| **Current milestone** | **Alpha 0.1 — Stage 1: minimal POD v0.1 runtime + state contract** |
| **Status** | 🟡 **PARTIAL / MANUAL MAX CHECK REQUIRED** |
| **Active implementation branch** | **`max-msp` only** |
| **Verified branch head** | **`2c22912fe631eeefbe202b495203d278699a57bf`** |
| **Current objective** | Finish and verify the minimal one-POD runtime contract before Apache playback, JUNG behaviour or UI expansion |
| **Exact next task** | Open `patches/flode_alpha_01/flode_alpha_01.maxproj` in Max 9 and verify corrected transport/POD tick routing, missing-object state and silent DSP behaviour; record results in Issue #5 |
| **Next-task owner** | 🚨 **@cjrandersson** |
| **Blocked / waiting** | **Codex waits for the manual Max checkpoint before continuing remaining Stage 1 state work** |
| **Next after checkpoint** | **Codex — finish authoritative POD state/API/event-boundary work required by `docs/POD_V01_CONTRACT.md`** |
| **Next major milestone** | **Stage 2 — Apache Break playback synchronized to the shared master clock** |
| **Last updated** | **2026-09-25** |

### Active ownership / pending

| Owner | Pending now | State |
|---|---|---|
| **@cjrandersson** | Run the manual Max 9 Stage 1 checkpoint and report the result in Issue #5 | 🚨 **ACTION REQUIRED** |
| **Codex** | Continue Stage 1 state/API work only after the manual checkpoint | ⏸ **WAITING** |
| **ChatGPT** | Keep product direction, implementation checkpoint and this cockpit synchronized; translate decisions into Codex-ready tasks | 🟢 **ACTIVE RULE** |

> **Ownership rule:** nothing may be marked `pending`, `blocked`, `waiting` or `next` without an explicit owner. If Robin must act, show it explicitly as `🚨 @cjrandersson — <required action>`.

### Alpha 0.1 progress

- [x] **Product / architecture direction**
  - [x] Six-POD MVP direction locked
  - [x] Shared master-clock principle locked
  - [x] POD v0.1 state and signal-path contract written
  - [x] JUNG architecture separated from native Max timing/DSP
  - [x] Deterministic development seed and event contract defined

- [ ] **Stage 1 — Minimal POD v0.1 runtime + state** ← **CURRENT**
  - [x] Create additive `flode_alpha_01` Max project
  - [x] Create top-level patch and POD abstraction
  - [x] Add one shared transport and tempo-relative `16n` tick path
  - [x] Add instance/POD-scoped buffer naming
  - [x] Add bounded gain/pan and silent native audio path
  - [x] Correct tick routing to POD diagnostics
  - [x] Static JSON / object / cord checks
  - [ ] Manual Max 9 verification of corrected tick routing — **🚨 @cjrandersson**
  - [ ] Manual silent DSP / missing-object check — **🚨 @cjrandersson**
  - [ ] Implement authoritative minimal POD state/API ownership — **Codex**
  - [ ] Implement/verify event envelope + safe execution boundary — **Codex**
  - [ ] Record final Stage 1 runtime evidence in Issue #5 — **Codex / @cjrandersson**

- [ ] **Stage 2 — First audible POD**
  - [ ] Load `Apache Break ( Driven Silk Red ).wav`
  - [ ] Stable playback through POD A
  - [ ] Synchronize playback to shared master clock
  - [ ] Preserve intended playback-rate / pitch coupling

- [ ] **Stage 3 — Constrained JUNG core**
  - [ ] Short memory
  - [ ] Tendency
  - [ ] Weighted probability
  - [ ] Local instability
  - [ ] Rare surprise
  - [ ] Minimal de-click / crossfade without smoothing away musical instability

- [ ] **Stage 4 — First CJ-playable Alpha checkpoint**
  - [ ] Runnable Max project with open/run instructions
  - [ ] One POD loads, plays and mangles the reference break
  - [ ] Known limitations documented
  - [ ] Manual Max-side verification recorded

- [ ] **After Alpha 0.1 — expansion toward MVP**
  - [ ] Simplest one-shot sequencer path
  - [ ] Complete Pod A sampler UX
  - [ ] Duplicate stable POD architecture A–F
  - [ ] Choke groups / master transport integration
  - [ ] State recall / robustness / edge-case testing
  - [ ] Integrate approved Figma UI direction without destabilizing DSP

**Rule:** a meaningful project change is not fully documented until this cockpit reflects the real state **and the correct owner for every pending action**.

**Implementation guardrail:** current Alpha work happens on `max-msp`. Do not widen scope into Apache playback, JUNG implementation, sequencer work, effects or production UI until Stage 1 exit criteria are satisfied.

---

## Locked MVP direction
- Six independent sampler pods A–F in one window
- Large Simpler-inspired waveform/slice view per pod
- Drag/drop audio, loop start/end, speed, volume, pan
- Original Jungulator controls retained and made clearly visible
- RND: slice/sample-position probability amount
- RND2: velocity/playback-speed variation
- Random modes: Jung, Weighted, Walk, Memory, Chaos
- Transient slicing and density control
- Sync/free operation per pod; shared master clock and BPM
- Mute, Solo, Record, Panic and choke groups
- Per-pod FX and reorderable master FX chain
- Separate resizable flöde~ BPM/transport window

## UI baseline
The interface must feel like an audio instrument, not a web dashboard. Waveforms and primary gestures are large. Playback/random/volume use sliders. Rotary knobs are reserved mainly for pan and sound-shaping/FX. Matte charcoal/grey surfaces, restrained amber accents, neutral typography, minimal rounding, stable interaction states.

## Repository structure
- `docs/` build plan and UI specification, basic architecture of Max/MSP + javascript, peer-review of technical architecture by Copilot (see ARCHITECTURE_REVIEW.md)
- `patches/` Max/MSP builds
- `prototype/showcase-v4/` current p5.js visual prototype
- `design/figma-export/` current Figma AI export reference

## Current build status
The active Alpha 0.1 implementation is on `max-msp`. The current Stage 1 skeleton exists and the tick-routing correction has passed static checks, but the corrected patch still needs manual Max 9 runtime/DSP verification and the remaining minimal state-contract work before Stage 2 playback begins.
