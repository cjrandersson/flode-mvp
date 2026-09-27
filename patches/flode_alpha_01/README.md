# flöde~ Alpha 0.1 — Stage 1 skeleton

**Status: PARTIAL.** The four project files exist; Stage 1 has not passed its
runtime or full state-contract exit criteria. The locked contract is
[docs/POD_V01_CONTRACT.md](../../docs/POD_V01_CONTRACT.md). Continue only on
`max-msp`.

This is an unloaded developer harness. Sample loading/playback, Apache Break,
JUNG behaviour, sequencing, transient analysis, effects, and production UI are
not implemented here.

## Repository checkpoint

On 2026-09-24, the live branch was verified at
`328ae3386d577ae1187af7be27ab16a700d2f2ee`, whose direct parent is the older
handoff `e2a10fee1103c2ed5ac099f4832f1cb8479b52b3`. That newer commit already
created all four requested files. They must not be recreated from the older
checkpoint.

The follow-up correction adds `prepend tick` between the top-level integer
trigger and the POD inlet. Previously the POD received a bare integer, while
its `route tick gain pan` expected a selector. The integer therefore reached
the unconnected unmatched outlet. Both diagnostic paths now receive
`tick <index>`. This corrects message routing only; it does not establish
that Max's scheduler or audio device has been tested.

## Open in Max 9

1. Keep the project folder and its `patchers/` folder together.
2. Open `flode_alpha_01.maxproj`.
3. Open the top-level `flode_alpha_01.maxpat` from the project window.
4. Open the Max Console; look for `flode.transport` and `flode.pod.A`.
5. Leave the buffer unloaded. Enable the start/stop toggle to inspect ticks.
6. If checking the silent DSP path, enable audio from Max's toolbar.

The top-level patch owns one internal `transport`, default BPM 92, and one
`metro 16n @transport internal @quantize 16n`. The POD instance is
`flode_pod_v01 #0 A`. The diagnostic counter cycles 0–15; it is a step index,
not the future JUNG event ID.

## Present structure and safety boundary

- The POD buffer uses the instance/POD name `#1.pod.#2.buffer`.
- `groove~` has a fixed zero rate, with no sample-load or event-execution input.
- Gain is clamped to 0–1 and pan to -1–1, with 10 ms coefficient smoothing.
  Their defaults are 0.8 and 0.0.
- The stereo signal path is present. Its unloaded output is expected to be
  silent; this still needs the manual DSP check below.
- Only native Max/MSP objects and the included POD abstraction are referenced.
- The current inlet handles `tick`, `gain`, and `pan`. Other messages are
  ignored. This is not the versioned JUNG event validator.
- The internal Max transport is shared globally. Test one harness at a time
  for the transport checks. POD resource isolation is a separate check.

## Verification evidence

| Check | Result |
| --- | --- |
| Project and both patchers parse as JSON | PASS, static check on 2026-09-24 |
| Project references, unique object IDs, patch-cord endpoints | PASS, static check |
| Tick message path before the correction | FAIL: raw integers never match the POD's `tick` selector |
| Tick message path after the correction | PASS in a limited message-flow simulation; both print paths receive matching ticks, including the 15-to-0 wrap |
| Max 9.0.7 bounded launch at the earlier commit | Reported in [Issue #5](https://github.com/cjrandersson/flode-mvp/issues/5#issuecomment-5768677369): process started and no error/missing-object log entry was seen during that window |
| Interactive Max 9 test of this correction | NOT RUN |
| Audio-device/DSP test | NOT RUN |

The 2026-09-24 verification host is Linux and has no available Max runtime.
The earlier launch report applies to the earlier commit; it is not evidence
that this correction, interactive tick routing, or DSP has run successfully.

## Manual Max 9 checks still required

Record the tested commit, Max version, operating system, sample rate/vector
size, and actual console output in Issue #5.

| Check | Action | Expected result |
| --- | --- | --- |
| Open | Open the project and top patch; inspect Console and object boxes | Both patchers resolve; no red/missing objects or creation/connection errors |
| Idle | Leave transport off and buffer unloaded | No repeating tick diagnostics |
| Clock/POD agreement | Start at 92 BPM and watch at least two 0–15 cycles | One `flode.transport: tick n` and one `flode.pod.A: tick n` for each pulse; matching indices, including 15 → 0 |
| Tempo response | Change BPM from 92 to 120, then 60 | Both paths change together; 16th notes average 125 ms at 120 BPM and 250 ms at 60 BPM |
| Stop/restart | Stop, wait, and restart repeatedly | Repeating ticks stop and resume without accumulating duplicate streams; record the observed resume index |
| Empty DSP | Turn audio on, start/stop transport, then turn audio off | Silence on both output channels; no DSP errors |
| Gain/pan bounds | In the POD patch, send `gain -1.`, `gain 2.`, `pan -2.`, and `pan 2.`; inspect the existing clips/coefficient path | Gain remains 0–1, pan -1–1, output stays silent; restore `gain 0.8` and `pan 0.` |
| Resource isolation | Open a second top-level instance and inspect the two POD buffer names with transports stopped | Different top-level scopes; no shared POD buffer. Close the extra instance before repeating clock tests |

These are expected results, not recorded passes. Any temporary inspection
objects used in Max are local diagnostics and should not be saved into this
checkpoint.

## Remaining Stage 1 implementation work

After the manual skeleton checkpoint required by the latest Issue #5 comment:

- Implement one authoritative owner for the minimal POD state from the
  contract. The current `state A empty_safe` message is only a startup label,
  not the required state model.
- Initialize and expose the contract's API version, sample reference/loaded
  state, base rate, JUNG-enable value, seed `42691`, slice count, and debug
  enable alongside gain/pan. Unsupported API versions must be rejected.
- Make actual state changes observable and diagnostics disableable. At present
  only the startup label and routed ticks are logged.
- Provide/verify the locked event-envelope and safe region/execution boundary
  before any later playback is enabled. Gain/pan smoothing is not an event
  de-click envelope.
- Record the resulting Max-side console/runtime evidence in Issue #5 before
  declaring Stage 1 complete.

No full JUNG event validation, deterministic RNG, audible de-click behaviour,
state persistence, Max for Live integration, or compatibility below Max 9 has
been verified. Do not begin Apache playback or JUNG implementation while
Stage 1 remains partial. Preserved Jungulator files and `dev`/`main` are
outside this change.
