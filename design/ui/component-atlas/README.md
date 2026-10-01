# flöde~ UI Component Atlas — v0.1

**Status:** Provisional visual/UI research. Six editable SVG studies and design specifications are ready for review. Reference-picture analysis and CJ visual approval are pending.

This atlas follows [CJ's approved brief](CODEX_BRIEF.md), the [JUNG Manifesto](../../../docs/JUNG_MANIFESTO.md) and the [JUNG Brain architecture](../../../docs/JUNG_BRAIN_ARCHITECTURE.md). It describes an implementation-neutral visual system. The [standalone Max 9 prototype](../../../prototype/max9-pod-a/) demonstrates the existing Pod A interaction contract separately.

![JUNG glyph state study](prototypes/jung-glyph-states-v01.svg)

The [p5.js companion](../../../prototype/p5-pod-a/) now runs the same Max renderer/controller for interactive cross-host review. Ten adapter integration checks passed with recorded p5 methods; browser and Max host verification remain pending.

## Contents

- [Component families and specifications](COMPONENTS.md)
- [Design tokens](TOKENS.md)
- [Motion vocabulary](MOTION.md)
- [JUNG glyph concept](JUNG_GLYPH.md)
- [Reference register and review status](references/README.md)

## Editable prototypes

| Study | Purpose |
| --- | --- |
| [Range selection](prototypes/range-selection-v01.svg) | Bounded loop geometry, handles and attached readouts |
| [Pod header](prototypes/pod-header-v01.svg) | Identity, filename, M/S and secondary-action hierarchy |
| [JUNG glyph states](prototypes/jung-glyph-states-v01.svg) | Musical tension and return, with a fixed temporal anchor |
| [Compact knob](prototypes/knob-v01.svg) | A reserved macro-control form with value outside its geometry |
| [Transport](prototypes/transport-v01.svg) | BPM and compact record/play/stop symbols |
| [Meter](prototypes/meter-v01.svg) | Stereo level, peak and explicit clip status |

The illustrations contain static example values. The range study is a selection diagram, not a waveform extracted from audio. All SVGs use editable geometric primitives and local text; no external fonts, embedded raster data, scripts or dependencies are required.

## Proposed visual principles

A waveform owns the primary surface. The pod letter is a stable address; thin boundaries and brackets establish a common coordinate system. Grey carries structure, restrained orange indicates intervention/selection, and cyan marks temporal or modulation information. Readouts stay attached to the geometry they describe.

Controls express user intentions. JUNG exposes temperament and musical state, while its internal probabilities and RNG machinery remain outside the product UI. A glyph can fragment during an intervention while its temporal anchor stays intact; its return geometry exactly matches home.

Motion follows state and time supplied by a controller. It never supplies a new clock. The proposed vocabulary is immediate tracking, bounded displacement, controlled convergence, playhead travel and signal decay.

## Reference analysis

No reference pictures were present under `references/` when the upstream brief was read. The GitHub connection also could not retrieve the repository PNG/attachment images for visual inspection. There is no completed picture-by-picture extraction claim.

Available source and written references were examined:

| Reference | Principle used | Elements omitted from this study |
| --- | --- | --- |
| [Browser showcase source](../../../prototype/showcase-v4/sketch.js) | Two rows of three pods, a large waveform per pod, attached loop handles, compact secondary controls | Guessed playback motion, procedural placeholder waves, engine/quality/detector selectors, dense FX controls |
| [Pod A UI contract](../../POD_A_UI-R&D.md) | One interactive waveform, fixed render layers, amber loop/Jung and cyan Jitter, controller-owned state | Audio/file logic inside UI components, editable slices before native behavior exists |
| [Existing mgraphics sketch](../../v8ui_mgraphics_ui.js) | Thin structural lines, restrained accent, component-sized controls | Broken dimensions, synthetic waveform, six mixer strips as the overall design |
| [Design framework](../../fl%C3%B6de-design-framework.md) | Semantic tokens, stable geometry, pod identity and waveform hierarchy | Decorative hardware treatment; direct production decisions from illustrative studies |
| [JUNG Manifesto](../../../docs/JUNG_MANIFESTO.md) | Stable/restless tension, one bounded intervention and return home | Independent clocks, recursive visual randomness, exposed probability programming |

The requested console, POD-A, modular/data, generative-control, symbolic-icon and micro-visualization pictures are registered individually in [references/README.md](references/README.md) as pending. Add them there for the next visual pass.

## Prototype order and review

1. Range/waveform selection and pod header: establish hierarchy, geometry and pointer ownership.
2. Jung/Jitter sliders, engineering readouts and mode/M/S state: verify the request/state boundary in the standalone Max 9 preview.
3. JUNG glyph: review the five states and canonical return before binding it to an engine.
4. Compact transport, meters and an occasional macro knob: review scale and density after primary surfaces work.

CJ review is needed for picture fidelity, label/value typography, pod accent balance, glyph interpretation, whether motion communicates musical state clearly, and where a knob is functionally justified. The Max 9 prototype requires a host runtime check. These reviews do not mark an Alpha audio milestone complete.

## Files created

`README.md`, `COMPONENTS.md`, `MOTION.md`, `JUNG_GLYPH.md`, `TOKENS.md`, `references/README.md`, and the six named SVGs under `prototypes/`.
