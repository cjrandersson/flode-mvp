# Working on flöde~

Before changing code, Max patches, architecture or milestone state:

1. Read the **Development Status — Team Cockpit** at the top of `README.md`.
2. Read the active issue/checkpoint referenced by the cockpit.
3. For Alpha 0.1 implementation, treat the upstream `max-msp` branch as the implementation source of truth.
4. Work only on tasks explicitly assigned to **Codex** or explicitly handed off to Codex by ChatGPT / @cjrandersson.
5. If the cockpit shows `🚨 @cjrandersson`, `WAITING`, or a manual Max checkpoint, do not bypass it.
6. Do not widen scope beyond the current stage. Preserve locked product/UI decisions unless the owner approves a change.
7. After any meaningful implementation or checkpoint change, update the README cockpit so milestone state, next task, blockers and ownership remain accurate.

## Current Alpha guardrail

Stage progression is deliberately sequential:

`Stage 1 runtime/state → Stage 2 Apache playback → Stage 3 constrained JUNG → Stage 4 playable Alpha`

Do not start a later stage before the current stage exit criteria are satisfied and recorded.

For Stage 1, follow `docs/POD_V01_CONTRACT.md` on `max-msp` and Issue #5. Original Jungulator material is behavioural/forensic reference and must not be casually modified or "cleaned up".

## Roles

- **@cjrandersson** owns product direction, musical feel, UI approval and required manual Max listening/runtime checkpoints.
- **ChatGPT** translates product decisions into architecture, checkpoints and Codex-ready implementation tasks, and keeps documentation/cockpit synchronized.
- **Codex** implements the explicitly assigned technical slice and reports verifiable checkpoints rather than inventing new product scope.
