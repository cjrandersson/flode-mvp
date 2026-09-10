# flöde~ UI and interaction specification

## Design intent

flöde~ must feel precise, organic, tactile and playable. If a detail makes the instrument harder to grab, read or understand, remove it.

The current approved surface direction is the **light grey / satin interface developed on 2026-09-10**. The earlier dark interface remains useful historical reference material, but it is no longer the primary visual baseline.

Fors Opal informs hierarchy, reduction, component consistency and progressive disclosure. Do not copy its surface design. flöde~ remains waveform-led, spacious and built around six continuous sampling/mangling PODs rather than a compact sequencer-first interface.

## Two-level structure

### Six-pod overview

The default 3x2 view keeps all PODs A-F playable. Each pod shows:

1. POD letter, sample name and status
2. Mute and Solo
3. large waveform with loop/start/end interaction
4. Volume and Pan
5. current Gen Mode
6. Random/Jung
7. Jitter
8. RND2 speed / velocity modulation
9. Speed
10. Loop and Sync

POD boundaries must be visibly clear without turning the surface into six disconnected cards. Each POD can use a restrained identity colour while the overall body remains neutral grey/satin.

### Pod Focus View

Clicking a pod header or waveform may open an in-place Focus View containing deeper sample editing, slicing, probability, pitch/direction, Pan, three-band EQ, choke, pod FX and modulation.

The current focused POD reference is `design/current-grey/2026-09-10/pod-a-jung-focus.svg`.

Returning to overview must preserve all state and never stop audio. Focus View is progressive disclosure, not a modal workflow that blocks performance.

## Hierarchy per pod

Waveform -> primary playback/mix controls -> generative controls -> secondary functions.

The waveform and primary gestures dominate. Advanced controls must not reduce primary targets below the minimum sizes.

## Control language

- **Large horizontal sliders:** Random/Jung, Jitter, RND2, Range, transient density, fades and other performance parameters
- **Large tactile controls:** Volume and Pan must feel physically substantial and stable
- **Knobs:** Pan, three-band EQ and selected sound-shaping/FX parameters may use rotary controls
- **Buttons:** stable rectangles/pills with clear active fill; no fake screws or decorative hardware
- **Precision:** Shift + drag for fine control
- **Waveform zoom:** Ctrl + wheel where supported
- **Reset:** double-click or documented modifier; use consistently
- Parameter changes never resize or shift controls
- Avoid grids of tiny knobs, unlabeled icons and micro-click targets

Use an 8 px spacing grid. Interactive targets are at least 32 px. Primary controls should feel generous enough to grab quickly while performing.

## Visual layers

Use three principal surface depths:

1. light neutral grey / satin application body
2. subtly separated grey POD surfaces
3. near-black waveform and active editing surfaces

The interface should feel like an instrument, not a web dashboard. Avoid glassmorphism, glow, glossy plastic, fake screws and ornamental depth effects.

## Colour

Each POD may have a restrained identifier colour, used on:

- POD letter or selected-pod indicator
- waveform/playhead or slice focus
- active buttons/status
- selected controls
- modulation/generative feedback

Core active controls may use flöde orange. Cyan, violet and other accents are reserved for clear parameter families such as Jitter, RND2 or POD identity.

Do not tint the complete pod surface. Labels, values and state must remain readable without colour.

## Typography

- Neutral grotesk/Satoshi/Helvetica-like family for labels and navigation
- Monospaced numerals for BPM, time, percentages, sample position and status values
- Small uppercase labels with controlled tracking
- Stronger weight only for POD identity and essential values
- Keep explanatory text outside the performance surface

## Waveform and loop interaction

The waveform remains the visual centre of every POD.

- Start/end handles must be easy to identify and drag.
- Selected loop regions should be visible without obscuring the waveform.
- Loop length changes must not imply pitch change by themselves.
- Zoom and Fit controls should feel calm and predictable.
- Playback indication must remain legible at a glance.

## Generative feedback

Random/Jung and Jitter must not behave as unexplained mystery sliders. RND2 must also state its current role clearly.

Where practical, show:

- stable/base parameter value
- current generated value or target marker
- locked/protected state
- subtle activity when a new generative decision occurs

### Current RND2 behaviour

In the 2026-09-10 browser study, RND2 modulates **speed / velocity through playback-rate change**. This also changes pitch. This behaviour is intentional documentation of the current prototype state, not a claim that future DSP must keep pitch and speed coupled.

Global or per-pod variation must support parameter protection so the user can mutate one dimension without losing a useful sound.

## Six Gen Modes

The six modes remain directly visible and selectable in both overview and Focus View:

- PURE
- JUNG
- WEIGHTED
- WALK
- MEMORY
- CHAOS

The selected mode is indicated by active fill/state. Do not add redundant checkmark icons when selection is already visually obvious.

## Three-band EQ

Focused POD view includes LOW, MID and HIGH EQ controls. These may use rotary knobs because the parameter family is compact, familiar and benefits from spatial grouping.

## Master strip

The master area is a persistent unified lower strip containing global state:

- MASTER label
- BPM and Tap beside MASTER
- Record / Play / Stop
- host/internal clock status
- Swing
- MIDI Clock Out
- master output meter and value
- master FX chain
- master volume / output status
- Panic when implemented

Swing, MIDI clock and output metering belong in the master area, not inside individual PODs.

## Interaction states

Every interactive control needs distinct idle, hover, active/pressed, automated, modulated, disabled and focus states. Modulation feedback must not obscure the stored/base value.

Audio status, host sync, loaded/unloaded buffer state, clipping and errors need direct visual feedback. Colour alone is never the only signal.

## Current implementation references

- `design/current-grey/2026-09-10/full-ui-master-console.svg`
- `design/current-grey/2026-09-10/pod-a-jung-focus.svg`
- `prototype/web-pod-a-2026-09-10/index.html`
- live browser study: https://flode-pod-a.cjr-andersson.chatgpt.site
