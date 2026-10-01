# Component families

**Status:** R&D specification. Important prototypes are described below; all mappings are visual/controller contracts, not production DSP changes.

## Family map

| Family | Purpose and primary semantic input |
| --- | --- |
| Waveform | Real cached min/max pairs, domain, playhead |
| Loop/selection | Normalized ordered start/end and minimum span |
| Transient/slice markers | Controller-supplied positions, selected marker |
| Knob | Occasional compact macro, normalized value |
| Fader | Continuous level or normalized expressive amount |
| Buttons | Discrete requests and confirmed states |
| Transport | Shared run/record state, BPM and host sync |
| Numeric/data readout | Controller-formatted units and edit requests |
| Meters | Authoritative signal level, peak and clip |
| Status indicators | Loaded/sync/mute/active/error with an explicit label |
| Brackets/construction lines | Stable coordinate system and boundaries |
| POD identities A–F | Large pod address and restrained accent |
| Compact master controls | Shared controls grouped around one transport |
| Micro-data visualization | A short controller-supplied history or scalar trend |
| JUNG state visualization | Musical state and return relationship |
| Generative geometric glyph | Bounded shape variants with a canonical home |
| Expand/collapse/inspector | Optional context in a fixed region, retaining primary gesture space |

## Waveform, range and markers

**Purpose:** make audible domain, selected region and phrase position legible. **Geometry:** waveform owns the broad upper panel; ruler and readouts remain attached. The range study is 660 × 200 with a 612 × 114 field. Start/end lines have triangular caps and lower grips. Use one interactive canvas with layered passes.

**Typography:** small domain labels and larger controller-formatted readouts. **States:** empty, cached/loaded, selected range, selected marker and disabled. **Interaction:** handles before markers before body; move a body without changing its span; selectable markers are not editable in this stage. Double-click requests reset.

**Mapping:** 0 ≤ start ≤ end − minLoop; end ≤ 1. Peaks are cached −1…1 min/max pairs, never procedural decoration. Shift bypasses snap. Controller owns domain and engineering-unit strings. **Motion:** direct pointer tracking, controller-positioned playhead. **Readability:** handles have larger hit regions than their glyphs; endpoints remain identifiable when close.

**Max:** one `v8ui` waveform, device-local versioned Dict cache, silent setters and semantic begin/change/commit events. Buffer analysis stays in a controller. **SVG/web:** group background/peaks/grid/selection/endpoints/marker/playhead separately inside one hit surface. See [range study](prototypes/range-selection-v01.svg) and the [standalone Max preview](../../../prototype/max9-pod-a/).

## Header, POD identity and buttons

**Purpose:** locate a pod and provide confirmed discrete state. **Geometry:** a 54-high header with a large A–F address, filename, compact M/S and restrained secondary actions. A thin rule fixes its relation to the waveform.

**Typography:** prominent identity; readable filename; short button labels. **States:** normal, hover, pressed, selected and disabled. **Interaction:** a request may have immediate press feedback; selected state changes only on controller confirmation. Unsupported actions stay disabled and emit nothing.

**Mapping:** discrete desired state, not a local persistent toggle. Global solo policy belongs to the controller. **Motion:** immediate press/confirmation, optional brief colour transition. **Readability:** M/S remain literal labels, selected state has an explicit mark/border, long filenames ellipsize without moving controls.

**Max:** instantiate the shared header component with pod identity; keep IO/file operations outside it. **SVG/web:** separate identity, filename and action groups. See [header study](prototypes/pod-header-v01.svg).

## Knobs, faders and temperament controls

**Purpose:** express a continuous intention with little visual weight. Use horizontal faders for Jung/temperament and temporal/modulation amounts; reserve compact knobs for parameters whose function benefits from a circular gesture.

**Geometry:** knob study radius 24, 270° sweep and detached value. Fader uses a recessed track, restrained filled portion and a clear handle. **Typography:** semantic parameter label plus controller-unit value. **States:** idle, hover, active gesture, confirmed value and disabled.

**Interaction:** vertical knob drag or horizontal fader drag; Shift reduces sensitivity. Neither animation nor controller echoes may delay pointer tracking. **Mapping:** UI emits 0…1; controller maps units. For temperament, show musically meaningful stable/restless context rather than probability weights, seed controls or an internal RNG diagram.

**Motion:** immediate tracking. **Readability:** no dense grid of knobs; values supplement geometry and colour. **Max:** common sizing/value adapter; separate gesture preview from authoritative state. **SVG/web:** preserve handle geometry and place value outside the pointer target. See [knob study](prototypes/knob-v01.svg) and the native Jung/Jitter slider assets.

## Numeric readouts and steppers

**Purpose:** show precise engineering units without inventing mapping in a renderer. **Geometry:** value field with fixed −/+ regions; the field size never changes with value. **Typography:** tabular-looking value, short uppercase label.

