# Extraction Audit — 6 October 2026

This pass converts the frozen design-system specification into reusable reference components without importing the earlier Gemini prototype.

| Invariant | Result | Evidence in extraction |
|---|---|---|
| UI never invents data | PASS | Waveform receives `WaveformData|null`; empty state is a flat neutral line. Marker arrays default empty. |
| Reference defines appearance | PASS* | Composition follows POD A hierarchy and measured 20/80 rail/work-surface relation. *Pixel calibration remains a visual QA task.* |
| Tokens have one owner | PASS* | Identity roles centralized in `tokens.ts`. A few low-level SVG material shades remain local and are explicitly candidates for next token calibration. |
| Components have one owner | PASS | TechnicalLabel, ValueDisplay, HardwareButton, PanelDivider, Knob, HorizontalSlider, SpeedControl, WaveformDisplay. |
| State is semantic | PASS | HardwareButton accepts semantic state; PodA does not pass colors as state. |
| Normalized values internal | PASS | Continuous controls consume/emit 0–1; display formatting injected by caller. |
| DSP/UI separate | PASS | No DSP/audio inference or engineering transfer curves in UI components. |
| Demo data not product state | PASS | No filename/BPM/duration/knob demo defaults embedded in PodA. |
| Instrument geometry defines layout | PASS | POD composition uses explicit geometry tokens and reference-derived ratio rather than Tailwind col-span layout. |
| Waveform first-class | PASS | Data, markers, loop region/handles, playhead and readout are independently represented. |
| Input device agnostic | PASS* | Knob/slider/loop handles use Pointer Events with cancellation. Keyboard behavior remains an accessibility follow-up. |
| flöde~ looks like flöde~ | PASS* | Hardware primitives and recessed display grammar are explicit. Final judgment requires rendered reference comparison. |
| Examples are never specification | PASS | Reference runtime values are absent from production components. |

## Deliberately not invented
Volume dB curve/default, EQ range/default, speed choices/default, BPM analysis, transient/slice algorithms, DSP behavior, exact font family.

## Remaining visual calibration
1. Sample exact master colors from the source image.
2. Measure button/radius/tick/knob rim dimensions at higher precision.
3. Render at 1448×1086 and compare against master.
4. Tokenize the remaining SVG material shades after visual calibration.
5. Add explicit focus/keyboard recipes without changing instrument appearance.

**Verdict:** architecture extraction is clean enough for visual calibration; it is not yet claimed pixel-perfect.
