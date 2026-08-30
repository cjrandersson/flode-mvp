# Jungulator → flöde~ lineage

The early Jungulator files are required study material. They explain the vocabulary and architectural instincts flöde~ grows from, but they do not form a losslessly recovered original source tree.

## Evidence levels

| Level | Meaning |
| --- | --- |
| Observed | Directly present in the original binary strings/object inventory or a readable patch |
| Reconstructed | A modern patch assembled from observed inventory and inferred relationships |
| Interpreted | A UI/product decision derived from the material rather than recovered from it |
| New | A flöde~-specific implementation decision |

Every future architecture note should use these labels.

## Study order

### 1. Original collective

`reference/jungulator/binary/iamthepcjungulator.mxf`

Observed facts:

- old binary Max collective, not JSON `.maxpat`
- approximately 7.29 MiB with five patcher-like sections detected
- extensive `buffer~`, `waveform~`, `vst~`, `coll`, `random`, `counter`, `groove~`, `record~`, delay/resonator, MIDI and routing vocabulary
- references to `poda.vst` through `podi.vst`
- legacy `.pct`, `.pat`, old Windows/Max externals and missing media dependencies

Use it as provenance and evidence. Do not edit it or claim audio parity from a reconstruction.

### 2. Inspection and conversion reports

`reference/jungulator/analysis/`

These reports preserve readable symbols, dependency names and approximate object counts extracted from the binary. They are the best available evidence for concepts that were present, but not for exact patch-cord topology.

### 3. Reconstructed skeleton

`reference/jungulator/patches/iamthepcjungulator_reconstructed_skeleton.maxpat`

This deliberately small patch groups the inferred vocabulary into audio input/output, delay/resonator flow, sample memory, MIDI, clocked randomness and pattern memory. It is a hypothesis map, not recovered source.

### 4. UI redesign shell

`reference/jungulator/patches/iamthepcjungulator_floede_ui_redesign.maxpat`

This adds a modern Presentation Mode shell and named sections: INPUT, FLOW ENGINE, MEMORY, SEQUENCER, PODS and MASTER. It originally retained placeholder `vst~ poda.vst`–`podh.vst` objects. Its value is grouping and lineage visualisation, not verified sound.

### 5. Clean UI shell

`reference/jungulator/patches/iamthepcjungulator_floede_ui_clean.maxpat`

This removes the unresolved VST placeholders to avoid console errors while preserving the interpreted UI structure. It remains a reconstructed shell.

### 6. Pod A progression

`max/experiments/pod-a/`

These builds document the actual flöde~ sampler progression:

- Build 02 / FIXED — broad control-layout experiment
- BUILD02B SAFE — reduced safe playback baseline
- BUILD03A — sampler UX and equal-power pan work
- BUILD03B / 03B1 — audio-output safety experiments
- BUILD03C — waveform/loop-focused version

Codex should diff these patches and record which changes fixed behaviour rather than assuming the highest suffix is universally best.

### 7. Six-pod core experiment

`max/core-phase-01/`

This demonstrates a reusable `flode_pod.maxpat` abstraction instantiated six times with a shared 16-step clock, per-pod probability and independent buffers. It is valuable architectural evidence, but it predates and does not contain the current Pod A UI/generative implementation.

### 8. Current Pod A candidate

`max/current/flode_podA_MVP_v1.maxpat` with `max/current/js/flode_gen.js`

This is the current one-pod candidate. It exposes waveform, Volume, Pan, Gen Mode, Random/Jung and Jitter, and includes standalone/M4L development output paths. It still requires runtime verification and integration with the reusable six-pod architecture.

## What flöde~ should inherit

- Clocked unpredictability rather than unstructured random noise
- Memory and recurrence as musical material
- Multiple semi-independent sound entities/pods
- Direct sample/waveform manipulation
- Performance-oriented controls and immediate mutation
- Shared timing with room for individual behaviour

## What flöde~ should not inherit literally

- Missing `.pct` image controls
- Old VST pod dependencies
- Obsolete Windows/Max external assumptions
- Unverified reconstructed patch topology
- Dense or unclear legacy control layouts
- The original number of pod placeholders when the product decision is six PODs A–F

## Required first study output

Before a major DSP or state rewrite, create `docs/architecture/JUNGULATOR_STUDY_NOTES.md` containing:

1. a functional comparison of the early patches
2. confirmed versus inferred signal flow
3. reusable ideas and rejected legacy assumptions
4. the proposed canonical POD abstraction
5. a runtime-test log from Max 9
