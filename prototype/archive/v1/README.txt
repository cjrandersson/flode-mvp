flöde~ p5.js visual prototype

Confirmed concepts represented:
- 6 independent sampler pods, always in one responsive window
- waveform per pod, including real waveform preview when audio is dropped
- Mute + Solo beside pod status indicator
- volume slider + pan knob
- speed, range, rnd, rnd2, jitter, pitch
- transient density % and slice markers
- pure / weighted / memory random modes
- groove~ / play~ engine concept
- HQ / LO interpolation switch
- bonk~ / sigmund~ detection concept
- sync/free per pod, choke groups A-E
- loop, record and panic
- per-pod LP/HP, tape/saturation, compressor, 3-band EQ panel
- separate draggable/resizable flöde~ BPM window
- numeric BPM input from 1 upward
- time signatures: 4/4, 3/4, 2/4, 6/8, 5/4, 7/8, 9/8, 12/8, 2/2, 5/8
- internal / MIDI clock concept
- master FX chain: reverb, echo, delay, drive, limiter
- master output level
- SHIFT + drag precision
- CTRL + wheel waveform zoom
- matte grey / Amiga-MPC / Ableton-Fors visual direction

This is intentionally a UI/UX prototype. It does not implement the Max/MSP DSP engine yet.
Open index.html in a browser with internet access, or paste sketch.js into editor.p5js.org.
