# flöde~ Alpha 0.1 — TV001 / First Audible POD

**Stage 1 static gate: PASS. UNVERIFIED IN MAX RUNTIME.**
Part B is now implemented in repository files. Neither Stage 1 nor M1.1 is
runtime-complete. Part A was published and fetched back at
`821e4f7464591a9de9260dead1b6c3f96561691a` before any Part B edits.
Branch: `max-msp`. Open `flode_alpha_01.maxproj` in this folder with its
`patchers/` and `media/` folders beside it. The duplicate nested project is gone.

## 2026-09-30 opening-error correction

CJ reported `symbol: symbol: No such object` and
`expr~: expr~: No such object` during project opening. The earlier static
check missed these unsupported object names. Three path registers now use
native `zl reg`; the natural-end taper uses native MSP arithmetic inside
`p end_taper_native`. Its formula and external connections are unchanged.
Native object references: [zl](https://docs.cycling74.com/reference/zl/),
[maximum~](https://docs.cycling74.com/reference/maximum~/),
[clip~](https://docs.cycling74.com/reference/clip~/).

**Fix UNVERIFIED IN MAX RUNTIME.** Close the previous project and reopen a
fresh corrected download with DSP off. Check Max Console for object-creation
errors before resuming the unloaded tick/DSP test and then the playback tests.

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
| `load_apache` | Resolve the fixed `Project:/media/Apache Break ( Driven Silk Red ).wav` path and load without browsing |
| `play` / `retrigger` | With valid sample and DSP on, release current voice, recheck buffer, start at 0 ms at validated base rate |
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
loading with DSP off does not wait for an audio ramp. Playback requires DSP
on. New play/retrigger requests release first, then refresh actual metadata,
set full-sample bounds and the validated rate, seek to 0 ms, and attack over
10 ms. A signal-based end taper attenuates the last 10 ms at normal rate.
`groove~` remains non-looping. Its initial `sig~ 0.` is now controlled by stop
and validated playback; it is not a permanently zero rate source.

The eleven-field event validator checks API/POD, typed IDs, monotonic received
IDs, decision names, integer slice clamping, finite nonzero rate, offset
−12…12 ms, repeat 1…3, boolean reverse, rate/reverse relationship and integer
seed state. Validated events still return `unsupported_event_no_execution`.
There is no slice, repeat, reverse, offset, pattern or scheduling execution.
Rejected raw events remain visible for diagnosis.

## Static verification and Max status

From repository root: `python scripts/verify_tv001.py --part B`.
The historical Part A commit passes `--part A`; that mode intentionally rejects
the later enabled playback path.
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

## Exact CJ Max 9 test

Use Max 9.0.7 (the existing patch target). Keep the project folder named
`flode_alpha_01`. Open the root project and its top-level patch. Use the
visible **developer message boxes**, not a production UI.

1. Enable DSP with transport off and no sample loaded. Expect silence.
2. Click `getstate`: expect `sample_loaded 0`, empty path, rate 1, gain 0.8,
   pan 0, API 1, seed 42691, slice count 16, JUNG 0 and debug 1.
3. Click `load_apache`, then `getstate` after loading finishes. Expect loaded
   1 and the actual Apache path. The file header is stereo/44.1 kHz with
   366863 frames (about 8318.889 ms). Loading itself must stay silent.
4. Enable the existing Start toggle. Expect shared ticks and one forward
   Apache playback at normal rate. It ends once; it does not loop or stretch
   to the BPM. Changing BPM changes ticks, not sample pitch or duration.
5. Stop while sounding. Expect a short release, then silence. Start again.
6. Click `retrigger` while sounding; it should restart from the beginning
   after release. Try rapid retrigger → stop; the final stop must win.
7. Click `play` and allow natural EOF. Check the tail and both stereo outputs.
8. For the remaining input tests, create a temporary message box wired to the
   POD abstraction's left inlet in the top patch. Do not save test edits.
   Send `gain -1.`, `gain 2.`, `pan -2.`, `pan 2.` and inspect `getstate`:
   gain should clamp to 0/1, pan to −1/1. Restore `gain 0.8`, `pan 0.`.
9. During playback send each of: `api_version 2`, `gain banana`, `gain 0.2 0.8`,
   `base_rate 0.`, `sample_loaded 1`, `jung_enabled 1`. Each must stop safely,
   report rejection, and avoid writing the invalid value. A new valid `play`
   can restart; restore `api_version 1` and `base_rate 1.` for clarity.
10. Send `event 1 1 A 0 hold 0 1. 0. 1 0 42691`. Even this well-formed event
    must stop and report unsupported execution. Also test a truncated event,
    wrong API/POD, rate 0, offset 13, repeat 4 and reverse 2. None may sound.
11. Click `debug_enabled 0`. Routine POD/transport tick and state output must
    stop without changing audio or clock speed; errors remain visible.
    Click `debug_enabled 1` to restore routine diagnostics.
12. During playback send `sample_path "Project:/media/TV001_missing.wav"`.
    Expect silence, loaded 0, empty state path and a file error. `play` must
    fail silent. Recover using `load_apache`, then explicitly `play`.
13. Turn DSP off during a retrigger, then on. Expect no automatic playback.
    Explicitly play again. With transports stopped, optional two-parent-POD
    inspection should show different scoped state/buffer names. The shared
    standalone transport is intentionally not isolated between harnesses.

**Every expected result above is UNVERIFIED IN MAX RUNTIME.** Record tested
commit, Max/OS versions, sample rate/vector size, console errors and pass/fail
for each step. Save evidence under `docs/test-evidence/max9/stage2/`.
See [Part B evidence and limitations](../../docs/test-evidence/max9/stage2/TV001_M11.md).
