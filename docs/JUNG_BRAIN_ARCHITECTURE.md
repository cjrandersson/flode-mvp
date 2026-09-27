# JUNG Brain — Behavioural Architecture

**Status:** Architecture direction for flöde~ Alpha 0.1  
**Branch:** `max-msp`  
**Date:** 2026-09-20

This document describes the proposed architecture beneath flöde~ for producing generative behaviour that remains musical, contextual and difficult to reduce to an obvious random-number pattern.

The goal is not maximum randomness. The goal is behaviour.

---

## Core behavioural loop

The JUNG engine is based around a feedback loop:

```text
MEMORY → TENDENCY → PROBABILITY → EVENT → MEMORY
   ↑                                      │
   └──────────────────────────────────────┘
```

A naive random system repeatedly does this:

```text
RANDOM → EVENT
RANDOM → EVENT
RANDOM → EVENT
```

Such a system can be mathematically unpredictable while becoming aesthetically predictable. The listener quickly learns that the machine simply chooses unrelated new values.

JUNG should instead make each decision in the context created by its previous decisions.

---

## 1. MEMORY

Each POD maintains a short history of recent musical decisions, for example:

```text
event       143
slice       7
rate        0.98
jitter      +3 ms
repeat      1
reverse     false
intensity   0.12
```

The system does not need a long historical database. Alpha can begin with approximately 16–64 recent events plus useful summaries such as:

```text
sameSliceCount
recentAvgRate
eventsSinceSurprise
recentIntensity
tension
```

Memory exists to create context, not merely logging.

It allows the engine to know, for example, that it has repeated a segment several times, that recent playback has been stable, or that a large variation occurred only moments ago.

---

## 2. TENDENCY

Memory modifies what the engine is currently inclined to do.

Instead of asking:

> Which slice should be randomised?

JUNG asks:

> Given what has just happened, what kinds of action are currently plausible?

Example after two repetitions of the same slice:

```text
repeat current slice     45%
nearby slice             35%
different slice          17%
wild jump                 3%
```

After five repetitions:

```text
repeat current slice     10%
nearby slice             48%
different slice          35%
wild jump                 7%
```

The random-number source can remain simple. The probability landscape surrounding it changes because history changes.

This is where behaviour begins to emerge.

---

## 3. PROBABILITY

Only after the tendency landscape has been calculated does the system draw a random value.

A value such as:

```text
0.6382
```

has no musical meaning by itself.

The current weighted tendency may cause it to mean:

```text
choose nearby slice
```

A second weighted choice can determine which nearby slice is selected.

Randomness therefore operates *inside context* rather than creating the context itself.

---

## 4. EVENT

The JUNG brain produces a compact musical instruction such as:

```text
pod       A
slice     8
rate      0.94
offset    +6 ms
repeat    1
reverse   false
```

At this boundary, behavioural decision-making ends and the timing/audio engine takes responsibility.

The time-critical Max/MSP layer schedules the event, reads the appropriate audio region, applies the required playback rate/direction, performs retriggering where needed, and applies the short de-click/envelope behaviour defined elsewhere in the project requirements.

The behavioural layer should not perform sample-by-sample DSP.

---

## 5. EVENT → MEMORY

Once an event has been chosen/executed, its relevant properties are written back into memory.

The next decision is therefore made from a different world-state than the previous one.

This feedback is fundamental. JUNG is not a stream of independent dice rolls.

---

# Proposed system layers

```text
┌────────────────────────────────────────────┐
│                    UI                      │
│          Robin's flöde~ interface          │
└────────────────────┬───────────────────────┘
                     │ parameters / state
                     ↓
┌────────────────────────────────────────────┐
│                 POD STATE                  │
│ sample / pattern / jung / rate / etc.     │
└────────────────────┬───────────────────────┘
                     │
          ┌──────────┴──────────┐
          ↓                     ↓
┌──────────────────┐   ┌─────────────────────┐
│    SEQUENCER     │   │     JUNG BRAIN      │
│ Max clock        │   │                     │
│ steps            │   │ memory              │
│ probability      │   │ tendency            │
│ divisions        │   │ tension             │
└────────┬─────────┘   │ surprise            │
         │             │ mathematical drift  │
         │             └──────────┬──────────┘
         │                        │
         └────────────┬───────────┘
                      ↓
               EVENT DECISION
                      ↓
┌────────────────────────────────────────────┐
│            MAX PLAYBACK ENGINE             │
│                                            │
│ slice / start / end / rate / direction    │
│ envelope / de-click / retrigger           │
└────────────────────┬───────────────────────┘
                     ↓
                    MSP
                     ↓
               AUDIO / FX / MIX
```

