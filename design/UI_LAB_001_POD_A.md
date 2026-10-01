# UI LAB 001 — POD A / Waveform First

**Status:** CJ APPROVED design direction  
**Branch:** `max-msp`  
**Scope:** design/R&D only. This document does not authorize changes to the locked Alpha 0.1 / Issue #5 implementation order.

## Objective

Build the simplest crisp `mgraphics` representation of POD A first. The UI should feel like an instrument, not a dashboard: immediate waveform, obvious play position, a small number of readable controls, and restrained modular colour.

Simplify rather than add controls.

## POD A composition

```text
POD A                                      APACHE

    cyan       orange       acid/yellow
      ╲          │             ╱
▁▂▅▇▃▂▁▃▆▅▂▁▂▇▅▃▁▂▅▇▆▂▁▃▅▂▁
────────────────────────────────────────
         ↑ PLAYHEAD
      [ ACTIVE REGION ]

VOL        PAN        SPEED

──●──      ─●──       ──●──

JUNG
STABLE ─────────────●──────── RESTLESS

EQ
LOW        MID        HIGH
──●──      ─●──       ──●──
```

## Visual DNA

- FORS-inspired restraint: dark matte field, thin geometry, strong negative space, no decorative chrome.
- Modular rather than skeuomorphic.
- Extremely crisp rendering and typography. Avoid unnecessary shadows, bevels, fake hardware and visual noise.
- Waveform is the visual centre of gravity.
- Multicolour waveform accents may move between cyan, orange and acid/yellow. Colour should communicate regions/activity rather than become decoration.
- POD identity must remain readable at a glance: `POD A` + `APACHE`.
- Controls should remain compact enough that the waveform has room to breathe.

## Waveform

The waveform must be a real first-class UI element, not a decorative placeholder in the eventual runtime implementation.

Design representation should support:

- waveform overview;
- visible playhead;
- visible active region;
- clear selected/active state;
- subtle region colouring;
- smooth but restrained state transitions.

Animation should be functional: playhead movement, active-region state and control response. Avoid gratuitous motion.

## Primary controls

Only expose the currently useful musical surface:

- **VOL**
- **PAN**
- **SPEED**
- **JUNG:** `STABLE ↔ RESTLESS`
- **3-band EQ:** `LOW / MID / HIGH`

JUNG is one musically meaningful tension control. Do not expose underlying probabilities for reverse, repeat, slicing, offsets or other internal behaviours here.

## Three-band EQ treatment

EQ belongs on every POD, but should visually read as a quiet secondary zone rather than another panel competing with the waveform.

Use three compact controls: LOW, MID, HIGH. Give the EQ region a very subtle local colour/illumination cue that fades softly at its edges into the surrounding dark surface. The fade should suggest entering a tonal-shaping zone without drawing a hard card or box around it.

Keep it clean enough that bypass/neutral state feels almost invisible.

## Interaction principles

- Immediate feedback.
- Small number of obvious targets.
- Fine adjustment may use Shift-drag where appropriate.
- Avoid parameter jumps on interaction.
- Prefer direct manipulation over menus.
- No deep probability editor.
- No UI mode proliferation.

## JUNG design invariant

The UI representation must remain compatible with the approved JUNG manifesto:

> The master clock owns time. JUNG never does.

JUNG should create controlled instability while remaining anchored to musical time. UI LAB 001 therefore represents JUNG as `STABLE ↔ RESTLESS`, not as a matrix of independent probability parameters.

No JUNG DSP/engine implementation is authorized by this UI document.

## Engineering boundary

This is an R&D/design specification. It must not be used to bypass Issue #5 or introduce production UI into the current Alpha milestone.

Do not introduce as part of this lab:

- PODs B–F runtime implementation;
- JUNG engine behaviour;
- sequencer functionality;
- production transport architecture;
- effects or recording;
- timestretch/pitch correction;
- unrelated DSP changes.

The existing `design/v8ui_mgraphics_ui.js` is a visual/prototyping reference. UI LAB 001 deliberately narrows the next exploration to **POD A only** before generalising a six-POD system.

## Success criterion

A successful first pass should make CJ immediately understand four things without explanation:

1. what sample POD A contains;
2. where playback currently is;
3. what region is active;
4. how to shape level, stereo position, speed, JUNG tension and basic tone.

If additional UI makes any of those harder to read, simplify it.
