# Proposed design tokens

**Status:** R&D proposal, pending CJ visual review. Numeric tokens match the standalone Pod A renderer where that renderer has an equivalent. They do not revise the locked production UI.

## Colour

| Semantic token | Hex | RGBA for mgraphics | Role |
| --- | --- | --- | --- |
| canvas | #0E1115 | 0.055, 0.067, 0.082, 1 | Near-black foundation |
| panel | #14171B | 0.078, 0.090, 0.106, 1 | Recessed control/waveform field |
| raised | #1B1F24 | 0.106, 0.122, 0.141, 1 | Hover/pressed fill |
| construction | #303840 | 0.188, 0.220, 0.251, 1 | Dividers, brackets, tracks |
| text | #D4DEE8 | 0.831, 0.871, 0.910, 1 | Primary labels and values |
| muted | #6E7D8C | 0.431, 0.490, 0.549, 1 | Secondary labels and disabled placeholders |
| intervention | #FFA800 | 1, 0.659, 0, 1 | Selection boundaries, active intervention |
| temporal | #45C9E0 | 0.271, 0.788, 0.878, 1 | Time/modulation, fixed JUNG anchor |
| selection-fill | #FFA800 at 7.5% | 1, 0.659, 0, 0.075 | Loop body overlay |

POD identity proposals: A amber, B cool cyan, C muted violet, D sage, E coral, F steel blue. Use identity accents sparingly on letters/top edges; retain consistent meanings for selection and temporal information. Exact B–F colours need review against the reference console.

Selected states require readable labels, stable positions and an explicit state indicator or border treatment. A clip indicator needs the word CLIP and a persistent mark. Colour is supplementary.

## Geometry

- Base spacing: 4 units. Common gaps: 8 and 12.
- Primary borders: 1 unit. Active boundaries: 1.5.
- Corner radius: 0–2; shapes remain structural.
- Reference pod width: 920; actual layout scales from component bounds.
- Loop-handle glyph: 10 wide × 10 high, with a larger pointer hit region.
- Minimum recommended pointer area: 24 × 24 at normal scale; rendering glyphs may be smaller.
- Knob sweep: 270°; study radius 24. Keep it secondary to waveform/range control.
- Dense readout row: 32–40 high. Compact header: 54 high.
- Glyph study: 176 × 176 field; proposed embedded size 64–96.

SVG viewBox coordinates are the reference geometry, not mandatory production pixels. Normalize coordinates and calculate from the current host rectangle. If scaling makes hit areas unreadable, use a compact layout or minimum window size instead of continuously shrinking everything.

## Typography

**CJ selected on 2026-10-01:** Jersey 10 Regular for labels and POD letters; IBM Plex Mono Regular for numeric values and units. [Bundled TTFs, browser CSS and licences](fonts/). Max selects installed family names; install both fonts at OS level and restart Max. Browser previews await local faces before drawing. Updated SVG exports embed the used faces and retain editable text.

Jersey 10 is a display face. Current studies keep labels at 14 units or larger, prominent identity at roughly 24–35. IBM Plex Mono numeric readouts stay at 12 or larger. Exact rendering/legibility needs a real-host review. Earlier v0.1 SVGs preserve their prior Arial typography as historical studies.

The reference-element library introduces an additional restrained orange proposal: **#FF9626** (1, 0.588, 0.149, 1). Existing POD A lab uses its original #FFA800 selection accent. Both are proposals for colour review; the font pairing itself is explicitly selected.

## Timing and state

Motion values are specified in [MOTION.md](MOTION.md), rather than implied by the drawing system. Controller state owns semantic values and engineering-unit strings. UI gesture values are normalized 0…1; loop endpoints additionally satisfy the configured minimum span.

Stable defaults are home geometry, stopped transport, no clip and no waveform until real data is supplied. These are rendering defaults, not audio policy.
