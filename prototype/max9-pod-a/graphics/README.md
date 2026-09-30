# Pod A graphics catalog

These SVGs are independently editable and use the same dark/amber/cyan layout as the Max prototype. Waveform previews show the empty state; the Max controller supplies real peaks after loading audio.

![Full Pod A preview](pod-a-preview.svg)

| Element | SVG | Max component |
| --- | --- | --- |
| Full layout | [pod-a-preview.svg](pod-a-preview.svg) | Seven instances combined |
| Header | [header.svg](header.svg) | `header` |
| Waveform and loop editor | [waveform.svg](waveform.svg) | `waveform` |
| Random / Jung slider | [jung-slider.svg](jung-slider.svg) | `jung` |
| Jitter slider | [jitter-slider.svg](jitter-slider.svg) | `jitter` |
| Slice stepper | [slice-stepper.svg](slice-stepper.svg) | `stepper slice` |
| Speed stepper | [speed-stepper.svg](speed-stepper.svg) | `stepper speed` |
| Mode buttons | [mode-buttons.svg](mode-buttons.svg) | `modes` |
| Loop handle | [loop-handle.svg](loop-handle.svg) | Drawn inside `waveform` |
| Mute / Solo | [mute-solo.svg](mute-solo.svg) | Drawn inside `header` |

M/S and loop handles are separate vector assets for reuse. Interactive loop handles stay inside the waveform canvas so pointer routing and loop bounds have one owner.

## Original repository picture references

The original pictures are retained in their existing locations. They were found by reference but could not be visually inspected through the current connection.

Original design image linked at the top of the repository README:

![Original repository design image](https://github.com/user-attachments/assets/3948386f-8366-4539-8d8c-84193204560c)

Existing Max 9 runtime screenshot:

![Existing Pod A Max screenshot](../../../docs/test-evidence/max9/stage1/stage1-max9-podA-apache-buffer-loaded.png)

Related sources:
- [Pod A approved UI contract](../../../design/POD_A_UI-R&D.md)
- [Existing mgraphics sketch](../../../design/v8ui_mgraphics_ui.js)
- [Browser concept prototype](../../showcase-v4/)
- [Design framework](../../../design/fl%C3%B6de-design-framework.md)

The new SVGs are a coded reconstruction from those written/source references, not extracted pixel layers from the PNG or attachment image. Review the pictures against the running Max preview before approving a final visual match.
