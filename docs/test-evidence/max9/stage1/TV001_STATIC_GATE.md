# TV001 — Part A static gate

Date: 2026-09-29. Starting upstream: `2aa596dafd5b0881740cfadc32969197892a4a35`.
**VERIFIED FROM REPOSITORY: static gate PASS before Part B implementation.**
**UNVERIFIED IN MAX RUNTIME.** This is not a runtime Stage 1 sign-off.

IDs refer to `patches/flode_alpha_01/patchers/flode_pod_v01.maxpat` unless noted.

| Gate item | Repository evidence |
| --- | --- |
| Scoped authoritative state | `state`: `dict #1.pod.#2.state @embed 0`; `defaults`; `state_write` writes then reads; `state_values` derives controls |
| API validation | `controls/api_version_check` and `event/check_1`: integer 1 only |
| Validated inputs | `controls` scalar validators; `event` eleven-field validation with direction and monotonic received-ID checks |
| Derived availability | `load_order` revokes availability; `physical_load` clears old buffer; buffer completion → reset metadata → `info` → `available` → `loaded_order`; no writable loaded selector |
| Gateable diagnostics | `state_values` → `diag_gate`; `debug_status` → Alpha `pod_diag_route` → `transport_diag_gate`; errors bypass routine gate |
| Fail-silent events | Rejection-only event outlet → `error_order` → `stop_request` → `safety`; finalized action stops groove and sets rate zero |
| De-click/safety boundary | `safety/amp` (`line~ 0.`), `release` (`0. 10`), completion/cancellation routing; `amp_left`/`amp_right` precede existing gain/pan |
| Canonical project only | Nested descriptor removed; root descriptor's two patcher references resolve |
| No excluded engine work | Original master-clock topology; one A instance; no added JUNG, RNG, sequencer, UI, aggregation, private transport, effects or recording |

UI R&D path is labelled target/planned. The rate source has only a zero writer;
the safety subpatch has no attack route. Part A cannot enable Apache playback.

Reproduce: `python scripts/verify_tv001.py --part A`.
Result: PASS, 34 predicate-model cases plus selected static graph/contract checks.
`git diff --check`: PASS. Project and all nested patches parse as JSON.

These checks do not execute Max objects, dispatch, scheduling or MSP. CJ must
verify those in Max 9. Prior PR descriptions are not implementation evidence.
Part A must be committed, pushed and confirmed upstream before Part B edits.
The Part B record will identify that Part A commit separately.
