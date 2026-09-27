# flöde~ Design Framework

**Status:** Visual and interaction guidance  
**Branch:** `max-msp`  
**Scope:** The shared visual language for the six-pod instrument, Max 9 `v8ui` components, and the web prototype.

This document describes how flöde~ should look and feel. It does **not** define the audio engine or replace [POD v0.1 contract](../docs/POD_V01_CONTRACT.md). When behaviour and appearance conflict, the audio contract wins until the design is deliberately revised.

## Design intent

flöde~ should feel like a compact, responsive audio instrument — not a web dashboard. The interface is matte, structural and calm: dark graphite surfaces, clear boundaries between pods, deliberate colour, and no decorative visual noise.

The interface must make four things immediately legible:

1. Which pod is being controlled.
2. What part of the sound is playing and looping.
3. Which generative mode is active.
4. What the shared master transport is doing.

## Design tokens

Use semantic tokens rather than scattering literal colours through component scripts. RGBA values use the Max/mgraphics range `0.0–1.0`.

```js
const TOKENS = {
  canvas:       [0.08, 0.09, 0.11, 1.0], // deep carbon
  panel:        [0.12, 0.13, 0.15, 1.0], // pod / master panel
  panelRaised:  [0.16, 0.17, 0.19, 1.0], // selected or raised control surface
  line:         [0.28, 0.30, 0.34, 1.0], // borders, tracks and ticks
  text:         [0.90, 0.90, 0.90, 1.0],
  textMuted:    [0.55, 0.58, 0.62, 1.0],
  disabled:     [0.18, 0.20, 0.24, 1.0],

  eqLow:        [1.00, 0.40, 0.32, 1.0], // coral
  eqMid:        [1.00, 0.78, 0.18, 1.0], // yellow
  eqHigh:       [0.35, 0.78, 1.00, 1.0]  // light cyan
};
```

Each pod receives one restrained `podAccent` colour. It is used for its large identity letter, top edge, selected mode, waveform play/loop state and active controls. The colour should never replace readable text or create glow.

## Geometry and scaling

- Calculate component geometry from its current `box.rect` width and height.
- Prefer ratios for layout: for example, `knobRadius = Math.min(width, height) * 0.16`.
- Small fixed values are allowed only as drawing minimums — such as a 1 px line or minimum hit area — never as the main layout system.
- Keep a control's position and size stable while its value or mode changes.
- Use thin borders, little or no corner rounding, no glassmorphism and no decorative shadows.
- Use a neutral Helvetica/Satoshi-like sans serif. Labels are compact; values and pod letters are more prominent.

## Instrument layout

### Global header

The top of the main window contains only a small `flöde~` wordmark and a compact **Settings / Preferences** control. It is deliberately quiet.

### Six-pod view

Pods A–F are shown in two rows of three. Every pod has:

- a thin boundary and modest gap from its neighbours;
- a narrow top edge in its own accent colour;
- a large coloured identity letter (`A`–`F`) rather than a redundant “POD A” title;
- the same structural order, so a player can move between pods without relearning the layout.

### Pod order

```text
Identity letter / status
Waveform + slice and loop editor
GEN MODE + fixed mode-parameter field
Playback and generative controls
Volume and Pan knobs
Three-band EQ
Mute / Solo and secondary performance controls
```

The exact density may change between the single-Pod editor and six-Pod overview, but the order must not.

### Master panel

The master is a separate broad panel at the bottom of the main window. It contains, left to right:

```text
MASTER → BPM → Tap → Record / Play / Stop
       → Swing → MIDI Clock Out → Host Sync → output meters → master FX chain
```

Transport and global feedback do not belong in the top header.

## Component contracts

### Waveform and slicing editor

The waveform is the pod's primary surface and must be based on real buffer/audio data, not a decorative procedural wave.

It shows:

- the loaded filename and audible waveform;
- slice boundaries and the active slice;
- a clearly shaded loop overlay;
- loop start and end handles in the pod accent;
- the playback cursor, drawn responsively from audio/transport state;
- **SLICE** with **MODE: Transients** beneath it when transient slicing is active.

The loop overlay is an editor state: audio outside the selected start/end region is visually subdued, while the active area remains clear.

### Generative modes

All pods show the same mode row:

```text
PURE · JUNG · WEIGHTED · WALK · MEMORY · CHAOS
```

The selected name receives the pod accent; do not add a checkmark. A fixed parameter field immediately below the mode row changes its values and labels for the active mode without moving the rest of the interface.

RND controls slice/position probability. RND2 controls playback-speed variation and therefore can change pitch; its label and help must make this explicit.

### Knobs and sliders

| Control | Form | Notes |
| --- | --- | --- |
| Volume | Knob | Large, physical and easy to grab |
| Pan | Knob, directly below Volume | Same visual family and size |
| EQ Low / Mid / High | Three knobs | Coral / yellow / light cyan scales and markers |
| Speed, Range, RND, RND2, Jitter | Short horizontal sliders | Compact, readable and never stretched across empty space |
| Slice / transient density, fades | Slider or compact value control | Depends on available pod density |
| Mute / Solo | Buttons | Clear active state; secondary to waveform and core controls |

Avoid grids of tiny knobs, tiny click targets and redundant REC icons inside individual pods.

## Interaction rules

- Control response should be immediate and continuous. Do not animate input in a way that makes it feel delayed or plastic.
- Pointer drag changes the parameter; **Shift + drag** enables fine adjustment.
- Loop handles are directly draggable. A change updates the overlay immediately.
- The play cursor follows audio/transport timing, not a visually guessed timer.
- Smooth audio parameter changes enough to avoid clicks, but do not hide rhythmic aggression or introduce perceptible lag.
- Active state uses colour, value and motion together; colour alone must not carry important information.

## State handoff for components

UI components receive a single state object and emit normalized interaction values before the patch maps them to audio units.

```js
const podUiState = {
  podId: "A",
  accent: [1.0, 0.55, 0.0, 1.0],
  sampleLoaded: true,
  loopStart: 0.25,  // normalized 0.0–1.0
  loopEnd: 0.55,    // normalized 0.0–1.0
  activeSlice: 7,
  sliceCount: 16,
  mode: "jung",
  modeParams: { repeatNew: 0.55 },
  volume: 0.80,     // normalized before mapping
  pan: 0.0,         // mapped to -1.0–1.0
  isPlaying: true
};
```

A renderer may draw this state, but it must not become a second owner of persistent audio state. The Max patch/state layer remains authoritative.

## Implementation notes

- Max 9 `v8ui` and `mgraphics` are appropriate for custom visual components.
- Keep drawing, user interaction and Max/audio messages separate: rendering reads state; input emits normalized commands; the patch owns audio state.
- Treat a component script as a reference implementation until it is tested in Max 9 with real buffers, DSP and user input.
- Add a component only when it improves control or feedback. Do not add widgets merely because the framework permits them.

## AI handoff

When requesting a new component, provide this document plus:

1. the component's input state;
2. the messages it emits;
3. its visual location in the pod or master panel;
4. its interaction behaviour and precision requirements;
5. what it must not change.

Example:

> Implement a Max 9 v8ui loop-overlay component for a pod waveform. Read normalized `loopStart`, `loopEnd`, `playhead` and `accent` from the supplied state. Render only the overlay and handles; do not draw fake waveform data, own audio state or alter the pod layout. Dragging a handle must emit normalized loop values. Shift + drag is fine adjustment.
