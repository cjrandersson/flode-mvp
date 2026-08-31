# flöde~ Pod A — Build 02B SAFE / NATIVE

Purpose: isolate the previous UI problem and verify the Max-native audio core before rebuilding the showcase UI.

## Deliberately removed
- Presentation Mode auto-open
- panels/background layers
- custom waveform colors
- elaborate UI attributes
- master window
- subpatchers / floating windows
- nonessential styling

## Core test
1. Open `flode_podA_BUILD02B_SAFE.maxpat`.
2. Clear Max Console before testing.
3. Drop a WAV/AIFF into `dropfile`.
4. Click `ezdac~` to enable audio.
5. Set SPEED to `1.0`.
6. Set VOLUME to `0.7`.
7. Confirm waveform appears and audio plays.

## What success means
If this opens without the old UI failure and plays audio, we have a clean foundation.
Then we add, one layer at a time:
1. waveform start/end selection
2. loop/scrub/fades
3. original Jungulator controls
4. rnd/rnd2/jitter
5. slicing/detection
6. sync/BPM
7. Pod FX
8. final flöde~ Presentation UI

The lower Jungulator controls in this file are placeholders only and are intentionally not wired yet.
