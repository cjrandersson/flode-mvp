# POD A UI-R&D

**Status:** Approved UI research and implementation contract  
**Scope:** POD A interface architecture only. This document does not implement, alter, or extend the native-MSP M1.1 audio path.

## 1. Purpose and boundary

POD A shall use a reusable JavaScript UI component system, with an MGraphics-rendered waveform/transport view and compact graphical controls. The purpose is to make POD A clear, responsive and consistent with the flöde~ visual language while keeping audio, transport and file operations controller-owned.

The TV001 M1.1 path is implemented in repository files; Max 9 runtime/audio remains unverified:

    Apache Break → scoped buffer~ → groove~ (controlled rate; 1.0 = normal) → safety envelope → existing gain/pan → stereo

Start/Stop remains explicit. The UI layer must never perform DSP, timing, buffer scanning, audio analysis, file selection, disk writing or direct engine mutation.

This is an architecture and design contract, not a claim that the UI has already been implemented.

## 2. Visual direction

Visual reference: **POD A – Senaste (looping transients)**.

- Near-black / blue-black background with thin charcoal panel boundaries.
- Pale cool-grey typography; uppercase section labels and tabular-looking numeric readouts.
- Amber/orange (#FFA800–#FFB000) for waveform, active loop selection, loop boundaries, active modes and **Random/Jung** value.
- Cyan for the active **Jitter** value/handle and the secondary mode text **Transients**.
- Controls are compact, flat and graphical: dark fills, subtle rounded corners and approximately 1 px charcoal strokes.
- No grey hardware-style knobs, EQ, screws, metal panels, VU meters or unrelated controls.

The header uses the flöde~ identity and a large amber **A** (not the label “POD A”), followed by filename, M/S, and disabled INPUT / LOAD / DISK placeholders.

## 3. Component system

Each component must be reusable across PODs A–F. Static identity is supplied through documented arguments, for example:

    @arguments A waveform
    @arguments A jung

Any custom property that is not part of the host object’s standard attribute set must be declared explicitly.

| Component | Responsibility | Notes |
|---|---|---|
| pod_shell / header | POD identity, filename and header layout | INPUT, LOAD and DISK are visible but disabled until native behaviour exists. |
| pod_waveform_ui | Waveform, transient/slice markers, loop overlay and playhead | One interactive canvas; internally layered in drawing order. |
| horizontal slider | Random/Jung and Jitter | Wide, low-profile tracks; value is always normalized. |
| numeric stepper | Slice percentage and Speed | Renders controller-supplied display text verbatim. |
| mode-button pair | ON/ONCE and SYNC/FREE | Selected state is controller-owned. |
| mute / solo button | Immediate hover/press feedback | Persistent state is controller-owned. |

Do not stack multiple interactive waveform canvases. The waveform, slice grid and loop overlay are separate render passes inside one interactive pod_waveform_ui instance.

## 4. Data ownership and UI state

The controller is authoritative for persistent model state. The UI owns only its local gesture preview and pixel layout.

    const state = {};    // controller-owned visual/model state
    const gesture = {};  // hover, pressed and drag-preview state
    const layout = {};   // pixel draw and hit-test rectangles

Controller updates are silent visual state updates: they do not emit semantic events back to the patcher. Mouse gestures update local preview state, emit semantic messages and redraw only the affected component.

All scalar interaction values are semantic normalized values in the range 0.0–1.0. The controller maps them to parameter domains and supplies any engineering-unit display string.

### Numeric steppers

    stepper_begin  <id> <value_norm>
    stepper_change <id> <value_norm>
    stepper_commit <id> <value_norm>

Example controller state:

    set value_norm 0.72
    set display "72 %"

or:

    set value_norm 0.25
    set display "1.00 ×"

The UI does not format percentage, playback-rate or other engineering units itself.

### Waveform peak cache

The UI does not inspect a buffer symbol or calculate peaks from audio. The controller prepares min/max peak columns and maintains the device-local cache. It sends a lightweight reference and monotonically changing version:

    set peaks_ref <device-local-reference>
    set peaks_version <integer>

or atomically:

    set peaks <device-local-reference> <version>

A changed version invalidates the visual cache and triggers waveform reconstruction; an unchanged version does not. Reference resolution stays within the device/UI implementation boundary.

Waveform state includes domain, loop start/end, snap points, playhead and cached min/max peak pairs (each pair in -1.0…1.0). Slice state includes marker positions, selected marker and mode.

## 5. Waveform and transport behaviour

The main waveform occupies nearly the whole upper panel. It has a bipolar amber waveform on a near-black background, subtle vertical time/grid divisions and dashed amber transient/slice markers. Time labels run along the top.

The loop is overlaid directly on the waveform:

- translucent amber selection fill;
- bright amber start/end boundaries;
- triangular indicators at the top;
- rectangular drag handles at the bottom;
- START, LOOP LENGTH and END values beneath the waveform, visually attached to it.

Drawing order is fixed:

1. waveform background;
2. cached peak columns;
3. grid;
4. loop fill;
5. loop boundaries;
6. top triangles;
7. bottom handles;
8. selected slice;
9. playhead.

Loop boundaries have higher visual priority than slice markers. The playhead refreshes only at display cadence, never audio rate.

Hit regions are the loop start handle, loop end handle and loop body. The interaction code clamps values so that:

    0 ≤ start ≤ end − minLoop
    minLoop ≤ end − start ≤ 1

Shift-drag bypasses snap. Double-click may issue a loop-reset request, but does not change DSP directly.

Current R&D scope makes slice markers selectable (for example, slice_select), but not editable. Do not add slice begin/change/commit behaviour until a native engine behaviour exists to receive it.

## 6. Gesture authority and semantic events

During a pointer drag, local gesture preview has temporary visual authority:

    idle:
        controller state → display

    dragging:
        local gesture preview → display
        controller echoes → pending authoritative state

    commit:
        emit committed value
        end local gesture ownership
        reconcile with latest controller state

Older or intermediate controller echoes must not overwrite the actively dragged value or make the control jump. If sequencing/version metadata is available, reject stale echoes explicitly; otherwise defer controller-driven replacement of the dragged property until commit.

### Event contract

| Interaction | Outgoing semantic events |
|---|---|
| Loop | loop_begin <startNorm> <endNorm>; loop_change <startNorm> <endNorm>; loop_commit <startNorm> <endNorm> |
| Random/Jung | jung_begin <norm>; jung_change <norm>; jung_commit <norm> |
| Jitter | jitter_begin <norm>; jitter_change <norm>; jitter_commit <norm> |
| Stepper | stepper_begin <id> <norm>; stepper_change <id> <norm>; stepper_commit <id> <norm> |
| Looper mode | mode looper_mode on/once |
| Timing mode | mode timing_mode sync/free |
| Mute | mute_request <desired> |
| Solo | solo_request <desired> |

Do not use loop_end as an outgoing event name: reserve loop_start and loop_end for semantic endpoint state if those names are required. Optional explicit endpoint events may use loop_start_change / loop_end_change; moving the whole loop may use loop_move.

The standard controller-to-UI pattern is:

    set <property> <value...>
    enable <0|1>

A set message never produces an outgoing semantic event.

## 7. Specific controls

### Random/Jung

Random/Jung is a unipolar left-to-right horizontal slider:

    0 % = Stable / minimum variation
    100 % = full Jung

Use a dark recessed track with charcoal border and amber active fill/handle. It must not be a rotary control.

### Jitter

Jitter uses the same geometry as Random/Jung, with cyan active fill/handle. The left label is JITTER; a controller-supplied display value may appear at the right.

### Loop, slice and playback strip

- LOOPER: ON and ONCE. Active ON uses amber outline and label.
- Timing: SYNC and FREE. Active SYNC uses the same amber treatment.
- SLICE: compact numeric percentage stepper, for example 72 %, plus MODE: Transients with Transients in cyan.
- SPEED: compact multiplier stepper, for example 1.00 ×.

## 8. Mute, Solo and pod routing

Mute and Solo may show immediate hover/pressed feedback, but their persistent selected state is never toggled locally.

Mute request/state flow:

    mute_request 1
    set mute 1

Solo follows the same request/authoritative-state model:

    solo_request 1
    set solo 1

The controller owns Solo globally so that future exclusivity policy can be applied in one place.

At pod aggregation, prepend the POD identity:

    pod A jung_change 0.43
    pod A loop_commit 0.31 0.54
    pod A mute_request 1
    pod A solo_request 1

## 9. Deferred and disabled functions

INPUT, LOAD and DISK are intentionally present for layout continuity but disabled until native functionality exists. Disabled controls are dim, have no hover or press treatment, use the default cursor and emit no request.

Do not implement a file chooser, disk writer or input popup inside the UI layer.

## 10. Implementation sequence after M1.1

1. Establish shared tokens, base component helpers and message adapter.
2. Implement pod_waveform_ui with static cached peak data and loop hit-testing.
3. Add reusable horizontal slider, stepper, mode and M/S components.
4. Connect controller-owned normalized state and display strings.
5. Add versioned peak-cache updates and display-cadence playhead refresh.
6. Reuse the same component set for PODs B–F through arguments, not duplicated scripts.

## 11. Acceptance criteria

The first implementation is ready for UI integration when it:

- reproduces the documented dark/amber/cyan visual system;
- has one interactive waveform canvas with correctly layered rendering;
- emits only semantic normalized messages;
- prevents stale controller echoes from jumping an active drag;
- leaves DSP, buffer access, file operations and solo policy outside the UI;
- keeps unsupported header controls disabled; and
- does not modify the M1.1 signal path.
