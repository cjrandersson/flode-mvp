# flöde~ Component System v1

## Foundations
Color roles, typography roles, spacing rhythm, geometry, borders, radii, shadows, bevel/depth recipes, focus/interaction states.

## Primitives
### TechnicalLabel
Compact uppercase technical role. Props: `label`, `tone`, `state`.

### ValueDisplay
Canonical recessed digital readout. Props: `valueText`, `accentRole`, `state`. Never computes engineering semantics itself.

### HardwareButton
Variants: `utility | segmented | transport`. States: `idle | active | disabled | focused | pressed`.

### Toggle
Semantic binary primitive where appropriate; presentation selected by variant.

### PanelDivider
Canonical thin architectural separator. No local border recipes.

### StatusDot / Indicator
Functional signal only, not decoration.

## Controls
### Knob
Shared interaction engine, normalized `valueNorm`, pointer lifecycle, keyboard/accessibility contract. Visual variants:
- `primary`: Volume/Pan.
- `eq`: Low/Mid/High.

Anatomy: tick ring, housing, rim, bevel, face, indicator, optional accent arc/status, scale labels, TechnicalLabel, ValueDisplay.

### HorizontalSlider
Anatomy: TechnicalLabel, recessed track, fill, hardware thumb, ValueDisplay. Variants assign functional accent role.

### SegmentedControl
Composes HardwareButton `segmented`; owns selection semantics, not button geometry.

### SpeedControl
Custom flöde~ hardware control derived from reference. Must not render as native browser `<select>` presentation.

### LoopHandle
Single primitive used as `start` or `end`. Full-height line + triangular grips. Pointer-device agnostic.

## Instrument components
### PodHeader
PodBadge + SampleName + utility HardwareButtons.

### WaveformDisplay
Physical module containing viewport and readout bar.

### WaveformViewport
Composition only. Does not fabricate waveform/grid/marker data.

### WaveformData
Renders supplied peak/envelope representation.

### WaveformGrid / SliceMarkers / TransientMarkers
Pure representations of supplied marker arrays.

### LoopRegion
Selection visualization only.

### Playhead
Supplied normalized playback position; visually independent from loop handles.

### WaveformReadoutBar
Three ValueDisplay-like readouts: LOOP START / LENGTH / LOOP END. Values derive from supplied semantic state + duration mapping.

### GeneratorSection
Generation mode + RANDOM/JUNG + JITTER.

### EQSection
Three EQKnob instances using semantic accent roles.

### TransportSection
SpeedControl + LOOP/SYNC HardwareButtons.

## POD composition
POD A–F use the same component tree. POD identity and state are data. No POD-specific copied component code.

## State flow
```
source/audio/host state
        ↓
semantic POD state
        ↓
parameter/display mapping
        ↓
components
        ↓
user interaction
        ↓
semantic change event
        ↓
host / Max / controller
```

The UI must be controllable externally. Internal demo state may exist only in fixtures/stories.
