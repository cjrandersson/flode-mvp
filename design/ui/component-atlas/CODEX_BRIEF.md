# FLÖDE~ UI Component Atlas — Codex R&D Brief

**Status:** Approved UI R&D task brief  
**Branch:** `max-msp`  
**Authority:** CJ  

This is an isolated visual/UI research task.

Do not modify:
- Alpha 0.1 Max/MSP implementation
- DSP architecture
- POD contract
- JUNG implementation
- transport/timing
- preserved Jungulator artefacts

Reference images belong under:

`design/ui/component-atlas/references/`

Study every reference image individually. Do **not** reproduce any reference wholesale. Decompose the references into reusable visual, interaction, and motion principles suitable for flöde~.

## Goal

Create the first **flöde~ UI Component Atlas**: a coherent visual system from which the production instrument UI can later be built.

Extract and explore:

1. Waveform systems
2. Loop/selection regions
3. Transient/slice markers
4. Knobs
5. Faders
6. Buttons
7. Transport controls
8. Numeric/data readouts
9. Meters
10. Status indicators
11. Brackets and construction lines
12. POD identity markers A–F
13. Compact master controls
14. Micro-data visualisation
15. JUNG behavioural/state visualisation
16. Generative geometric glyphs
17. Expand/collapse and inspector patterns

## Visual direction

flöde~ should not look like a generic DAW plugin.

Prefer:
- near-black matte surfaces
- restrained off-white typography
- thin construction lines
- compact technical typography
- subtle POD-specific accents
- restrained orange for active/intervention states
- cyan or related cool accents for temporal/modulation information
- geometric diagrams
- data glyphs
- brackets
- waveform-first hierarchy
- sparse controls
- high information density without visual clutter

Avoid:
- generic component-library appearance
- glossy skeuomorphism
- oversized knobs without functional reason
- excessive gradients
- generic Ableton imitation
- six identical mixer strips as the entire interaction model
- excessive exposed probability controls

## JUNG authority

Read and follow `docs/JUNG_MANIFESTO.md` and `docs/JUNG_BRAIN_ARCHITECTURE.md` before designing any JUNG-facing component.

**Binding UI rule:**

> **JUNG UI must visualize musical behaviour and temporal relationship, never expose the internal probability engine merely because it exists. The user controls temperament; JUNG owns the translation into correlated internal behaviour.**

JUNG visualisation must represent behaviour, not expose internal probability machinery.

Explore a generative JUNG state glyph with at least:

- STABLE / HOME
- RESTLESS / TENSION
- INTERVENTION
- RESOLVING
- RETURN HOME

The visual system should reflect the JUNG invariant:

`decision → bounded intervention → resolve → return home`

The glyph may visually approach disintegration during an intervention, but its temporal anchor must remain legible and it must always return to a canonical home geometry.

Do **not** implement JUNG audio behaviour.

## Motion

Define subtle functional animation specifications.

Motion should communicate:
- state transition
- parameter movement
- intervention
- resolution
- temporal position
- signal activity

Avoid decorative bouncing, elastic UI animation, excessive easing, or game-like feedback.

Animations should be restrained and suitable for translation across:

`Figma → SVG → Max mgraphics/JS → HTML/CSS/Canvas → p5.js`

## Component specification

For each important component document:
- purpose
- geometry
- dimensions/proportions
- typography
- visual states
- interaction states
- parameter mapping
- animation behaviour
- accessibility/readability considerations
- implementation notes for Max/mgraphics
- implementation notes for web/SVG where useful

Do not make implementation language dictate visual design.

## Deliverables

Create:

- `design/ui/component-atlas/README.md`
- `design/ui/component-atlas/COMPONENTS.md`
- `design/ui/component-atlas/MOTION.md`
- `design/ui/component-atlas/JUNG_GLYPH.md`
- `design/ui/component-atlas/TOKENS.md`

Create clean editable SVG prototypes under:

`design/ui/component-atlas/prototypes/`

Initial prototype candidates:
- `knob-v01.svg`
- `range-selection-v01.svg`
- `transport-v01.svg`
- `pod-header-v01.svg`
- `jung-glyph-states-v01.svg`
- `meter-v01.svg`

SVG prototypes should use simple geometric primitives and remain implementation-neutral.

Do not create production Max UI yet.

## Reference analysis

Document what is being extracted from each reference and what is deliberately **not** being copied.

Pay particular attention to:
- six-POD hierarchy from the flöde~ console
- waveform interaction from the POD-A study
- compact modular/data visualisation
- geometric generative controls
- symbolic icon language
- dashboard-style micro visualisations

The result should feel like a **visual operating system for flöde~**, not a collection of unrelated controls.

## Required return

Return:
1. files created
2. component families identified
3. visual principles extracted from each reference
4. proposed design tokens
5. proposed motion vocabulary
6. JUNG glyph concept
7. which components should be prototyped first
8. anything requiring CJ visual approval

Do not modify Alpha 0.1 implementation.  
Do not modify JUNG behaviour.  
Do not implement production UI.
