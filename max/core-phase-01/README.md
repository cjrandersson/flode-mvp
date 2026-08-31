# flöde~ core — phase 01

This is the first modular Max/MSP extraction inspired by `nya_jung`.

## Included

- Six reusable sampler pods
- Drag-and-drop sample loading
- Waveform display
- Sixteen steps per pod
- Probability per pod
- Volume, stereo balance and mute
- Shared BPM clock and visible step counter
- Master gain, clipping protection and stereo meters

## Open

1. Open `flode_core.maxproj` in Max 9.
2. Open `flode_core.maxpat` if it does not open automatically.
3. Switch to Presentation Mode.
4. Drop a WAV or AIFF file on the drop target at the top-right of a pod.
5. Select steps, press **PLAY**, then enable **AUDIO**.

Each pod begins with steps 1, 5, 9 and 13 active. Probability defaults to 100%, pod volume to 0.7 and master volume to 0.7.

## Architecture

`flode_pod.maxpat` is a reusable abstraction. The six instances use independent buffers named from their instance argument (`flode.buf.1` through `flode.buf.6`). All pods listen to the shared `flode.step` clock.

The original `nya_jung` files remain unchanged. This phase deliberately extracts the useful behaviour into a smaller structure before adding transient slicing, choke groups, per-step velocity, jitter, waveform selection, MIDI clock and preset persistence.

## Current limits

- Structural JSON validation has been completed, but the patch still needs an audio run inside Max 9 on the target computer.
- Samples are not yet embedded or copied into the project.
- Pan currently behaves as stereo balance.
- The sequencer state is not yet stored with `pattrstorage`.

