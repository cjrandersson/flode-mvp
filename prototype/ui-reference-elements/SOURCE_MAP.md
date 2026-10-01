# Reference → reusable UI map

**Prototype deliverable:** JavaScript geometry shared by Max 9 `v8ui`/mgraphics, p5.js and editable SVG. User-selected typography: **Jersey 10 labels/POD letters; IBM Plex Mono numbers**.

The [original-reference folder](../../design/ui/component-atlas/references/) is the source register. Eight original images were inspected directly; the all-POD console was reviewed only through CJ's cropped GitHub browser screenshot. Its unshown lower content and original pixels remain uninspected. The notes distinguish observed structure from proposed interaction.

## Use the right prototype

[UI LAB 001](../ui-lab-001/) is the standalone POD A study: real audio-cache waveform, loop editing, VOL/PAN/SPEED, one JUNG temperament control and quiet three-band EQ. Its Max and browser hosts use the same source renderer/controller.

[Reference elements](README.md) supplies additional reusable symbols, compact knob, readout, meter and JUNG glyph. Range in that library is a read-only diagram; use the lab for audio-backed waveform interaction.

## Implemented families

| Element | Source principles | Ready-to-use artifact | Max instance |
| --- | --- | --- | --- |
| POD address/sample header | POD A reference; repeated A–F addresses visible in the console screenshot; technical typography hierarchy | [pod.svg](graphics/pod.svg), [A–F static identity sheet](graphics/pod-identities.svg) | `v8ui flode_reference_ui.js @arguments A pod header` |
| Waveform and loop selection | POD A endpoint triangles, distinct playhead, attached readouts; subtle plot emphasis | [POD A waveform](../ui-lab-001/graphics/waveform.svg), [range construction](graphics/range.svg) | `v8ui flode_ui_lab_component.js @arguments A waveform` in the lab project |
| Relative fader | Sparse technical controls and stable/restless musical surface | [fader.svg](graphics/fader.svg) | `v8ui flode_reference_ui.js @arguments A fader jung` |
| Compact knob | Detached value from master/POD A references; reduced modular geometry | [knob.svg](graphics/knob.svg) | `v8ui flode_reference_ui.js @arguments A knob pan` |
| Numeric readout | Large master tempo value; aligned sensor fields | [readout.svg](graphics/readout.svg) | `v8ui flode_reference_ui.js @arguments A readout speed` |
| Stereo meter | Segmented master meters and explicit source status | [meter.svg](graphics/meter.svg) | `v8ui flode_reference_ui.js @arguments A meter meter` |
| JUNG state glyph | Sparse modular geometry plus approved bounded intervention/return invariant | [Five states](graphics/README.md) | `v8ui flode_reference_ui.js @arguments A glyph glyph` |
| Named symbols | Record circle, play triangle, loop direction and labelled tempo from icon/master references | [Six separate symbols](graphics/README.md) | `v8ui flode_reference_ui.js @arguments A icon loop` |

The A–F SVG sheet is a **static identity study**. The interactive gallery remains POD A; no additional POD runtime, DSP or engine behavior is introduced.

## Every supplied picture

| Original | Review basis | What enters the prototype |
| --- | --- | --- |
| FLÖDE_ALL_PODS_VIEW.png | Partial cropped browser screenshot only | Repeated address rhythm and one visually separate master area; static A–F identity sheet |
| FLÖDE_MASTER_BPM_MASTER_FX_WINDOW.jpg | Full supplied image inspected | Detached knob values, hierarchy of numeric values, named symbols, segmented meters |
| FLÖDE_SJÄLVSTÄNDIG_MASTER_BPM_WINDOW.jpg | Full supplied image inspected; it depicts POD A | Waveform-first hierarchy, endpoint triangles, pale playhead, attached loop data |
| FORS-fm-ux-ui.png | Full supplied image inspected | Sparse geometric marks, negative space and bounded glyph construction |
| KNAPPAR_LOOP_MODES_COLOURS.jpg | Full supplied image inspected; it depicts a palette tool | Compact targets and restrained exceptional active colour |
| MULTICOLOR_WAVEFORM_DESIGN_MINIMALISM.jpg | Full supplied image inspected; it depicts data plots | Thin construction, low-opacity selection area and semantic accent separation |
| SPACING_AESTHETIC.png | Full supplied image inspected | Repeatable spacing, aligned landmarks and small consistent symbols |
| TYPSNITT_SPACING_POD_A_DESIGN_SENSOR.jpg | Full supplied image inspected | Clear primary/secondary type hierarchy and aligned readouts |
| ikoner_REC_PLAY_TEMPO_LOOP.jpg | Full supplied image inspected | Named simple silhouettes and record-state colour |

[Detailed image-by-image notes](../../design/ui/component-atlas/references/ANALYSIS.md) record omitted features and uncertainty. The font pairing is CJ's explicit choice; it is not an inferred identification of the fonts in these pictures.

## JavaScript, p5.js, Max and SVG

```js
const ui = FlodeReferenceUI; // browser global; also CommonJS-exported
const geometry = ui.scene("knob", {
  id: "pan", width: 140, height: 124, value: 0.5, display: "C"
});
ui.renderP5(geometry, p);
ui.renderMgraphics(geometry, mgraphics);
const svg = ui.toSvg(geometry);
```

Use one renderer appropriate to the current host. [Source](code/flode_reference_ui.js) owns the command geometry and continuous-control gestures. Values remain controller-owned; silent setters and normalized requests separate state from input. Glyph phase, level and playhead data are supplied externally.

Max requires installing the [bundled fonts](../../design/ui/component-atlas/fonts/) and restarting it. The browser loads local TTFs before drawing. Committed SVGs embed the used font faces and retain editable text.

## Verification and remaining review

The implementation's thirteen element checks and ten lab checks passed with host calls recorded. This completion pass adds seven static identity assets and checks their letters, bounds, SVG identifiers, embedded font and reproducibility through the committed exporter.

Actual Max/browser rendering and pointer/audio-load behavior still require local host review. Full-resolution analysis of the all-POD image remains open. Those limits do not prevent reviewing or reusing the delivered prototype elements; no production compatibility or Alpha milestone is asserted.
