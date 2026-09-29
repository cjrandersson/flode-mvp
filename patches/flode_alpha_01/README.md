# flöde~ Alpha 0.1 — TV001 Part A

**Stage 1 static gate: PASS. UNVERIFIED IN MAX RUNTIME.**
Part B / First Audible playback has not started at this checkpoint.
Branch: `max-msp`. Open `flode_alpha_01.maxproj` in this folder with its
`patchers/` and `media/` folders beside it. The duplicate nested project is gone.

## Repository truth

Starting upstream: `2aa596dafd5b0881740cfadc32969197892a4a35`. PR #7's earlier
state/safety completion report was not reflected in those upstream files.
The original master transport, 16n metro, diagnostic `counter 0 15`, POD tick
path, scoped buffer declaration, gain/pan bounds and stereo routing remain.

## State and controls

`dict #1.pod.#2.state @embed 0` is the authoritative POD state owner.
Defaults initialize on opening; no preset/disk persistence feature is implied.
Scalar validators check arity/type before predicates. DSP/debug values derive
from the dictionary. Other registers are transient execution/metadata caches.

Send messages to the POD's existing left inlet with temporary Max message boxes.
No production UI is added.

| Message | Meaning |
| --- | --- |
| `api_version 1` | Only supported integer version |
| `gain 0.8` / `pan 0.` | Finite numeric scalar, clamped to 0–1 / −1–1 |
| `base_rate 1.` | Finite positive scalar; stop before changing state |
| `jung_enabled 0` | Only supported value; no JUNG execution |
| `seed 42691` | Integer state only; no RNG |
| `slice_count 16` | Positive integer state only; no slicing |
| `debug_enabled 0` / `debug_enabled 1` | Gate routine POD and harness diagnostics |
| `getstate` | Print state; enable debug first |
| `sample_path "absolute/path/to/file.wav"` | One-symbol load request; actual loaded path is derived from buffer metadata |
| `stop` | Cancel pending transition and release to silence |

`sample_loaded` and `pod_id` are read-only. Unsupported selectors, malformed
controls and all events reach the fail-silent boundary. Errors remain visible
with debug off. A successful base-rate change stops playback; it is not a live
rate-modulation system.

## Loading and safety

A load request revokes availability, releases the amplitude boundary, stops
`groove~`, then executes a low-priority buffer replacement. `sizeinsamps 0`
removes stale data before replacement. The original buffer declaration is
unchanged; file loading determines channel allocation. The completion bang
triggers reset metadata → fresh `info~` query → validity check. Only positive
finite duration/sample rate and one or two channels produce `sample_loaded 1`.
`sample_path` is written from `info~`'s full-path outlet. Failed loading leaves
unloaded, silent state and may produce Max's native file error.

`p playback_safety` supplies a separate `line~ 0.` envelope to both channels,
before the original gain/pan path. Release uses 10 ms, following the existing
convention. A new request cancels the previous ramp; envelope completion precedes safe
playback/buffer changes. DSP-off cancels pending work and forces silence;
loading with DSP off does not wait for an audio ramp. Part A contains no
attack or nonzero rate path.

The eleven-field event validator checks API/POD, typed IDs, monotonic received
IDs, decision names, integer slice clamping, finite nonzero rate, offset
−12…12 ms, repeat 1…3, boolean reverse, rate/reverse relationship and integer
seed state. Validated events still return `unsupported_event_no_execution`.
There is no slice, repeat, reverse, offset, pattern or scheduling execution.
Rejected raw events remain visible for diagnosis.

## Static verification and Max status

From repository root: `python scripts/verify_tv001.py --part A`.
It checks recursive JSON/cord/subpatch integrity, project references,
state/load/debug/safety wiring, preserved clock topology and excluded objects.
The 34 predicate-model cases use Python numeric semantics, not Max dispatch.
See [gate evidence](../../docs/test-evidence/max9/stage1/TV001_STATIC_GATE.md).

CJ's earlier open/clock/manual-load smoke test is recorded in
[Issue #5](https://github.com/cjrandersson/flode-mvp/issues/5#issuecomment-5859685590).
It applies to the earlier skeleton, not the new implementation.

**UNVERIFIED IN MAX RUNTIME:** object creation, dictionary initialization,
message dispatch, load callbacks/failure recovery, DSP-off transitions, envelope
completion, debug gating, audio, bounds and resource isolation. This host has
no Max 9 executable. No audible or click-free claim is made.

Part A manual check: open the canonical project, enable DSP while unloaded,
verify silence, send the documented controls, inspect state, toggle debug,
try malformed controls/events, and verify loading cannot enable audio. Test
resource isolation with two parent instances and transports stopped only.
The globally shared standalone transport remains an accepted limitation.
