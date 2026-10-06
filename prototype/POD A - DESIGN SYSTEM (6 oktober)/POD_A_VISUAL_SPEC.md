# POD A Visual Specification v1

## 1. Reference coordinate system
**MEASURED:** master reference is 1448 × 1086 px, 4:3. All measurements below are reference-space estimates and should also be stored normalized to width/height. Do not upscale before measurement.

## 2. Macro geometry
Approximate high-confidence reference landmarks:
- Global left margin: ~31 px.
- Main right edge: ~1375–1380 px.
- Header divider: y ~81 px.
- POD content begins: y ~98 px.
- Primary vertical divider: x ~288 px.
- Main work surface begins: x ~304 px.
- Waveform outer module: x ~304–1375 px, y ~213–473 px.
- Waveform viewport: y ~229–427 px.
- Generation mode band: y ~489–548 px.
- Generator/EQ region: y ~578–820 px.
- Transport region: y ~871–953 px.
- Lower divider: y ~983 px.

**STANDARDIZED:** treat the primary control rail as approximately 20% and the main work surface as approximately 80% of usable instrument width. Do not substitute a generic 25/75 twelve-column split.

## 3. Structural hierarchy
```
GlobalHeader
└── PodSurface
    ├── IdentityRow
    │   ├── PodBadge
    │   ├── SampleName
    │   └── UtilityActions (LOAD / MUTE / SOLO)
    ├── PrimaryControlRail
    │   ├── Volume
    │   └── Pan
    └── MainWorkSurface
        ├── WaveformDisplay
        ├── GenerationMode
        ├── GeneratorAndEQ
        └── Transport
```

## 4. Visual grammar
**MEASURED/INFERRED:** warm light-grey/off-white chassis; black recessed displays; thin architectural dividers; restrained physical depth; large tactile primary rotaries; compact technical labels; orange as primary active signal; cyan/yellow/coral-red only as functional accents.

**STANDARDIZED:** hardware character is expressed through layered surfaces, rim/bevel/highlight/shadow relationships and compact geometry. Avoid glassmorphism, soft SaaS cards, large fashionable radii and generic dashboard spacing.

## 5. Semantic color roles
Exact values must be sampled/validated separately. Tokens are semantic:
- `surface.chassis`
- `surface.controlFace`
- `surface.controlRim`
- `surface.controlRaised`
- `surface.controlPressed`
- `surface.display`
- `surface.displayInset`
- `border.panel`
- `border.control`
- `border.display`
- `border.divider`
- `text.primary`
- `text.secondary`
- `text.display`
- `accent.primary` (orange)
- `accent.jitter` (cyan)
- `accent.eqLow` (coral/red)
- `accent.eqMid` (yellow)
- `accent.eqHigh` (cyan)
- `waveform.inactive`
- `waveform.active`
- `waveform.selection`
- `indicator.playhead` (white)

## 6. Typography roles
The reference establishes roles, not a verified font family:
- Brand: `flöde~`
- POD identity: large A–F
- Sample filename
- Section label: VOLUME / PAN / GEN MODE / EQ / SPEED
- Control label: LOW / MID / HIGH
- Button label
- Digital value
- Timecode

**UNSPECIFIED:** exact font family. Inter/JetBrains Mono must not become canonical solely because earlier prototypes used them.

## 7. Physical depth recipes
### Recessed display
Dark face + darker inset edge + fine border + restrained inner shadow. Value readouts belong to the same physical language as waveform display.

### Raised hardware button
Dark/fine outer stroke + light grey face + subtle top highlight + lower shadow. Active/pressed changes depth and signal treatment but preserves construction.

### Rotary control
Tick ring → dark outer housing → metallic rim → inner bevel → light face → indicator. Do not reduce to one circle with a gradient.

## 8. Waveform display
Waveform is the visual/interaction hero.

Composition:
```
WaveformDisplay
├── WaveformViewport
│   ├── WaveformData
│   ├── Grid
│   ├── SliceMarkers
│   ├── TransientMarkers
│   ├── LoopSelectionTint
│   ├── LoopStartHandle
│   ├── LoopEndHandle
│   └── Playhead
└── WaveformReadoutBar
    ├── LoopStartValue
    ├── LengthValue
    └── LoopEndValue
```

The viewport and readout bar form one physical display module, not two unrelated blocks.

Loop handles: full-height vertical accent line with top and bottom triangular grips. Start/end use the same primitive with different semantic roles. Playhead is visually distinct, white, with its own top marker.

No peaks = no waveform signal. No marker data = no markers.

## 9. Rotary families
### PrimaryKnob
Used by VOLUME/PAN. Large tactile body, engineering scale labels, tick ring and recessed value display.

### EQKnob
Shares rotary mechanics but has a distinct visual recipe: smaller geometry, functional accent arc/indicator/status dot, EQ-specific label/readout relationship. It is not merely PrimaryKnob scaled down.

## 10. Slider
Horizontal recessed track, functional fill, tactile hardware thumb and separate digital value display. RANDOM/JUNG uses primary orange; JITTER uses cyan. Internal continuous value is normalized 0–1; display is 0–100%.

## 11. Buttons
One hardware family with variants:
- `utility`: LOAD/MUTE/SOLO
- `segmented`: PURE/JUNG/WEIGHTED/WALK/MEMORY/CHAOS
- `transport`: LOOP/SYNC

All preserve shared physical DNA. Active state is semantic; color is assigned by the variant/state recipe.

## 12. Runtime values visible in reference
Examples such as filename, BPM, loop times, RANDOM 62%, JITTER 14%, JUNG selected, EQ 0.0 dB and playhead position are **reference fixture data**, not defaults.

## 13. Unspecified product semantics
The image does not establish:
- Volume transfer curve/range/default.
- EQ engineering range/default.
- Allowed speed values.
- BPM detection rules.
- Slice/transient algorithms.
- DSP behaviour.
These require a separate parameter/audio specification.
