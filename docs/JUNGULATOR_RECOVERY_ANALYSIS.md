# Jungulator recovery analysis

Date: 2026-09-19

## Goal

Preserve and recover as much technically useful material as possible from the available **I Am The Mighty Jungulator** artifacts before flöde~'s Max/MSP engine is redesigned.

This work is intentionally **non-destructive**. Original files on `main` are treated as forensic source material and must not be overwritten. Any future repaired or reconstructed variants should be written separately on `max-msp` with their provenance recorded.

## Source artifacts currently available

The source artifacts were uploaded on `main` and are now mirrored byte-for-byte onto `max-msp` so the specialist can inspect them without touching the originals:

```text
patches/jungulator_notOriginal/iamthepcjungulator_notOriginal.maxpat
patches/jungulator_metro/jungulator_metro.maxproj
patches/jungulator_metro/patchers/jungulator_metro.maxpat
patches/jungulator_audiooptions/jungulator_audiooptions.maxproj
patches/jungulator_audiooptions/patchers/jungulator_audiooptions.maxpat
patches/iamthepcjungulator.mxf
```

The mirrored files on `max-msp` reference the exact Git blob objects already present on `main`; no content conversion or re-save was performed.

---

## Initial findings

### 1. `iamthepcjungulator_notOriginal.maxpat`

The file is readable Max patch JSON and opens with a normal top-level `patcher` object. It identifies itself as Max 8.6 x64 material.

However, this is **not a lossless original Jungulator patch**. The content itself labels the file as a:

> `modern UI shell for the reconstructed Max/MSP collective`

and:

> `performance layout / non-lossless reconstruction`

It includes modern flöde~/Jungulator presentation elements such as `adc~ 1 2`, an input gain stage, meter, Live UI controls and newly styled presentation panels.

The reconstructed shell does contain working-looking placeholder/core objects such as `groove~ snd 2`, `metro 125`, `random 128`, and `coll jungulator_patterns`, but those objects belong to the reconstruction and must **not** be assumed to prove how the original Jungulator worked.

**Recovery value:** useful for UI/layout intentions and as a later reconstruction shell, but it must not be treated as authoritative evidence for the original Jungulator DSP or generative algorithm.

**Do not use this file alone to reverse-engineer Jungulator's musical behaviour.**

### 2. `jungulator_metro.maxpat`

This file is substantially more valuable than its folder name initially suggests.

It is valid Max JSON after export/save in Max 9.0.7 x64 and contains legacy-style hidden control wiring, `loadbang`, `pcontrol`, message-driven window/control behaviour, MIDI output (`noteout 2`), recording support (`sfrecord~ 2`) and many older patching idioms.

A first serialized-object scan also reveals a **large amount of embedded timing/random logic**. The file contains dozens of occurrences of explicit `metro` and `random` objects, including examples such as:

```text
metro 10
metro 5
random 100
random 7
random 8
random 40
```

This strongly suggests the export contains nested/embedded legacy subpatchers rather than only a small BPM control strip. The repeated clocks and random generators are exactly the type of evidence we need for understanding Jungulator's rhythmic unpredictability.

At the same time, an initial text scan does **not** find obvious canonical sample-playback objects such as:

```text
buffer~
groove~
play~
sfplay~
index~
```

That does not prove sample playback is absent, because the original may use other mechanisms or packaged dependencies, but it means we should not yet claim that the six-pod audio engine has been recovered from this export.

The associated `jungulator_metro.maxproj` is structurally simple and lists only `jungulator_metro.maxpat` as a local top-level patcher. Its project search path is empty and no additional project-local dependencies are declared there.

**Recovery value:** **very high** for global control, BPM/metro, record/control-panel relationships, random/event generation and legacy event ordering.

This file should be audited object-by-object before any cleanup. Hidden objects, zero-height patching rectangles, obsolete-looking gates and repeated nested subpatchers may encode timing behaviour that matters musically.

### 3. `jungulator_audiooptions.maxpat`

This is readable Max patch JSON and contains concrete legacy audio-driver/settings logic rather than a cosmetic mock-up. Observed objects include:

- `adstatus overdrive`
- `adstatus takeover`
- `adstatus iovs`
- `r autointoff`
- gates, toggles, menus and hidden control wiring
- UI for Scheduler in Audio Interrupt and I/O vector-size settings

The associated `.maxproj` declares only this patcher as its local top-level patch and has no project search path.

**Recovery value:** medium to high as documentation of how the original application managed Max audio/scheduler preferences. Some application-level settings will probably not belong inside a modern Max for Live device, but they are genuine architectural evidence and should remain preserved.

### 4. `iamthepcjungulator.mxf`

This is currently the most important unresolved artifact.

Repository metadata shows it is approximately **7.64 MB**, and text decoding fails immediately because the file is binary. That is consistent with an older Max Collective rather than a modern plain-text `.maxpat`.

Cycling '74 documentation still recognizes `.mxf` as a **Max Collective** format. Collectives can bundle patchers and their dependencies, including abstractions, external objects and media. This means the `.mxf` may contain precisely the material missing from the text exports.

The original `.mxf` must therefore remain untouched. Do not rename, re-save or overwrite the only source copy as part of experimentation.

**Recovery value:** potentially **critical**.

---

## What is already salvageable

The available material is not empty or merely cosmetic. We can now distinguish at least four layers:

1. **Modern reconstructed shell** — `jungulator_notOriginal`
2. **Legacy global/event/random/timing material** — `jungulator_metro`
3. **Legacy application audio/scheduler settings** — `jungulator_audiooptions`
4. **Potential original collective payload** — `iamthepcjungulator.mxf`

