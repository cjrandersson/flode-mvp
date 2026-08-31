# flöde~ Pod A — Build 03B AUDIO-SAFE

This replaces the failed Build 03A.

## Rule for this build
The verified Build 02B audio path is preserved unchanged:
dropfile → buffer~ → waveform~ → groove~ → volume → ezdac~

New features must not be able to silence that path.

## Added safely
- loadbang defaults:
  - speed 1.0
  - volume 0.7
  - pan 0
  - loop ON
- loop control
- PAN as a SECOND test output path
- START / END / FADE / MUTE / SOLO / REC / PANIC visible but intentionally isolated
- Jungulator/random controls remain isolated placeholders

## Test
1. Open patch.
2. Drop WAV/AIFF.
3. Enable the FIRST ezdac~ next to the verified volume path.
4. Audio should play with speed 1.0 and volume 0.7 already initialized.
5. Confirm LOOP works.
6. Then disable first ezdac~ and enable SECOND ezdac~ to test PAN.
7. Test PAN -1 / 0 / +1.

Do not judge START/END/fades yet: they are intentionally not connected in this build.

## Gate to 03C
Only after both the direct output and pan test pass do we bind waveform/start/end.
