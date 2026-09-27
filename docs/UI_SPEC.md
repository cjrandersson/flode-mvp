# flöde~ UI baseline

**Status:** Visual baseline for the six-pod instrument.  
**Related:** [Design Framework](../design/fl%C3%B6de-design-framework.md) and [POD v0.1 contract](POD_V01_CONTRACT.md).

## Hierarchy per pod

1. Large waveform / slicing and loop editor
2. Clearly visible Jungulator / GEN MODE controls
3. Playback and generative controls
4. Volume and Pan knobs
5. Three-band EQ
6. Mute / Solo and secondary performance controls

Parameter changes never resize or move controls.

## Control language

- **Knobs:** Volume; Pan directly below Volume; EQ Low, Mid and High; sound-shaping / FX controls.
- **Short horizontal sliders:** Speed, Range, RND, RND2, Jitter, Pitch, transient density and fades.
- **Buttons:** Mute, Solo, transport and discrete choices.
- Avoid grids of tiny knobs, micro-click targets and long empty sliders.
- Primary controls should feel large, robust and easy to grab.
- Shift + drag = precision. Ctrl + wheel over waveform = zoom.
- RND2 is playback-speed variation and may change pitch; this must be visible in the label or help.

## Visual language

Matte charcoal / old workstation grey, near-black waveform displays, off-white/grey text, neutral Helvetica/Satoshi-like sans serif, thin pod borders and minimal rounding. No glow or glassmorphism.

Each pod has a restrained individual accent colour used for its large A–F identity letter, thin top edge, selected mode and active waveform state. EQ remains consistent in every pod: Low coral, Mid yellow, High light cyan.

## Pod architecture

```text
Identity → Waveform / Slice / Loop → GEN MODE → Playback / Random
         → Volume + Pan → EQ → Mute / Solo / secondary controls
```

The mode row is always visible: **Pure, Jung, Weighted, Walk, Memory, Chaos**. The selected mode uses colour only; no checkmark. Its specific parameters appear in a fixed field below the row.

Original Jungulator functionality must not be removed merely to simplify the visual design.

## Master panel

A separate broad panel at the bottom holds shared controls:

```text
MASTER → BPM → Tap → Record / Play / Stop
       → Swing → MIDI Clock Out → Host Sync → meters → master FX
```

The global header should contain only the small flöde~ wordmark and Settings / Preferences.
