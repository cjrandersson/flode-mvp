# flöde~ Alpha 0.1 — Stage 1 skeleton

This project is the smallest runtime skeleton for Issue #5 Stage 1. It implements the structural boundary in `docs/POD_V01_CONTRACT.md`; it does not implement sample playback, JUNG behaviour, sequencing, transient analysis, modes, effects, or production UI.

## Open

1. Use Max 9.
2. Open `flode_alpha_01.maxproj`.
3. Open the top-level `flode_alpha_01.maxpat` patcher from the project window.
4. Open the Max Console to observe `flode.transport` and `flode.pod.A` diagnostics.
5. Set BPM if desired, then enable the start/stop toggle.

The top-level patch owns one global/internal Max transport and one tempo-relative `metro 16n`. Its ticks are sent to one `flode_pod_v01 #0 A` abstraction.

## Safety and scope

- POD A owns an instance-scoped empty `buffer~` named from `#1.pod.#2.buffer`.
- `groove~` is present only as a silent playback-path placeholder and receives a fixed zero rate.
- Gain and pan inputs are bounded and smoothed; defaults are gain `0.8`, pan `0.0`.
- An unloaded buffer produces silence.
- Only native Max/MSP objects are used.
- Enable audio using Max's toolbar if checking the silent output path.

## Current verification status

- Max project and patch JSON: verified parseable.
- Project patcher references, unique object IDs, and patch-cord endpoints: verified.
- Max 9.0.7 bounded launch: process started and the fresh Max.log contained no error or missing-object entry during the check.
- Interactive transport/tick behavior and audio-device output: not manually verified.
- Audible playback: intentionally absent.

## Next step

After Max 9 confirms that this unloaded skeleton opens without missing objects, record the result in Issue #5 and complete the remaining Stage 1 state/diagnostic work required by `docs/POD_V01_CONTRACT.md`. Do not begin Apache playback until Stage 1 is explicitly checkpointed.

