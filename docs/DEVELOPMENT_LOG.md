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

Status: **SUPERSEDED BY 2026-09-19 RECOVERY SESSION**

The surviving files were instead added under `main/patches/`, which is now treated as the source/reference location for forensic analysis.

This material should be treated as historical/technical reference rather than automatically rewritten or cleaned up.

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
4. Surviving Jungulator source artifacts under `/patches/`
5. `docs/JUNGULATOR_RECOVERY_ANALYSIS.md`

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

# 2026-09-19 — Jungulator source recovery begins

## Goal

Inspect the newly uploaded Jungulator-related source artifacts, determine which material is original/legacy versus reconstructed, assess recoverability, and avoid destroying evidence while preparing for deeper Max/MSP analysis.

## Source material found on `main`

```text
patches/jungulator_notOriginal/iamthepcjungulator_notOriginal.maxpat
patches/jungulator_metro/jungulator_metro.maxproj
patches/jungulator_metro/patchers/jungulator_metro.maxpat
patches/jungulator_audiooptions/patchers/jungulator_audiooptions.maxpat
patches/iamthepcjungulator.mxf
```

## Findings

- `iamthepcjungulator_notOriginal.maxpat` is valid readable Max patch JSON, but the patch identifies itself as a modern UI shell and a `non-lossless reconstruction`. It therefore cannot be treated as authoritative original Jungulator DSP code.
- `jungulator_metro.maxpat` contains older-style Max patching and concrete control/event logic. It is a high-value source for BPM/metro/global-control reconstruction.
- `jungulator_metro.maxproj` contains one local top-level patcher and no declared project search paths. This is useful because it limits what the project metadata itself claims to contain, but it does not prove that the patch has no runtime dependencies through Max send/receive names or externals.
- `jungulator_audiooptions.maxpat` contains concrete `adstatus`-based audio/scheduler configuration logic, including overdrive, takeover and I/O vector-size handling. It is useful historical architecture evidence even where those settings may not map directly to a future Max for Live device.
- `iamthepcjungulator.mxf` is binary and cannot be decoded by the text-only GitHub connector. It is potentially the most valuable remaining source because it may contain original collective payload not present in the text exports.

## Safety decision

No original source file on `main` was modified.

Recovery will be forensic and additive. Mechanically safe repairs, if discovered, will be written separately under `max-msp`, preferably beneath `patches/recovered/`, with provenance notes.

Missing musical/DSP behaviour will **not** be invented merely to make a patch look complete.

## Documentation added

Created:

`docs/JUNGULATOR_RECOVERY_ANALYSIS.md`

This contains the recovery inventory, confidence levels, repair policy and next steps.

## Open questions

- Does the `.mxf` contain the original per-pod mangling patchers or embedded dependencies?
- Are all six pod algorithms present anywhere in the available exports?
- Which send/receive names and hidden patcher relationships connect metro, audio settings and pod logic?
- Which externals or abstractions were bundled with the original collective?
- Can the `.mxf` be opened or extracted in a compatible Max environment without modifying it?

## Next action

1. Preserve/checksum the `.mxf` before experimentation.
2. Test the text `.maxpat` files in Max and capture console errors/missing objects.
3. Build an object/dependency map of the legacy metro and audio-options patches.
4. Inspect/extract the `.mxf` with a binary-aware Max environment.
5. Compare recovered material against existing exports.
6. Only then decide what must be repaired or reconstructed for flöde~.

Status: **RECOVERY IN PROGRESS**

---

# 2026-09-19 — Source artifacts mirrored to `max-msp` + deeper forensic scan

## Goal

Make the surviving Jungulator artifacts directly available to the Max specialist branch without modifying the originals, and deepen the first-pass analysis before any repair attempt.

## Work performed

The source files uploaded on `main/patches/` were mirrored byte-for-byte onto `max-msp` using their existing Git blob objects. No conversion, re-save or content rewrite was performed.

Commit:

`841bc38aa03a1c8c465ad0003217577ca9219422`

This means the Max specialist can now inspect the source material directly while remaining inside the agreed working branch.

## New findings

A deeper serialized-content scan of `jungulator_metro.maxpat` changed our understanding of that file:

- it contains **dozens of `metro` objects** rather than merely one global BPM clock;
- it contains **dozens of `random` objects**;
- observed values include `metro 5`, `metro 10`, `random 40`, `random 100`, `random 7` and `random 8`;
- `sfrecord~ 2` is also present;
- the repeated structures strongly suggest nested/embedded legacy patchers and potentially per-module timing/random logic.

This is important because those repeated clock/random structures may encode part of the Jungulator's characteristic rhythmic mangling behaviour.

An initial text scan did not find obvious `buffer~`, `groove~`, `play~`, `sfplay~` or `index~` objects in the metro export. Therefore the complete sample-playback engine has **not** yet been proven recovered.

The modern `jungulator_notOriginal` reconstruction does contain `groove~ snd 2`, `metro 125`, `random 128` and `coll jungulator_patterns`, but those are reconstruction evidence only and cannot be treated as proof of the original implementation.

## `.mxf` assessment

`iamthepcjungulator.mxf` is approximately 7.64 MB and binary. Current Cycling '74 documentation recognizes `.mxf` as a Max Collective format, which can contain patchers and dependencies. It remains our strongest candidate for missing original pod/DSP material.

No destructive conversion was attempted.

## Files changed

- `docs/JUNGULATOR_RECOVERY_ANALYSIS.md` expanded with the deeper forensic findings, explicit repair policy and controlled `.mxf` recovery path.
- `docs/DEVELOPMENT_LOG.md` updated with this session.

## Decision

Do **not** clean up or rewrite the legacy `.maxpat` exports simply because geometry, hidden objects or old patching idioms look strange. Those may be behavioural evidence.

Only mechanically provable corruption will be fixed, and repaired variants will go under `patches/recovered/`.

## Next action

1. Open the readable legacy patchers in Max and capture Console errors.
2. Map the repeated `metro`/`random` structures object-by-object.
3. Inventory send/receive names, nested subpatchers and dependencies.
4. Open a copy of the `.mxf` in Max without overwriting the original.
5. Export any recoverable embedded patchers separately.
6. Compare recovered code against the text exports before designing the new flöde~ engine.

Status: **FORENSIC RECOVERY ACTIVE**
