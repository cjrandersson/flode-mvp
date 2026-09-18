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

No Max-agent implementation had yet diverged from `dev`.

---

# 2026-09-18 — Max/MSP specialist workflow established

## Context

During development it became important to protect the characteristic behaviour inherited from **I Am The Mighty Jungulator**. There was concern that flöde~ was gradually becoming architecturally closer to a conventional modern sampler and moving away from the Max/MSP mechanisms and musical unpredictability that motivated the project.

A specialist Ableton / Max/MSP agent is therefore being introduced as an additional technical collaborator.

The collaboration model is intentionally split:

- **Robin** — product owner, creative direction, interaction/UI feel, musical judgement and final product decisions.
- **Primary ChatGPT collaborator** — project continuity, architecture oversight, product/UX integration, documentation, review and coordination between contributors.
- **Max/MSP specialist agent** — deep Max/MSP implementation, DSP, timing, patch architecture, playback and generative engine analysis.

The purpose is not to let separate agents independently redesign flöde~, but to combine specialist knowledge under one shared architecture and project history.

## Repository review

The `max-msp` branch was inspected before specialist work began.

Current top-level structure includes:

```text
README.md
design/
docs/
patches/
prototype/
```

Relevant documentation already present includes:

- `docs/ARCHITECTURE_REVIEW.md`
- `docs/BUILD_01_CORE_ENGINE.md`
- `docs/BUILD_PLAN.md`
- `docs/UI_SPEC.md`
- `docs/Technical architecture review for Codex.md`
- `docs/FLODE_Architecture_Review_v2.pdf`
- `docs/FLODE_GRUNDARKITEKTUR_MAX_MSP_JAVA-Notes_från_Copilot.pdf`

At this checkpoint the repository contains substantially more architecture/design documentation than actual Max patch implementation. `patches/` currently contains only its README in this branch.

This makes examination of the original Jungulator patch especially important before a new engine architecture is committed.

---

## Original Jungulator reference

Robin will upload the available original `.maxpat` from **I Am The Mighty Jungulator** to:

```text
/reference/jungulator/
```

Status: **WAITING FOR UPLOAD**

This file should be treated as a historical/technical reference rather than automatically rewritten or cleaned up.

Before implementation, the specialist should investigate how the original patch achieves its characteristic behaviour, including where applicable:

- timing and clock relationships
- sample playback mechanism
- randomisation
- `rnd` / `rnd2` behaviour
- probability/event generation
- loop/start/end manipulation
- playback-rate changes
- rhythm preservation or quantisation
- interaction between randomness and master timing
- event ordering
- any unusual Max idioms that contribute to the musical result

The objective is to identify the **behavioural DNA** worth preserving, not necessarily to copy the old patch object-for-object.

---

## Max/MSP specialist — first assignment

**Do not begin implementation yet.**

The specialist's first task is repository and architecture analysis.

### Required reading

1. Root `README.md`
2. Existing documentation under `/docs`
3. Relevant prototype/design material where needed to understand the instrument
4. Original Jungulator `.maxpat` once available in `/reference/jungulator/`

### Analysis deliverable

Report:

1. What currently exists in the repository.
2. What is missing for a functioning Max/MSP MVP.
3. Which existing architecture decisions are technically sound.
4. Which existing decisions should be reconsidered, and why.
5. A proposed real Max/MSP patch architecture.
6. Which behaviours/mechanisms in the original Jungulator should be preserved.
7. Which parts can safely be modernised or replaced.
8. Risks that could cause flöde~ to lose the original Jungulator character.
9. A proposed first implementation milestone after review.

No large architectural implementation should begin until this analysis has been reviewed.

---

## Architectural priorities for specialist work

In current priority order:

1. Max/MSP-native signal and event architecture.
2. Shared master clock/BPM and musically reliable timing.
3. Jungulator-derived randomisation, probability and jitter behaviour.
4. Six independent pods A–F.
5. Core sample playback: load, start/end, speed, loop, volume and pan.
6. Controlled generative behaviour that can become chaotic without losing musical relationship to the master timing.
7. Clear separation between DSP/playback engine, generative/event logic, transport/synchronisation and UI.
8. Transient detection/slicing as an additional layer rather than a replacement for the Jungulator-derived engine.

Previously discussed transient analysis options include `bonk~` and `sigmund~`; the final implementation should be evaluated technically rather than chosen solely because it appeared in an earlier concept.

---

## Working rules for `max-msp`

The Max specialist should:

- work only on `max-msp` unless explicitly instructed otherwise;
- not commit directly to `dev` or `main`;
- prefer small, understandable commits;
- document important architecture decisions;
- avoid large rewrites before the Jungulator analysis is complete;
- preserve reference files rather than modifying them destructively;
- flag uncertain musical/UX decisions for Robin rather than silently choosing them;
- distinguish technical improvements from changes to the instrument's intended behaviour.

Reviewed work can later move:

```text
max-msp → dev → main
```

---

## Documentation protocol from this point forward

This file is intended to remain a chronological project journal.

For meaningful development sessions, append an entry containing as appropriate:

```text
DATE / SESSION
Goal
Context
Work performed
Files changed
Architecture decisions
Reasoning
Tests / observations
Open questions
Next action
Status
```

Major technical decisions should additionally be documented in dedicated architecture documents when the detail would make this log unwieldy.

The log should record failed experiments and rejected approaches when they teach us something important. The history of *why we did not do something* is often as useful as the final implementation.

---

## Immediate next action

**Owner: Robin**

Upload the original Jungulator `.maxpat` into:

```text
/reference/jungulator/
```

After Robin confirms the upload:

1. Verify the file exists and is readable.
2. Inspect its structure before modifying anything.
3. Hand the Max/MSP specialist the analysis assignment above.
4. Review the specialist's findings jointly.
5. Agree on the first Max/MSP implementation milestone.
6. Only then begin engine implementation.

Status: **IN PROGRESS**