The important consequence is that recovery should be performed as a **forensic merge of evidence**, not by choosing one file and declaring it the original source.

---

## Can the current files be "repaired" now?

### Safe conclusion

At this stage there is **no evidence of simple corruption in the readable `.maxpat` files that justifies rewriting them**.

They parse as structured Max JSON, and the unusual hidden objects, old-style controls and odd geometry are not automatically errors. Cleaning them up prematurely could destroy useful behavioural evidence.

Therefore no original patch was modified.

### What can be repaired automatically later

Only objective, mechanically verifiable damage should be repaired, for example:

- invalid JSON syntax
- patch cords that refer to provably missing box IDs
- broken local paths where the intended target is unambiguous
- duplicated IDs introduced by an export error
- missing project metadata that can be reconstructed without inventing musical logic

Any such fixed file should be written separately beneath:

```text
patches/recovered/
```

with a provenance note.

### What must not be fabricated

Do **not** invent missing:

- DSP chains
- randomisation algorithms
- pod interrelationships
- clock divisions
- pitch/rate behaviour
- sample start/end logic
- quantisation rules

just to make an incomplete patch look complete.

---

## `.mxf` recovery path

Because the `.mxf` is the best chance of recovering original embedded material, it gets its own controlled workflow.

### Step A — preserve the original

Keep:

```text
patches/iamthepcjungulator.mxf
```

read-only in practice. Perform all experiments on a copy outside the repository or in `patches/recovered/work/`.

### Step B — first try current Max

Open a copy directly in Max. Modern Max still recognizes `.mxf` as a Collective format.

Record:

- whether it opens
- Max Console output
- missing externals
- missing files
- warnings about old object classes
- whether nested patchers can be opened

Do not save over the source.

### Step C — if current Max refuses it

The file may come from an older Max generation. A compatible older Max/Max Runtime environment, particularly the generation used to build the collective, may be required to inspect it correctly.

The goal is to **open/extract**, not to run an automatic conversion that overwrites the source.

### Step D — export recovered patchers separately

If Max exposes embedded patchers, save/export each recovered patch independently under a new path, for example:

```text
patches/recovered/mxf/
  main.maxpat
  pod-a.maxpat
  pod-b.maxpat
  ...
```

Keep names from the collective where possible rather than inventing new ones.

### Step E — dependency inventory

For every recovered patcher record:

- Max object classes
- abstractions
- send/receive names
- named buffers/tables/colls
- external objects
- bundled media
- clock sources
- audio I/O routes

Only after this map exists should we decide what belongs in flöde~.

---

## Behavioural evidence to extract from `jungulator_metro`

The next detailed audit should focus on the repeated timing/random structures.

Questions to answer:

1. What triggers each `metro 5` / `metro 10` clock?
2. Are those clocks local modulation clocks or musically quantized pod clocks?
3. What do `random 40`, `random 100`, `random 7`, `random 8`, etc. feed?
4. Are random outputs used directly, scaled, gated, thresholded or quantized?
5. Do six repeated structures correspond to the six pods?
6. Are there common send/receive buses coupling their timing?
7. Is event ordering enforced with `trigger` (`t`) objects?
8. Which branches are only UI/status logic versus actual musical control?
9. How does the `sfrecord~ 2` path connect to the rest of the instrument?

This is likely where part of the Jungulator "behavioural DNA" is hiding.

---

## Current uncertainty / missing evidence

We have not yet demonstrated that the available text patchers contain the complete six-pod sample-mangling engine.

The following still need to be located or recovered before claiming the original algorithm has been reconstructed:

- actual per-pod sample playback mechanism
- original start/end/loop manipulation
- rate/pitch/reverse behaviour
- randomisation/probability system in full context
- quantisation or clock-coupling rules
- relationships between pod clocks
- shared BPM/master timing implementation
- any abstractions/subpatchers used by the six pods
- buffers/sample storage
- original recording path beyond the visible `sfrecord~` portion
- external objects or embedded resources
- send/receive names tying otherwise separate patchers together

---

## Repair policy

All recovery work is **forensic and additive**.

Original source artifacts remain untouched.

Repaired material must state:

- source file
- date recovered
- exact change made
- why the change was considered safe
- whether behaviour changed

The history of a strange old patch is evidence. A neat patch is not necessarily a faithful patch.

---

## Next recovery steps

1. Open/test each readable `.maxpat` in Max and capture console errors/missing objects.
2. Build an object/dependency map of `jungulator_metro.maxpat`, with special focus on the repeated metro/random structures.
3. Inventory send/receive names and nested subpatchers.
4. Audit `jungulator_notOriginal` separately so its modern reconstruction never contaminates our understanding of the original.
5. Attempt controlled extraction of `iamthepcjungulator.mxf` using Max.
6. Export any recovered `.mxf` patchers without overwriting the collective.
7. Compare recovered patchers against metro/audio-options exports.
8. Build a behavioural map.
9. Only then begin the flöde~ DSP-engine implementation.

---

## Current conclusion

**There is considerably more worth rescuing than first appeared.**

`jungulator_metro.maxpat` is not merely a small BPM panel: its serialized content contains extensive repeated timing and random-generation logic, which may encode an important part of the Jungulator's rhythmic character. The text exports still do not prove that the complete per-pod audio engine survived, so the 7.64 MB `.mxf` remains our strongest candidate for recovering the missing original patchers and dependencies.

No original source artifact has been modified during this analysis.
