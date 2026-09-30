# Motion vocabulary

**Status:** Proposed specification. SVG studies are static; the standalone Max 9 controls follow input directly. No JUNG animation or new clock is implemented.

## Functional motions

| Motion | Purpose | Proposed behavior |
| --- | --- | --- |
| Track | Slider, knob, stepper or loop movement | Immediate geometry update on input; no easing or inertia |
| Confirm | Accepted discrete state | Label/border changes immediately; optional 60–90 ms colour transition |
| Locate | Playhead position | Controller supplies display-cadence positions; at most interpolation between known positions |
| Tension | Restless JUNG state | Displace inner geometry within 10–15% of radius over 80–120 ms |
| Intervene | Bounded intervention | Separate up to six fragments over 60–100 ms; fixed temporal anchor remains legible |
| Resolve | Return toward phrase/home | Converge monotonically in 120–200 ms or a controller-specified remaining interval |
| Home | Completion/return | End on exact canonical geometry, no spring, orbit or continuing random motion |
| Signal | Meter level and peak | Fast rise; suggested 120–250 ms visual fall and 600 ms peak hold, subject to signal source |
| Inspect | Expand/collapse | Immediate layout or at most 100 ms bounded reveal; preserve primary control locations |

These millisecond durations are visual defaults, not event scheduling. For a JUNG event, an engine/controller may supply phase progress or a bounded remaining duration. A renderer must never prolong a glyph phase beyond the authoritative home state.

## Authority and cadence

The master/audio controller owns time and behavioral states. A UI may receive normalized visual phase and a timestamp; it does not infer a second BPM, trigger an intervention, sample random probabilities or advance JUNG behavior.

Use display cadence (typically up to 30–60 Hz) for visual motion. Rendering may coalesce intermediate updates. It must retain the latest controller state and finish on the correct geometry. Inactive or collapsed components can draw only on state changes.

During an active pointer gesture, local preview owns its geometry. Defer intermediate controller echoes; reconcile after commit. Engineering display text remains controller formatted. Reduced motion retains label changes, bounded state marks and canonical home without animated displacement.

## Translation

- **Figma:** keyframes demonstrate endpoints; component variants carry explicit named states.
- **SVG:** named groups define home/fragment/anchor geometry. Interpolate matching primitives if animation is later added.
- **mgraphics/JS:** read controller visual state, cache static paths where useful, redraw at display cadence. An optional UI redraw task is purely presentational and never drives music.
- **HTML/CSS/Canvas/p5.js:** use requestAnimationFrame only to present authoritative phase; clamp at endpoints and obey reduced-motion preferences.

Do not use elastic easing, overshoot, decorative bounce, random idle drift or perpetual glyph rotation. If motion obscures the phrase anchor or makes an intervention appear to create a competing clock, the motion needs revision.

## Review scenarios

Review stable playback, a single intervention returning home, interrupted resolution, abrupt controller home/reset, stale visual updates and reduced motion. The anchor must remain visible throughout. Returning home must produce the exact same coordinates as stable/home.
