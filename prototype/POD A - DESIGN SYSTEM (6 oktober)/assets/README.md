# POD A visual assets

Canonical component assets extracted from the POD A design system.

## Rule
SVG files are visual exports of the design system, not an independent source of truth. Canonical ownership remains:
- visual constants: `src/tokens.ts`
- component behavior/anatomy: `src/*.tsx`
- specification: `POD_A_VISUAL_SPEC.md`

## Assets
Primary knob, EQ knob, hardware button, horizontal slider, loop start/end handles, playhead, value display and waveform chassis.

The waveform chassis intentionally contains **no fabricated waveform**. Runtime waveform, markers, loop state and playhead position are supplied by state.

`COMPONENT_CONTACT_SHEET.svg` assembles the exports for quick visual review on desktop or phone.

PNG previews are secondary raster exports and should be generated from these SVGs after the visual calibration pass, so we do not freeze raster copies before the canonical vector geometry is approved.
