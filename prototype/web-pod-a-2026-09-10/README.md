# flöde~ Pod A browser study — 2026-09-10

**Live tested build:** https://flode-pod-a.cjr-andersson.chatgpt.site

This folder is the GitHub mirror of the Pod A browser study developed and tested on 2026-09-10. The live ChatGPT Site projection cannot currently be exported byte-for-byte through the available file interface, so `index.html` preserves the current interaction model in a self-contained repository version rather than pretending to be an exact source export.

## Included behaviour

- Browser audio output with a generated 120 BPM demo loop
- Load a local audio file
- Waveform-first loop selection by dragging on the waveform
- PURE / JUNG / WEIGHTED / WALK / MEMORY / CHAOS mode selection
- Random / Jung and Jitter performance controls
- RND2 speed / velocity modulation
- Speed selector
- Volume / pan UI
- Three-band EQ UI reference
- Master BPM / Tap / Play controls

## Important current behaviour

During the listening test on 2026-09-10, **RND2 was identified as the source of the pitch-changing behaviour**. In this browser study RND2 modulates playback rate, so pitch changes together with speed. This is documented deliberately until the DSP architecture decides whether speed and pitch should later be decoupled.

The loop start/end range itself does not intentionally randomise pitch. Any perceived pitch modulation in the current study should first be checked against RND2 / playback-rate modulation.
