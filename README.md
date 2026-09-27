<img width="1115" height="680" alt="image" src="https://github.com/user-attachments/assets/3948386f-8366-4539-8d8c-84193204560c" />

# flöde~ MVP

flöde~ is a six-pod sampler, generative sequencer, audio mangler and looper built around a shared master clock/BPM. The project evolves the character and workflow of the original I Am The Mighty Jungulator into a cleaner, more robust Max/MSP / Max for Live / standalone instrument.

---

# 🎛️ DEVELOPMENT COCKPIT

> **Operativ source of truth för projektets aktuella läge.** Uppdatera tavlan när implementation, milestone, ansvar, blocker eller exakt nästa steg förändras. Samma mörka departure-board-design används som i Tydel.

![flöde~ Development Cockpit](assets/graphics/development-cockpit.svg)

| | Aktuellt läge |
|---|---|
| **Nuvarande milestone** | **M0 — Minimal POD v0.1 runtime + state contract** |
| **Status** | 🟡 **PÅGÅR / MANUAL MAX CHECK** |
| **Aktiv implementation** | **`max-msp` only** |
| **Nuvarande mål** | Verifiera Stage 1 innan Apache playback, JUNG-beteende eller UI-expansion |
| **Exakt nästa uppgift** | Verifiera tick/DSP i Max 9 och rapportera resultat i Issue #5 |
| **Nästa owner** | **@cjrandersson** |
| **Codex** | ⏸ **VÄNTAR** — fortsätter POD state/API efter checkpoint |
| **Nästa milestone** | **M1 — Apache Break synkad till shared master clock** |
| **Senast uppdaterad** | **2026-09-28** |

### Milestone progress

- [ ] **M0 — Minimal POD v0.1 runtime + state contract** ← **CURRENT**
  - [x] Additive `flode_alpha_01` Max project
  - [x] Top-level patch + POD abstraction
  - [x] Shared transport + tempo-relative `16n` tick path
  - [x] Instance/POD-scoped buffer naming
  - [x] Bounded gain/pan + silent native audio path
  - [x] Tick routing to POD diagnostics
  - [x] Static JSON / object / cord checks
  - [ ] Manual Max 9 tick/DSP verification — **@cjrandersson**
  - [ ] Authoritative minimal POD state/API — **Codex**
  - [ ] Event envelope + safe execution boundary — **Codex**
  - [ ] Final Stage 1 runtime evidence in Issue #5 — **Codex / @cjrandersson**

- [ ] **M1 — Apache Break playback**
  - [x] Reference audio available in `max-msp`
  - [ ] Stable playback through POD A
  - [ ] Synchronize playback to shared master clock
  - [ ] Preserve playback-rate / pitch coupling

- [ ] **M2 — Constrained JUNG core + first playable POD**
  - [ ] Short memory
  - [ ] Tendency
  - [ ] Weighted probability
  - [ ] Local instability
  - [ ] Rare surprise
  - [ ] Minimal de-click / crossfade
  - [ ] Runnable CJ-playable Alpha checkpoint

> **NEXT DEPARTURE:** `@cjrandersson` verifies tick/DSP in Max 9 → reports Issue #5 → Codex continues locked Stage 1 work.

**Rule:** a meaningful project change is not fully documented until the cockpit reflects the real state and correct owner for every pending action.

**Implementation guardrail:** Alpha work happens on `max-msp`. Do not merge Alpha implementation to `dev` or `main`, modify original Jungulator artefacts, or widen scope before the locked Issue #5 stage permits it.

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
The active Alpha 0.1 implementation is on `max-msp`. The current Stage 1 skeleton exists and the tick-routing correction has passed static checks. Manual Max 9 runtime/DSP verification and the remaining minimal state-contract work are required before Stage 2 playback begins.