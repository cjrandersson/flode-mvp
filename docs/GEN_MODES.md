# Generative Modes

| Mode | Behaviour | Musical character |
|---|---|---|
| PURE | Independent uniform random values. No weighting or history. | Abrupt, raw, glitch-friendly. |
| JUNG | Free random motion with repeats, pauses and occasional extreme impulses. | The original “lives its own life” Jungulator character. |
| WEIGHTED | Random values cluster around useful regions and recurring weighted targets. | More stable and musical without becoming a sequence. |
| WALK | The next state is derived from the current state in small bounded steps. | Organic drift and slow mutation. |
| MEMORY | Stores a rolling bank of prior states and periodically reuses them. | Semi-recognisable motifs and self-made loops. |
| CHAOS | Nonlinear feedback derives the next state from the previous one. | Energetic, unstable, deterministic-chaotic motion. |

## Macro controls
- **Random / Jung**: depth of generative influence. 0 = stable base behaviour; 1 = full mode influence.
- **Jitter**: small per-event deviation layered on top of the selected mode.

In MVP v1, modes directly drive playback-speed variation and expose position/velocity intent outputs in the JS engine for the upcoming slice-trigger layer.
