# flöde~ UI baseline

## Hierarchy per pod
1. Large waveform / slicing editor
2. Clearly visible Jungulator controls
3. Playback + probability sliders
4. Volume / Pan / Mute / Solo / Record
5. Timing / choke / performance
6. Secondary Pod FX

## Control language
- **Sliders:** Volume, Speed, Range, RND, RND2, Jitter, Pitch, transient density, fades.
- **Knobs:** primarily Pan and sound-shaping/FX.
- Avoid grids of tiny knobs and micro-click targets.
- Primary controls should feel large, robust and easy to grab.
- Parameter changes never resize or shift controls.
- Shift + drag = precision. Ctrl + wheel over waveform = zoom.

## Visual language
Matte charcoal / old workstation grey, near-black waveform displays, warm amber/orange waveform and active states, off-white/grey text, neutral Helvetica/Satoshi-like sans serif, thin borders, minimal rounding, no glow/glassmorphism.

## Pod architecture
Waveform → Jungulator → Playback/Random → Performance → Pod FX.
Original Jungulator functionality must not be removed merely to simplify the visual design.
