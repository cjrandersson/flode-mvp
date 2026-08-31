# flöde~ Build 03B.1 — Single DAC

The previous test used two `ezdac~` objects. In Max, `ezdac~` is a front end for the **global DSP state**, so all `ezdac~` instances switch together. That behavior is expected.

## Fix
This version has:
- ONE `ezdac~`
- a DIRECT/PAN test-mode toggle before the DAC
- `0 = verified direct path`
- `1 = pan path`

## Test
1. Drop WAV/AIFF.
2. Click the single `ezdac~`.
3. Leave TEST MODE at `0`: audio should behave like verified Build 02B.
4. Set TEST MODE to `1`: audio now goes through the PAN stage.
5. Try PAN `-1`, `0`, `+1`.

If both modes pass, PAN is verified and we can continue to waveform/start/end binding.
