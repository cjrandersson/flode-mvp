# flöde~ Design System Invariants v1.0

1. **UI NEVER INVENTS DATA.** Visual components render supplied state. Missing waveform/BPM/markers/timing/parameter data produces an explicit empty/unknown state, never plausible fabricated data.
2. **REFERENCE DEFINES APPEARANCE.** POD A is the visual authority. Generic web conventions may not reinterpret it.
3. **TOKENS HAVE ONE OWNER.** Every recurring identity-defining visual constant has one canonical token.
4. **COMPONENTS HAVE ONE OWNER.** Every recurring control/pattern has one canonical primitive. Variation uses props, state, variants and tokens.
5. **STATE IS SEMANTIC.** State says idle/active/disabled/selected/focused/dragging. Color and depth are presentation recipes.
6. **NORMALIZED VALUES ARE INTERNAL.** Continuous UI state uses 0–1. Musicians see meaningful engineering/musical values.
7. **DSP AND UI REMAIN SEPARATE.** UI visualizes/manipulates semantic state; it does not implement or infer audio behaviour.
8. **DEMO DATA IS NOT PRODUCT STATE.** Reference values and mock audio belong in fixtures/demos, never implicit component defaults.
9. **INSTRUMENT GEOMETRY DEFINES LAYOUT.** Measured POD relationships define layout; CSS frameworks only implement them.
10. **WAVEFORM IS A FIRST-CLASS INSTRUMENT.** Waveform, grid, markers, loop region, handles, playhead and readouts are independent synchronized parts, not decorative artwork.
11. **INPUT IS DEVICE-AGNOSTIC.** Primary controls use Pointer Events and support mouse, touch and pen, including cancellation/lost capture.
12. **flöde~ MUST LOOK LIKE flöde~.** If a control can live unchanged in a generic SaaS dashboard, extraction is incomplete.
13. **EXAMPLES ARE NEVER SPECIFICATION.** A value visible in the reference describes one runtime moment unless separately specified as product behaviour.

## Short rule
**Extract the system behind the image, not the moment shown by the image.**
