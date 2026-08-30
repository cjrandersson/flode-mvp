# flöde~ Build 03A — Sampler UX

Built as a clean Max-native continuation of the verified Build 02B core.

Added:
- START / END controls
- LOOP
- Fade In / Fade Out UI
- equal-power style PAN stage
- MUTE / SOLO / REC placeholders
- PANIC reset
- visible placeholders for the coming Jungulator/random layer

Test order:
1. Drop WAV/AIFF.
2. Enable ezdac~.
3. SPEED = 1.0 and VOL = 0.7.
4. PAN: test -1, 0, +1.
5. LOOP on/off.
6. Test START/END values.
7. PANIC should reset speed=1, pan=0, fades=0, loop=on.

Note: fades, mute, solo and record are intentionally not final DSP yet. Waveform-to-start/end binding comes after this native control layer is verified.
