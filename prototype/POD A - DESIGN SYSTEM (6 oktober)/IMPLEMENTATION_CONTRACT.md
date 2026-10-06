# Implementation Contract

## Technology independence
The design system is canonical. React and Max/mgraphics are renderers.

### React reference implementation
- React + TypeScript for component/state contracts.
- Tailwind/CSS for layout mechanics, not identity-defining ad-hoc constants.
- SVG for precise vector control geometry, ticks, indicators, handles and icons.
- Canvas is appropriate for dense waveform rendering.
- SVG/HTML overlays remain separate for loop handles, playhead, markers and labels.
- Use unique SVG IDs (`useId()` or equivalent).
- Use ResizeObserver + devicePixelRatio for crisp responsive canvas.
- Use Pointer Events for primary interaction and handle `pointerup`, `pointercancel`, and lost capture.
- Accessibility: slider roles/ARIA value text, keyboard arrows/home/end, focus state, `aria-pressed` for toggles.

### Max/MSP implementation
- mgraphics/JS reproduces the same geometry/tokens/state recipes.
- UI receives normalized semantic values and emits normalized changes.
- Engineering mapping is not owned by drawing code.
- Playback position and audio-derived data come from host/DSP state.
- UI update rate may be throttled independently from DSP.

## Parameter separation
Create a separate `parameterSpecs` domain. It may define normalized domain, engineering domain, unit, formatter, resolution/step, mapping curve and an explicitly approved default.

Do not put parameter semantics in visual tokens.

## Demo/reference fixture separation
Reference/demo fixture may contain the visual master scenario. Production components must remain valid with no sample loaded and no analysis data.

## Responsive rule
Responsiveness preserves hierarchy rather than uniformly scaling the screenshot:
1. Waveform remains dominant.
2. Primary controls retain usable interaction size.
3. Instrument geometry/proportions are preserved where possible.
4. Sections may reflow only through explicit responsive compositions.
5. No generic framework breakpoint may silently redefine POD hierarchy.

## Visual fidelity gate
Before architecture freeze, render POD A at the master aspect/coordinate target and compare:
- macro proportions
- rail/work-surface ratio
- waveform prominence and integrated readout
- primary/EQ knob anatomy
- button physical recipe
- slider geometry
- divider placement
- typography roles
- chassis/display depth
- accent usage

A component that reads as generic SaaS fails the visual gate.

## Architecture gate
Every implementation revision must be auditable against all 13 invariants. Only a 13/13 PASS is eligible to become canonical.