The six PODs share global transport but maintain their own musical state.

A later global JUNG context may allow PODs to respond to one another without merging their individual identities.

For example, if POD C has just produced a high-intensity fill, the probability of POD A and POD B simultaneously producing extreme events may temporarily decrease. This creates space and begins to model ensemble interaction rather than six unrelated random generators.

---

# Technology direction

Alpha 0.1 should avoid unnecessary external dependencies.

## Native Max/MSP

Use Max/MSP for time-critical scheduling, playback and DSP.

Likely building blocks include, subject to testing against original Jungulator behaviour:

- `transport`, `metro`, `qmetro` and/or signal-rate timing such as `phasor~`;
- `buffer~` for sample storage;
- `groove~`, `play~` or a purpose-built playback structure after recovery/A-B testing determines which behaviour best fits;
- `line~` / `curve~` or equivalent for short envelopes and de-clicking;
- `dict` for structured state;
- `coll` where pattern/table storage is appropriate;
- `zl` operations for list/history manipulation;
- simple Max primitives such as `counter`, `%`, `select`, `urn` and `random` where they remain useful.

## JavaScript for Max (`js`)

Use JavaScript for Max as the likely first home for the higher-level JUNG behavioural state machine:

- short-term event memory;
- tendency calculations;
- weighted probability selection;
- tension/release state;
- surprise budget;
- prime-cycle state;
- Euclidean permission masks;
- deterministic seeded test behaviour;
- generation of compact event instructions for the Max timing/playback layer.

JavaScript should not become the audio engine. Max/MSP remains responsible for time-critical musical scheduling and DSP.

Alpha does not require Node, Python, machine learning, cloud services or an internet connection for the JUNG behaviour.

---

# Structured mathematical drift

Prime cycles, Euclidean distributions and related structures should be treated as invisible behavioural scaffolding rather than UI modes or mathematical decoration.

Possible uses include:

```text
Euclidean structure  → where variation is permitted
Prime cycles         → slowly changing phase relationships
Probability          → what occurs at an allowed moment
Memory               → how recent history reshapes that choice
Tension              → how far from stability the system may currently travel
```

Prime cycles such as 5, 7, 11 and 13 can cause internal processes to meet in continually changing phase relationships before the complete state repeats.

Euclidean masks can create geometrically distributed opportunities for variation instead of independent probability checks at every step.

These systems should be evaluated by ear. If an elegant mathematical structure does not improve musical behaviour, it does not earn a place in Alpha.

---

# Seeded behaviour for development

JUNG should support deterministic seeds during development.

Normal performance can use a fresh/random seed. Testing can specify a seed such as:

```text
seed = 42691
```

This allows an apparently spontaneous performance to be reproduced exactly enough to inspect why a particular passage worked.

A development log might eventually expose decisions such as:

```text
tension            .71
recent repetitions 3
prime-11 condition true
surprise budget    .83

→ slice 14
→ rate .917
→ +11 ms
→ retrigger 3
```

This makes the generative system experimentally observable. When Robin hears a moment that feels unusually human, musical or surprising, the team can reproduce the decision sequence, inspect its causes and tune the behaviour rather than waiting for chance to produce the same moment again.

---

# Architectural principle

Complex musical behaviour should emerge from small understandable mechanisms interacting across different time scales.

The objective is not to maximise the number of controls, modes or random parameters. The engine should have fewer interacting systems whose behaviour can be understood, tested and tuned by ear.

Repetition is necessary. Stability is necessary. Silence between unusual events is necessary. Without expectation, deviation has no musical meaning.

The original Jungulator remains the behavioural reference, especially for its unusual relationship between timing, sample position, playback rate, repetition and instability.

flöde~ should preserve that character while gaining memory, sequencing and structured generative behaviour that the original instrument did not have.

> **We are not building a random generator. We are building a small dynamic system that makes musically constrained decisions and is changed by its own previous decisions.**
