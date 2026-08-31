# flöde~ MVP

flöde~ is a six-pod sampler, generative sequencer, audio mangler and looper built around a shared master clock/BPM. The project evolves the character and workflow of the original I Am The Mighty Jungulator into a cleaner, more robust Max/MSP / Max for Live / standalone instrument.

## Locked MVP direction
- Six independent sampler pods A–F in one window
- Large Simpler-inspired waveform/slice view per pod
- Drag/drop audio, loop start/end, speed, volume, pan
- Original Jungulator controls retained and made clearly visible
- RND: slice/sample-position probability amount
- RND2: velocity/playback-speed variation
- Random modes: Jung, Weighted, Walk, Memory, Chaos
- Transient slicing and density control
- Sync/free operation per pod; shared master clock and BPM
- Mute, Solo, Record, Panic and choke groups
- Per-pod FX and reorderable master FX chain
- Separate resizable flöde~ BPM/transport window

## UI baseline
The interface must feel like an audio instrument, not a web dashboard. Waveforms and primary gestures are large. Playback/random/volume use sliders. Rotary knobs are reserved mainly for pan and sound-shaping/FX. Matte charcoal/grey surfaces, restrained amber accents, neutral typography, minimal rounding, stable interaction states.

## Repository structure
- `docs/` build plan and UI specification, basic architecture of Max/MSP + javascript, peer-review of technical architecture by Copilot (see ARCHITECTURE_REVIEW.md)
- `patches/` Max/MSP builds
- `prototype/showcase-v4/` current p5.js visual prototype
- `design/figma-export/` current Figma AI export reference

## Current build status
The original Pod A build pass established the core Max engine: `dropfile → buffer~ → waveform~ → groove~ → volume/pan → stereo out`. The next implementation target is the complete Pod A sampler UX before duplicating the pod A–F.
