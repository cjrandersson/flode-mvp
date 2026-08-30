# flöde~ implementation roadmap

## Phase 0 — Handoff and evidence baseline

- [x] Preserve all available source files and packages
- [x] Separate current, experimental, reference and archive material
- [x] Document Jungulator lineage and reconstruction limits
- [x] Lock product/UI context for Codex

## Phase 1 — Runtime audit

- [ ] Open the three reconstructed Jungulator `.maxpat` files in Max 9
- [ ] Open the Pod A build progression and current MVP v1 in Max 9
- [ ] Open `max/core-phase-01/flode_core.maxproj`
- [ ] Capture Max Console errors and missing dependencies
- [ ] Verify sample load, waveform, loop, speed, pan and output behaviour
- [ ] Record findings in `docs/architecture/JUNGULATOR_STUDY_NOTES.md`

**Gate:** current behaviours are classified as working, broken, placeholder or untested.

## Phase 2 — Canonical POD A

- [ ] Merge the strongest verified parts of MVP v1, BUILD03C and core-phase pod abstraction
- [ ] Establish stable scripting names and state model
- [ ] Remove duplicate/unsafe audio-output paths
- [ ] Implement reliable sample load, waveform, loop range and playhead
- [ ] Implement clicksafe Volume, Pan, Mute, Solo and Panic
- [ ] Add Max for Live-friendly parameter ranges/defaults

**Gate:** one POD runs for 30 minutes without console errors, output spikes or state corruption.

## Phase 3 — Slicing and generative engine

- [ ] Implement transient analysis and slice markers
- [ ] Connect position and velocity intent from the generative engine
- [ ] Verify PURE/JUNG/WEIGHTED/WALK/MEMORY/CHAOS behaviour
- [ ] Add parameter locks, bounded ranges and visible generated-value feedback
- [ ] Add quantised and free event timing

**Gate:** all modes are musically distinct, bounded and reproducible under saved state.

## Phase 4 — Six PODs A–F

- [ ] Instantiate one reusable POD abstraction six times
- [ ] Guarantee unique buffers/state per instance
- [ ] Add shared clock, timing division, routing and choke groups
- [ ] Add Mute/Solo arbitration and per-pod meters/status
- [ ] Implement 3×2 overview and optional Focus View

**Gate:** six samples can run simultaneously with independent controls and predictable master sync.

## Phase 5 — Pod FX and master

- [ ] Add minimal pod FX slots
- [ ] Add reorderable master FX chain
- [ ] Add master gain, limiter, recorder and Panic
- [ ] Verify feedback protection and gain staging

**Gate:** no unsafe feedback/output condition and all routing restores correctly.

## Phase 6 — Max for Live packaging

- [ ] Replace development-only output wiring with production M4L routing
- [ ] Add `autopattr`/`pattrstorage` or equivalent state system
- [ ] Map important parameters for automation and Push where practical
- [ ] Test Live transport, BPM changes, save/reload, duplicate track and undo
- [ ] Save and verify production `.amxd`

**Gate:** Ableton Live 12 project reloads with audio, samples, settings and automation intact.

## Phase 7 — Release polish

- [ ] Performance profiling and CPU budget
- [ ] UI scaling and high-DPI verification
- [ ] Presets, example audio and concise manual
- [ ] Public demo/showcase URL at top of README
- [ ] Versioned MVP v1 release package
