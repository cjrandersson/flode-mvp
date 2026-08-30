# flöde~ Pod A — Build 03C / Waveform Loop

## What changed
03C is the first real waveform-controlled loop build.

I checked the current Cycling '74 Max documentation before wiring this:
- `waveform~` outlet 3 = selection start in milliseconds
- `waveform~` outlet 4 = selection end in milliseconds
- `mouseoutput/outmode continuous` outputs selection changes during dragging
- `snap zero` / zero-crossing snap is supported
- `groove~` middle inlet = loop start in milliseconds
- `groove~` right inlet = loop end in milliseconds
- `startloop` begins playback at the loop start

Therefore 03C connects waveform selection start/end DIRECTLY to groove~ middle/right inlets.
It does NOT use the incorrect `start $1` / `end $1` approach from the discarded 03A.

## Test order
1. Open patch and check Max Console.
2. Drop WAV/AIFF.
3. Enable the single ezdac~.
4. Audio should play at speed 1.0 / volume 0.7.
5. Drag a selection across the waveform.
6. START and END should change while dragging.
7. The loop should follow the selected region.
8. Click START LOOP to jump playback to the beginning of the selected region.
9. Try several short and long selections.
10. Confirm PAN still works at -1 / 0 / +1.

## Deliberately NOT added yet
- editable numeric start/end feeding back into waveform
- fades
- mute / solo / record
- panic
- zoom gestures
- transient slicing
- random / rnd2

Those come only after waveform loop behavior passes.
