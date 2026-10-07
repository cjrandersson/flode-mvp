<img width="1115" height="680" alt="image" src="https://github.com/user-attachments/assets/3948386f-8366-4539-8d8c-84193204560c" />

# flöde~ MVP

flöde~ is a six-pod sampler, generative sequencer, audio mangler and looper built around a shared master clock/BPM. The project evolves the character and workflow of the original I Am The Mighty Jungulator into a cleaner, more robust Max/MSP / Max for Live / standalone instrument.

---

# 🎛️ DEVELOPMENT COCKPIT

> **Operativ source of truth för projektets aktuella läge.** Den visuella tavlan ska hållas synkroniserad med Issue #5, aktuell branch-status, owners, milestones och nästa steg.

![flöde~ Development Cockpit](assets/graphics/development-cockpit.svg)

**UI R&D prototype — 2026-10-01:** Nine [original references](design/ui/component-atlas/references/) are now supplied; eight are inspected directly and the all-POD screenshot crop is [reviewed separately](design/ui/component-atlas/references/ANALYSIS.md). The new [reference-element library](prototype/ui-reference-elements/) supplies eight JavaScript/Max/p5 families and twenty-six editable SVG assets. CJ selected **Jersey 10 for labels/POD letters and IBM Plex Mono for numbers**; both fonts are bundled, and [UI LAB 001](prototype/ui-lab-001/) now uses that pairing. Thirteen element checks and ten lab checks passed with host calls recorded. The [source map](prototype/ui-reference-elements/SOURCE_MAP.md) links every reference to concrete elements and stack entry points. **Next owner: @cjrandersson** — install the fonts and open the Max/browser studies for actual-host review. The all-POD original is already present; only its full-resolution visual details remain unreviewed. Alpha engine checkpoints remain in [Issue #5](https://github.com/cjrandersson/flode-mvp/issues/5). Earlier [Max](prototype/max9-pod-a/), [p5](prototype/p5-pod-a/) and [Component Atlas](design/ui/component-atlas/) studies remain available.

---

## Max/MSP quick access — `max-msp`

- **Open first — Max project:** [flode_alpha_01.maxproj](https://github.com/cjrandersson/flode-mvp/blob/max-msp/patches/flode_alpha_01/flode_alpha_01.maxproj)
- **Main patch:** [flode_alpha_01.maxpat](https://github.com/cjrandersson/flode-mvp/blob/max-msp/patches/flode_alpha_01/patchers/flode_alpha_01.maxpat)
- **Pod A patch:** [flode_pod_v01.maxpat](https://github.com/cjrandersson/flode-mvp/blob/max-msp/patches/flode_alpha_01/patchers/flode_pod_v01.maxpat)
- **All Max patchers:** [patches/flode_alpha_01/patchers/](https://github.com/cjrandersson/flode-mvp/tree/max-msp/patches/flode_alpha_01/patchers)
- **Test audio / media:** [patches/flode_alpha_01/media/](https://github.com/cjrandersson/flode-mvp/tree/max-msp/patches/flode_alpha_01/media)
  - [Apache Break ( Driven Silk Red ).wav](https://github.com/cjrandersson/flode-mvp/blob/max-msp/patches/flode_alpha_01/media/Apache%20Break%20(%20Driven%20Silk%20Red%20).wav)
  - [JAY_DEE_vol_01_kit_03_hihat.wav](https://github.com/cjrandersson/flode-mvp/blob/max-msp/patches/flode_alpha_01/media/JAY_DEE_vol_01_kit_03_hihat.wav)
  - [Om Unit - Ambient Breakbeat Sample Pack - 60 Kick Thump.wav](https://github.com/cjrandersson/flode-mvp/blob/max-msp/patches/flode_alpha_01/media/Om%20Unit%20-%20Ambient%20Breakbeat%20Sample%20Pack%20-%2060%20Kick%20Thump.wav)
- **Max 9 test evidence:** [docs/test-evidence/max9/stage1/](https://github.com/cjrandersson/flode-mvp/tree/max-msp/docs/test-evidence/max9/stage1)
  - [stage1-max9-podA-apache-buffer-loaded.png](https://github.com/cjrandersson/flode-mvp/blob/max-msp/docs/test-evidence/max9/stage1/stage1-max9-podA-apache-buffer-loaded.png)
- **Expanded quick-link index:** [MAX_MSP_QUICK_LINKS.md](https://github.com/cjrandersson/flode-mvp/blob/max-msp/MAX_MSP_QUICK_LINKS.md)

## Locked MVP direction
- Six independent sampler pods A–F in one window
- Large Simpler-inspired waveform/slice view per pod
- Drag/drop audio, loop start/end, speed, pitch ±500 cents, volume and pan
- Original Jungulator controls retained and made clearly visible
- RND: slice/sample-position probability amount
- RND2: velocity/playback-speed variation
- Random modes: Jung, Weighted, Walk, Memory, Chaos
- Transient slicing and density control
- Sync/free operation per pod; shared master clock and BPM
- Mute, Solo, Record, Panic and choke groups
- Per-pod FX send into one shared, reorderable master FX chain
- Separate resizable flöde~ BPM/transport window

### POD v0 signal and timing rules
- The master clock owns musical time. A pod does not maintain a competing clock.
- No per-sample BPM display or BPM detection.
- No time-stretch / tempo-lock in POD v0.
- Playback is intentionally direct: speed plus pitch (±500 cents), without automatic tempo preservation.
- Each pod outputs a dry signal plus an adjustable FX-send level to the shared master FX chain.
- JUNG may alter playback behavior inside master time, but an intervention must resolve and return home before another intervention begins.

### Waveform interaction baseline
The waveform is a first-class instrument surface, not a metadata display.

- The sample waveform itself is visually stable.
- **Cursor/playhead motion is the primary continuous animation.** It should be subtle, readable and physically weighted.
- Active slice/state may change discretely, but the waveform should not wobble, pulse or animate decoratively.
- Transient slicing is the default slice mode.
- Grid slicing is the simple fallback mode.
- Slice/transient markers are anchored to the waveform and can be dragged directly along it.
- Start/end, loop and slice state all refer to the same waveform window.
- JUNG operates only within the currently defined waveform/slice domain.

**Interaction principle: everything has mass.** Movement must communicate playback or state, with inertia and restraint. The waveform carries the visual weight; the cursor reveals time.

## UI baseline
The interface must feel like an audio instrument, not a web dashboard. Waveforms and primary gestures are large. Playback/random/volume use sliders. Rotary knobs are reserved mainly for pan and sound-shaping/FX. Matte charcoal/grey surfaces, restrained amber accents, neutral typography, minimal rounding, stable interaction states.

## Repository structure
- `docs/` build plan and UI specification, basic architecture of Max/MSP + javascript, peer-review of technical architecture by Copilot (see ARCHITECTURE_REVIEW.md)
- `patches/` Max/MSP builds
- `prototype/showcase-v4/` current p5.js visual prototype
- `design/figma-export/` current Figma AI export reference

## Current build status
The original Pod A build pass established the core Max engine: `dropfile → buffer~ → waveform~ → groove~ → volume/pan → stereo out`. The active Alpha 0.1 work remains constrained to `max-msp` and Issue #5.