**States:** idle, pressed/dragged, confirmed, disabled and invalid/unavailable data. **Interaction:** vertical field drag and discrete −/+; an optional future text edit needs explicit controller commit. **Mapping:** normalized begin/change/commit plus control identity; controller supplies display text verbatim. Bind display revisions to preview values to defer intermediate echoes.

**Motion:** no easing. **Readability:** keep signs/units visible and allow useful pointer targets. **Max:** the current shared stepper implements slice and speed without audio mutation. **SVG/web:** separate text from scalar fill/gesture logic; use the same semantic event names.

## Transport and compact master controls

**Purpose:** expose one shared time source. **Geometry:** the study groups BPM, record/play/stop symbols, signature and host status in 430 × 105. Master fields should remain compact and outside the pod waveform.

**Typography:** BPM is the main value; other labels are structural. **States:** stopped, playing, recording, externally synced and disabled/unavailable. **Interaction:** emit high-level requests; confirmed transport state comes from its owner. **Mapping:** engineering BPM and time signature belong to the master controller; UI gestures normalize where appropriate.

**Motion:** confirmed-state changes and authoritative phase only. **Readability:** symbols have accessible names/tooltips in implementation and selected state is explicit; distinguish recording from playback. **Max:** native transport/controller owns timing; UI must not create tempo. **SVG/web:** prototype symbols are ordinary primitives. See [transport study](prototypes/transport-v01.svg); no transport is implemented here.

## Meters, status and micro-data

**Purpose:** expose actual signal/state information. **Geometry:** compact stereo fields, adjacent peak number and explicit clip indication; secondary micro-data uses a fixed-width line/mark field. **Typography:** short source label, numeric peak and literal CLIP.

**States:** no signal, level activity, held peak, clip and unavailable source. **Interaction:** read-only; a clip-reset request is a possible later control. **Mapping:** controller supplies level, calibrated unit text and clip state; do not fabricate activity. History data describes musical context or signal behavior, not individual hidden JUNG probabilities.

**Motion:** authoritative rise and bounded display decay; no random idle movement. **Readability:** peak text and clip marks remain visible without colour; distinguish unavailable from silence. **Max:** meter data is decimated outside the renderer; redraw at display cadence. **SVG/web:** the study has illustrative values, not a live level. See [meter study](prototypes/meter-v01.svg).

## JUNG glyph and geometry

**Purpose:** communicate tension, intervention and return. **Geometry:** bounded six-edge variants around an immutable cyan temporal anchor. **Typography:** literal state label. **States:** HOME, RESTLESS, INTERVENTION, RESOLVING, RETURN HOME.

**Interaction:** read-only behavior feedback. **Mapping:** semantic state/progress from a controller, with an optional separate high-level temperament request. **Motion:** bounded displacement then monotonic convergence to exactly canonical home. **Readability:** the anchor and state text persist throughout; reduced motion changes state marks without movement.

**Max/SVG/web:** use matching edge pairs in normalized local coordinates; no recursive visual randomness or new clock. Details and review criteria are in [JUNG_GLYPH.md](JUNG_GLYPH.md).

## Inspectors and construction lines

**Purpose:** add context without turning the primary UI into a dense parameter sheet. **Geometry:** brackets, thin rules and a small expansion symbol reserve a stable inspector field. **Typography:** short section label and readable semantic data.

**States:** collapsed, expanded, selected context and unavailable content. **Interaction:** emit a discrete expansion request; retain primary waveform/gesture geometry. **Mapping:** view state only, not audio changes. **Motion:** immediate or bounded reveal within 100 ms. **Readability:** a named expansion control, keyboard-accessible where supported.

**Max:** draw context in a dedicated component and keep persistent inspector state external. **SVG/web:** semantic groups and explicit expanded state; no animated layout that moves an active control. No inspector behavior is implemented in v0.1.

## Implemented reference elements — v0.2

[The isolated library](../../../prototype/ui-reference-elements/) supplies pod identity, read-only range construction, relative fader/knob gestures, readouts, explicit-data meters, deterministic JUNG glyphs and six named icon requests. All eight families share rect/line/poly/circle/text geometry across Max mgraphics, p5.js and SVG. The narrowed POD A lab keeps its nine primary component instances and real audio-cache path.

Jersey 10 carries labels/POD letters; IBM Plex Mono carries numeric values/units. This pairing was chosen by CJ. Local browser fonts are awaited before drawing; Max requires OS-installed fonts. SVG exports embed the used faces. Font metrics/legibility still require actual-host review.

The kit's range is deliberately a selection diagram without sample peaks. Meters show NO LEVEL DATA until explicitly supplied; transport symbols emit requests and wait for external confirmation. No clock, engine policy or production UI binding is introduced.
