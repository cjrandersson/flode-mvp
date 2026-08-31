# flöde~ UI and interaction specification

## Design intent

flöde~ must feel dark, precise, organic and playable. If a detail makes the instrument harder to grab, read or understand, remove it.

Fors Opal informs hierarchy, reduction, component consistency and progressive disclosure. Do not copy its surface design. flöde~ remains waveform-led, more spacious and built around six continuous sampling/mangling PODs rather than a compact sequencer-first interface.

## Two-level structure

### Six-pod overview

The default 3×2 view keeps all PODs A–F playable. Each pod shows:

1. POD letter, sample name and status
2. Mute and Solo
3. large waveform with loop/start/end interaction
4. Volume
5. Speed/playback control
6. Random/Jung
7. Jitter
8. current Gen Mode

### Pod Focus View

Clicking a pod header or waveform may open an in-place Focus View containing deeper sample editing, slicing, probability, pitch/direction, Pan, choke, pod FX and modulation. Returning to overview must preserve all state and never stop audio.

Focus View is optional progressive disclosure, not a modal workflow that blocks performance.

## Hierarchy per pod

Waveform → primary playback/mix slider → generative controls → secondary functions.

The waveform and primary gestures dominate. Advanced controls must not reduce primary targets below the minimum sizes.

## Control language

- **Large horizontal sliders:** Volume, Speed, Range, Random/Jung, Jitter, Pitch, transient density and fades
- **Knobs:** mainly Pan and selected sound-shaping/FX parameters
- **Buttons:** flat, stable rectangles/pills with clear active fill; no fake hardware
- **Precision:** Shift + drag for fine control
- **Waveform zoom:** Ctrl + wheel where supported
- **Reset:** double-click or documented modifier; use consistently
- Parameter changes never resize or shift controls
- Avoid grids of tiny knobs, unlabeled icons and micro-click targets

Use an 8 px spacing grid. Interactive targets are at least 32 px; primary slider lanes are approximately 28–36 px high. Rounding stays restrained at roughly 8–12 px and borders are normally 1 px.

## Visual layers

Use three principal surface depths:

1. matte charcoal application background
2. slightly lighter pod surface
3. near-black waveform and active editing surface

No glow, glassmorphism, glossy plastic, fake screws, photorealistic hardware or decorative gradients.

## Colour

Each POD may have a restrained identifier colour, used only on:

- waveform/playhead or slice focus
- primary slider fill
- selected-pod indicator
- active buttons/status
- modulation/generative feedback

Do not tint the complete pod card. Labels, values and state must remain readable without colour. Use muted accents rather than six saturated toy colours.

## Typography

- Neutral grotesk/Satoshi/Helvetica-like family for labels and navigation
- Monospaced numerals for BPM, time, percentages, sample position and status values
- Small uppercase labels with controlled tracking
- Stronger weight only for POD identity and essential values
- Keep explanatory text outside the performance surface

## Generative feedback

Random/Jung and Jitter must not behave as unexplained mystery sliders. Where practical, show:

- stable/base parameter value
- current generated value or target marker
- locked/protected state
- subtle activity when a new generative decision occurs

Global or per-pod variation must support parameter protection so the user can mutate one dimension without losing a useful sound.

## Master strip

Keep a thin persistent master area containing only global state:

- transport and Record
- BPM/clock
- sync/quantisation
- global variation
- master FX access
- master volume/output status
- Panic

The separate resizable BPM/transport window may remain, but the essential BPM/clock state stays visible in the main instrument.

## Interaction states

Every interactive control needs distinct idle, hover, active/pressed, automated, modulated, disabled and focus states. Modulation feedback must not obscure the stored/base value.

Audio status, host sync, loaded/unloaded buffer state, clipping and errors need direct visual feedback. Colour alone is never the only signal.
