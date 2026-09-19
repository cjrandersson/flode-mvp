# Jungulator recovery analysis

Date: 2026-09-19

## Goal

Preserve and recover as much technically useful material as possible from the available **I Am The Mighty Jungulator** artifacts before flöde~'s Max/MSP engine is redesigned.

This work is intentionally **non-destructive**. Original files on `main` are treated as forensic source material and must not be overwritten. Any future repaired or reconstructed variants should be written separately on `max-msp` with their provenance recorded.

## Source artifacts currently available on `main`

```text
patches/jungulator_notOriginal/iamthepcjungulator_notOriginal.maxpat
patches/jungulator_metro/jungulator_metro.maxproj
patches/jungulator_metro/patchers/jungulator_metro.maxpat
patches/jungulator_audiooptions/patchers/jungulator_audiooptions.maxpat
patches/iamthepcjungulator.mxf
```

## Initial findings

### 1. `iamthepcjungulator_notOriginal.maxpat`

The file is readable Max patch JSON and opens with a normal top-level `patcher` object. It identifies itself as Max 8.6 x64 material.

However, this is **not a lossless original Jungulator patch**. The content itself labels the file as a:

> `modern UI shell for the reconstructed Max/MSP collective`

and:

> `performance layout / non-lossless reconstruction`

It includes modern flöde~/Jungulator presentation elements such as `adc~ 1 2`, an input gain stage, meter, Live UI controls and newly styled presentation panels.

**Recovery value:** useful for UI/layout intentions and as a later reconstruction shell, but it must not be treated as authoritative evidence for the original Jungulator DSP or generative algorithm.

**Do not use this file alone to reverse-engineer Jungulator's musical behaviour.**

### 2. `jungulator_metro.maxpat`

This appears materially closer to legacy Jungulator code. The patch is valid Max JSON, identifies itself as a Max 9.0.7 x64 patch after export/save, and contains legacy-style hidden control wiring, `loadbang`, `pcontrol`, message-driven window/control behaviour, MIDI output (`noteout 2`) and other older patching idioms.

The associated `jungulator_metro.maxproj` is structurally simple and lists only `jungulator_metro.maxpat` as a local top-level patcher. Its project search path is empty and no additional project-local dependencies are declared there.

**Recovery value:** high for reconstructing global control, BPM/metro, record/control-panel relationships and legacy event ordering.

The patch should be audited object-by-object before any cleanup because hidden objects and apparently obsolete wiring may encode behaviour that matters to timing or interaction.

### 3. `jungulator_audiooptions.maxpat`

This is readable Max patch JSON and contains concrete legacy audio-driver/settings logic rather than a cosmetic mock-up. Observed objects include:

- `adstatus overdrive`
- `adstatus takeover`
- `adstatus iovs`
- `r autointoff`
- gates, toggles, menus and hidden control wiring
- UI for Scheduler in Audio Interrupt and I/O vector-size settings

**Recovery value:** medium to high as documentation of how the original application managed Max audio/scheduler preferences. Some of these application-level settings may not belong in a modern Max for Live device, but they are genuine architectural evidence and should be preserved.

### 4. `iamthepcjungulator.mxf`

This is the most interesting artifact because it may preserve material from the original distributed/collective Jungulator application that is absent from the exported `.maxpat` files.

The file is binary. The GitHub text connector correctly refuses to decode it as UTF-8, so its internal patchers/resources cannot be safely inspected through the current repository text API.

**Recovery value:** potentially very high, but not yet established.

The `.mxf` must be treated as a binary forensic artifact. Do not convert, re-save or overwrite the only copy. The next extraction attempt should be performed with a compatible Max/Cycling '74 environment or another tool capable of inspecting Max collective files while retaining the original file untouched.

## What is already salvageable

The available material is not 'empty' or obviously corrupt. At least three useful layers can already be distinguished:

1. **Modern reconstructed shell** — `jungulator_notOriginal`
2. **Legacy global/event/control material** — `jungulator_metro`
3. **Legacy application audio/scheduler settings** — `jungulator_audiooptions`
4. **Potential original collective payload** — `iamthepcjungulator.mxf`

The important consequence is that recovery should be performed as a **forensic merge of evidence**, not by choosing one file and declaring it the original source.

## Current uncertainty / missing evidence

We have not yet demonstrated that the available text patchers contain the complete six-pod sample-mangling engine.

In particular, the following still need to be located or recovered before claiming the original Jungulator algorithm has been reconstructed:

- actual per-pod sample playback mechanism
- original start/end/loop manipulation
- rate/pitch/reverse behaviour
- randomisation/probability system
- quantisation or clock-coupling rules
- relationships between pod clocks
- shared BPM/master timing implementation
- any abstractions/subpatchers used by the six pods
- buffers/sample storage
- original recording path
- external objects or embedded resources
- send/receive names tying otherwise separate patchers together

## Repair policy

Only objective, mechanically verifiable damage should be repaired automatically, for example:

- invalid JSON syntax
- patch cords that refer to provably missing box IDs
- broken local paths where the intended target is unambiguous
- duplicated IDs introduced by an export error
- missing project metadata that can be reconstructed without inventing musical logic

Do **not** fabricate missing DSP, randomisation, timing or pod logic merely to make a patch open without errors. If behavioural code is absent, mark it as missing and reconstruct it later from evidence.

All repaired files should use a separate path such as:

```text
patches/recovered/
```

and include a short provenance note specifying:

- source file
- date recovered
- exact change made
- why the change was considered safe
- whether behaviour changed

## Next recovery steps

1. Preserve the `.mxf` byte-for-byte and obtain a checksum before any extraction attempt.
2. Open/test each `.maxpat` in Max and record console errors, missing externals and unresolved abstractions.
3. Inventory every object, send/receive name, buffer name, subpatcher and external dependency in the metro and audio-options patches.
4. Audit the reconstructed six-pod patch separately so its modern additions are never mistaken for original Jungulator evidence.
5. Attempt controlled extraction/inspection of `iamthepcjungulator.mxf` in a compatible Max environment.
6. Compare any recovered patchers from the `.mxf` against the exported metro/audio-options material.
7. Build a behavioural map before modifying the DSP architecture for flöde~.

## Current conclusion

There is meaningful material to rescue. The metro and audio-options exports contain genuine-looking legacy Max logic, while the six-pod `notOriginal` patch is explicitly a non-lossless reconstruction and should be used cautiously. The binary `.mxf` is currently the strongest candidate for recovering additional original code, but it requires binary-aware inspection outside the current text-only GitHub interface.

No original source artifact has been modified during this analysis.
