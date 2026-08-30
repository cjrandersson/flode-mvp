# Jungulator study notes

This file is intentionally started but not completed during handoff. Codex must extend it with Max 9 runtime observations before making major architectural changes.

## Structurally observed during handoff

- The original `.mxf` is a binary collective and cannot be validated as `.maxpat` JSON.
- The reconstructed skeleton contains explicit hypotheses for audio I/O, delay/resonator flow, sample memory, MIDI, clocked randomness and pattern memory.
- The redesign shell adds UI grouping and legacy VST placeholders; the clean shell removes those placeholders.
- The early flöde~ Pod A builds consistently use `buffer~` plus `groove~`/`waveform~`, with several output-safety and pan iterations.
- The core-phase experiment uses one reusable six-instance pod abstraction with unique buffer naming and shared step clock.
- The current MVP v1 is a separate one-pod patch connected to `max/current/js/flode_gen.js`.

## Runtime observations

Not yet tested in Max 9 during this handoff.

## Required comparison

Codex must document:

- which Pod A build loads and plays audio reliably
- which output topology is safe in Max and in Max for Live
- which loop/waveform implementation is most stable
- whether the core-phase abstraction can accept the current Pod A state/UI cleanly
- all console errors and missing dependencies
- confirmed signal flow versus reconstruction hypotheses
