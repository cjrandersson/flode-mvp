# Codex instructions for flöde~

These instructions are mandatory for all work in this repository.

## Source of truth

1. Read `PROJECT_CONTEXT.md`, `docs/UI_SPEC.md`, `docs/JUNGULATOR_LINEAGE.md` and `ROADMAP.md` before changing architecture or UI.
2. Treat `max/current/flode_podA_MVP_v1.maxpat` and `max/current/js/flode_gen.js` as the current one-pod implementation candidate.
3. Treat `max/core-phase-01/` as a separate six-pod experiment. Do not claim it is already integrated with the current Pod A.
4. Treat `prototype/` and `design/` as visual/interaction references only. They are not proof of Max DSP behaviour.
5. Never describe the project as complete until the relevant acceptance gates in `ROADMAP.md` pass inside Max 9 and Ableton Live.

## Required Jungulator study

Before replacing the sampling, timing, memory, probability or pod architecture, study the early material in this order:

1. `reference/jungulator/analysis/iamthepcjungulator_inspection.txt`
2. `reference/jungulator/analysis/iamthepcjungulator_conversion_report.txt`
3. `reference/jungulator/analysis/iamthepcjungulator_readable_symbols_excerpt.txt`
4. `reference/jungulator/patches/iamthepcjungulator_reconstructed_skeleton.maxpat`
5. `reference/jungulator/patches/iamthepcjungulator_floede_ui_redesign.maxpat`
6. `reference/jungulator/patches/iamthepcjungulator_floede_ui_clean.maxpat`
7. The Pod A progression in `max/experiments/pod-a/`
8. The reusable six-pod experiment in `max/core-phase-01/`

Write or update `docs/architecture/JUNGULATOR_STUDY_NOTES.md` with the evidence used for any architectural decision. Distinguish observed evidence, reconstruction, design interpretation and new implementation.

The original `.mxf` is a binary collective and provenance artifact. It is not editable `.maxpat` source and no lossless decompilation is available here. Missing `.pct` assets and legacy `poda.vst`–`podi.vst` dependencies must not be treated as current requirements.

## Product constraints

- Six PODs A–F, sharing master BPM/clock
- Waveform-first hierarchy and large, robust hit areas
- Sliders for playback, Volume, Random/Jung and Jitter
- Knobs mainly for Pan and FX, where rotation is natural
- Required per-pod states: Mute, Solo, Record/status, Gen Mode
- Required Gen Modes: PURE, JUNG, WEIGHTED, WALK, MEMORY, CHAOS
- Generative changes must be legible and bounded
- Host sync, free-running operation and precision interaction must remain explicit
- No tiny knob grids, fake hardware, plastic styling, glow or glassmorphism

## Fors Opal reference

Borrow principles rather than pixels:

- strong hierarchy and few simultaneous visual layers
- consistent component families
- progressive disclosure through overview and optional pod Focus View
- flat digital controls and precise typography
- restrained colour used for state, orientation and modulation feedback
- modular internals under one coherent instrument

Do not copy Fors artwork, typography, layout or proprietary code. flöde~ must remain waveform-led, darker, more spacious and more physically playable than Opal's denser sequencer UI.

## Engineering rules

- Preserve archived and reference files. Add new revisions instead of rewriting provenance.
- Keep reusable pod DSP/UI in abstractions rather than duplicating divergent A–F patches.
- Keep DSP, state and presentation layers separable where practical.
- Use stable scripting names and parameter identifiers before duplicating POD A–F.
- Keep Max for Live parameter ranges, defaults, units and automation behaviour documented.
- Do not introduce external Max packages without documenting the dependency and getting explicit approval.
- Never commit copyrighted Fors assets/code or claim a 1:1 recreation.

## Validation

For every `.maxpat` change:

1. Confirm valid JSON.
2. Confirm every referenced JS/abstraction/media path exists.
3. Inspect for duplicate audio outputs, accidental feedback and global-name collisions.
4. Open in Max 9, use Presentation Mode and record Max Console errors.
5. Test audio on/off, sample load, loop bounds, speed, gain, pan and panic/reset.
6. For `.amxd`, test host transport, tempo sync, automation, state restore and stereo output in Ableton Live 12.

If the runtime is unavailable, label the result **structurally validated, runtime unverified**.

## Repository workflow

- `base` is the approved integration branch.
- Work on focused branches and open PRs into `base`.
- Do not rewrite history or delete archive/reference material.
- Keep an external playable URL at the top of `README.md` once one exists.
