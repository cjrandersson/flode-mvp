# UI LAB 001 — POD A / Waveform First

**Status:** CJ APPROVED — authoritative POD UI direction  
**Branch:** `max-msp`  
**Scope:** design/R&D only. This document does not authorize bypassing the locked Alpha 0.1 / Issue #5 implementation order.

## Core rule

**Simplify before adding. Waveform first.** POD A establishes the visual and interaction grammar before it is generalized to B–F.

## Approved POD A concept

```text
POD A                                                     APACHE        M  S

                  TRANSIENTS  ‹ MODE ›  BEAT
                   baby blue          amber/red

╭────────────────────────────────────────────────────────────────────╮
│   │       │  │             │         │                            │
│ ▁▃▆█▅▂▁▂▅▇▃▂▁▃▇█▅▂▁▃▆▅▂▁▂▅▇▃▁                          │
│       ├──────────── ACTIVE REGION ─────────────┤                   │
│                         ↑ PLAYHEAD                                  │
│       START ●──────────────────────────● END                        │
│             ↘ FADE                      FADE ↙                      │
╰────────────────────────────────────────────────────────────────────╯
 LOOP ●                  SENS 42% / DIV 1/16

 FILTER                                           EQ
 ● ON                                       LOW   MID   HIGH
 LP · HP · BP                                ●     ●     ●
 FREQ ━━━━━●━━━━                           ╭──╯╲___╱╰──╮
 RES  ━━●━━━━━━━━

 VOL             PAN             SPEED             FX AMOUNT
 ━━●━━━━         ━━━●━━━         ━━━●━━━               ◯ 38%

 JUNG
 STABLE ━━━━━━━━━━━━━━━━━●━━━━━━━━━━━━━━━━ RESTLESS
```

ASCII is structural guidance, not a request for hard boxes around every region.

## Visual DNA

- FORS-inspired restraint: dark matte field, thin precise geometry, strong negative space.
- Modular rather than skeuomorphic.
- Extremely crisp waveform, typography and alignment.
- Avoid decorative chrome, fake hardware, unnecessary borders and visual noise.
- Multicolour signal language uses restrained cyan/baby blue, orange and acid/yellow with complementary amber/red where specified.
- Colour communicates mode, state, signal or interaction. It is not decoration.
- `POD A` and `APACHE` remain immediately readable.

## Waveform / audio player

The waveform is the dominant object and the main interaction surface, not a decorative preview.

It supports:

- waveform overview;
- visible playhead;
- visible active region;
- direct START and END/LENGTH handles;
- loop region/state;
- loop/sample fade handles;
- clear selected/active state;
- restrained multicolour signal information.

Prefer direct manipulation inside the waveform over duplicating the same functions as rows of conventional sliders beneath it.

### Slice analysis modes

Use `< >` arrows to toggle between exactly these two analysis modes for this concept:

**TRANSIENTS — baby blue**  
Automatically detect audio peaks/transients and place slice markers. Expose a simple **Sensitivity %** control. Detected markers inherit the baby-blue mode language.

**BEAT — complementary amber/red-orange**  
Divide the sample evenly by musical time intervals. Expose only the required musical division such as `1/4`, `1/8`, `1/16`, `1/32`. Beat markers should look regular and mathematically spaced.

Beat mode derives time from the single global Master Time/BPM. A POD never owns an independent BPM engine.

Analysis mode does not authorize additional playback/random modes.

### Loop

`LOOP` is a clear playback **state**, not a third slice mode. When enabled, the selected valid region loops. When disabled, it does not become another analysis paradigm.

## Filter

Place a deliberately small filter section down-left of the waveform.

Controls only:

- ON/OFF
- LP / HP / BP
- FREQ / cutoff
- RES / resonance

Do not add drive, slope, envelopes, key tracking or additional filter architecture in this UI pass.

The active filter region may gain a very subtle local tonal cue. When bypassed it should visually recede.

## Three-band graphical EQ

Place the EQ down-right of the waveform.

Use a minimal graphical curve with exactly three draggable control points:

- LOW
- MID
- HIGH

Vertical movement represents gain. The curve interpolates smoothly between the three points.

The EQ area should feel like a subtly different acoustic zone without becoming a card or panel. Use a faint differentiated tint that **softly fades/blur-dissolves toward the edges** back into the POD background. LOW/MID/HIGH may carry very restrained colour differences. Interaction may briefly increase the active point/curve visibility, then settle back.

No spectrum analyser, Q handles or frequency editor in this pass.

## Primary performance controls

Keep these compact and immediately readable:

- **VOL**
- **PAN**
- **SPEED**
- **FX AMOUNT — 0–100%**

`FX AMOUNT` describes the musician-facing amount of the global Master FX treatment applied to this POD. It deliberately does **not** prescribe whether the eventual DSP implementation is send/return, wet/dry crossfade or another routing model. DSP routing remains a later technical architecture decision.

Do not label this control `MASTER FX SEND` unless the actual routing architecture later becomes an aux send/return model.

## Mute / Solo

Small `M` and `S` controls belong in the POD header. They are fundamental with six PODs but should remain visually quiet until active.

## JUNG

Expose one primary behavioural continuum only:

**STABLE ↔ RESTLESS**

Do not expose probability matrices or individual reverse/repeat/slice/silence/jump/offset probabilities.

The UI remains compatible with the JUNG invariant:

> **The master clock owns time. JUNG never does.**

JUNG may change what happens, while the global timing authority determines when decisions occur. No JUNG engine implementation is authorized by this UI document.

## Master-time boundary

There is **one global Master BPM/Time only**. PODs A–F must not contain independent or duplicated BPM controls/displays. POD timing derives from the master clock.

Negative and extremely small/near-zero Master BPM values are known Jungulator legacy behaviour that must be **documented and investigated/preserved**. Their exact semantics must be verified from the original Jungulator before implementation. Do not invent a meaning for negative BPM in this UI task.

## Motion

Motion communicates state only:

- playhead movement;
- active-region transitions;
- subtle mode/state colour response;
- smooth EQ curve response;
- restrained control interpolation.

No gratuitous bounce, glow spectacle or decorative pulsing.

## Engineering boundary

This is an approved design/R&D specification, not permission to reorder Alpha development.

Do not introduce through this UI task:

- POD B–F runtime implementation;
- JUNG engine behaviour;
- sequencer functionality;
- production transport architecture;
- independent POD BPM clocks;
- recording;
- timestretch/pitch correction;
- unrelated DSP changes.

The original Jungulator artefacts remain untouched.

## Success criterion

Without explanation, CJ should be able to understand:

1. which sample the POD contains;
2. where playback currently is;
3. which region is active and how its boundaries/fades behave;
4. whether slicing is transient- or beat-derived;
5. how to shape filter and three-band tone;
6. level, pan, speed and FX amount;
7. how JUNG moves from stable toward restless;
8. mute/solo state.

If an added element makes those relationships harder to read, remove or simplify it.
