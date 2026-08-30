# Technical extraction notes

## Reused concepts from nya_jung

- Global 16-step timing
- Probability/random trigger logic
- Shared routing between pods and master
- Per-pod mute and gain
- Central audio output

## Deliberate changes

- One reusable pod abstraction replaces repeated A–L subpatchers.
- Buffer names are scoped by abstraction argument.
- The audio engine is explicit and self-contained using `buffer~` and `play~`.
- The first version has six pods, matching the agreed flöde~ design.
- The original global names such as `poda.mute` and `receive~ al` are not carried forward.

## Next implementation pass

1. Add sample start/end selection and a playhead.
2. Add transient detection with selectable analysis method.
3. Add per-step velocity, slice, probability and jitter.
4. Add choke groups A–E and Solo/Mute arbitration.
5. Add transport quantize and MIDI clock input.
6. Add `autopattr`/`pattrstorage` session persistence.
7. Add recorder and master FX rack.

