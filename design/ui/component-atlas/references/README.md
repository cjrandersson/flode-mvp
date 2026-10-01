# Reference register

**Review date:** 2026-10-01. Nine original pictures supplied on `max-msp`. Eight were retrieved as base64 and visually inspected. The 2.2 MB all-POD PNG is present. Its visible upper portion was reviewed through CJ’s cropped GitHub browser screenshot; full-resolution image data could not be retrieved. The notes mark that review as partial. Originals are preserved.

[Read the image-by-image analysis](ANALYSIS.md). [Open the reusable element study](../../../../prototype/ui-reference-elements/). [Reference-to-component map](../../../../prototype/ui-reference-elements/SOURCE_MAP.md).

| Supplied original | Git blob | Visual status |
| --- | --- | --- |
| [FLÖDE_ALL_PODS_VIEW.png](FL%C3%96DE_ALL_PODS_VIEW.png) | `449b675df385` | Partial: cropped browser screenshot; original pixels not returned |
| [FLÖDE_MASTER_BPM_MASTER_FX_WINDOW.jpg](FL%C3%96DE_MASTER_BPM_MASTER_FX_WINDOW.jpg) | `7c2d0c9f6a65` | Inspected |
| [FLÖDE_SJÄLVSTÄNDIG_MASTER_BPM_WINDOW.jpg](FL%C3%96DE_SJ%C3%84LVST%C3%84NDIG_MASTER_BPM_WINDOW.jpg) | `cce47b61c8f5` | Inspected |
| [FORS-fm-ux-ui.png](FORS-fm-ux-ui.png) | `6606ace6eb44` | Inspected |
| [KNAPPAR_LOOP_MODES_COLOURS.jpg](KNAPPAR_LOOP_MODES_COLOURS.jpg) | `ea46c47ac5b9` | Inspected |
| [MULTICOLOR_WAVEFORM_DESIGN_MINIMALISM.jpg](MULTICOLOR_WAVEFORM_DESIGN_MINIMALISM.jpg) | `5140c60318f2` | Inspected |
| [SPACING_AESTHETIC.png](SPACING_AESTHETIC.png) | `7564f914715b` | Inspected |
| [TYPSNITT_SPACING_POD_A_DESIGN_SENSOR.jpg](TYPSNITT_SPACING_POD_A_DESIGN_SENSOR.jpg) | `e036b116b5bf` | Inspected |
| [ikoner_REC_PLAY_TEMPO_LOOP.jpg](ikoner_REC_PLAY_TEMPO_LOOP.jpg) | `b8b788e935da` | Inspected |

Filenames express the user's intended use; creator, product attribution and original licences have not been independently established. “FORS-labelled” below refers to the supplied filename, not verified authorship. Static pictures do not establish actual gesture behavior or animation.

The [earlier Max runtime screenshot](../../../../docs/test-evidence/max9/stage1/stage1-max9-podA-apache-buffer-loaded.png) and [README attachment](https://github.com/user-attachments/assets/3948386f-8366-4539-8d8c-84193204560c) remain separate runtime/design references; neither is used as evidence for the all-POD picture. Its separate partial review uses CJ’s chat screenshot of that exact GitHub file.

## Reference images to UI components

**Codex reading instruction:** Before working on flöde~ design or UI components, read this README in full, the linked [ANALYSIS.md](ANALYSIS.md), and the applicable approved task brief.

The images provide art direction: extract hierarchy, geometry, spacing, typography, and meaningful use of color. Adapt those principles to flöde~ and the intended UI size. Low-resolution images cannot establish exact pixel dimensions or font specifications. Static images show appearance; interaction and motion must be defined by the task brief.

The approved task brief takes precedence. For **UI LAB 001**, work only on the isolated POD A v8ui/mgraphics prototype. Master/FX work, additional controls, POD B–F design, and Alpha/DSP integration remain outside its scope.

### Layout and modular composition

- **`FLÖDE_ALL_PODS_VIEW.png`** — Overview of the six-POD composition. Study alignment, repeated module relationships, and shared hierarchy when an approved task concerns the overall interface. The current image review is partial, as recorded above.
- **`FLÖDE_MASTER_BPM_MASTER_FX_WINDOW.jpg`** — Reference for grouping, readability, and access to tempo and effects controls. Apply these principles only to an approved Master/FX task; the pictured controls and knobs are not an implementation checklist.
- **`FLÖDE_SJÄLVSTÄNDIG_MASTER_BPM_WINDOW.jpg`** — Reference for the functional and visual separation of individual PODs and independent master controls. Preserve that modular separation when relevant to the task.

### Aesthetics, spacing, and typography

- **`FORS-fm-ux-ui.png`** — Study restraint, instrument-like clarity, crisp geometry, thin lines, and economical use of labels and color. Aim for a purpose-built electronic instrument with dark matte surfaces. Avoid decorative hardware, fake rack details, and unnecessary shadows.
- **`SPACING_AESTHETIC.png`** — Reference for negative space, margins, grouping, and visual balance. Derive a consistent spacing rhythm and verify it at the intended UI size. This is the supplied filename for the reference previously described as `UI_SPACING_AESTHETIC.png`.
- **`TYPSNITT_SPACING_POD_A_DESIGN_SENSOR.jpg`** — Study technical typography, alignment, line weight, and contrast hierarchy. Its dense sensor layout provides selected visual principles; adapt them to the quieter, waveform-first POD A. POD A will establish reusable visual DNA for later PODs, without designing B–F during LAB 001.

### Signal graphics and interaction cues

- **`KNAPPAR_LOOP_MODES_COLOURS.jpg`** — Reference for compact control geometry and meaningful state colors. Define default, hover, active, and off appearances only for controls included in the approved task. These states are design proposals, not behavior verified from the still image.
- **`MULTICOLOR_WAVEFORM_DESIGN_MINIMALISM.jpg`** — Study clear multicolor curves, restrained contrast, and the relationship between graphics and subtle color fields. Translate those principles into a sharp waveform with color encoding signal, state, or action. For LAB 001, the waveform remains the dominant object; the image does not define audio-player behavior.
- **`ikoner_REC_PLAY_TEMPO_LOOP.jpg`** — Reference for economical symbols and distinct state/action cues. Use only when an approved task requires the corresponding controls; it does not authorize adding transport or tempo controls to POD A.

### Implementation principles

1. **Reusable primitives and tokens:** Keep colors, type sizes, spacing, and line weights in named, centralized values. Compose the approved UI from small reusable drawing primitives suitable for v8ui/mgraphics. Keep visual iteration simple.
2. **Instrument identity:** Use space, alignment, tone, and contrast to communicate hierarchy. Choose the smallest interaction primitive that clearly communicates each parameter. Simplify before adding borders or controls.
3. **Signal color:** Use off-black as the base and off-white for primary information. Reserve restrained cyan, orange, acid/yellow, and related muted accents for meaningful signal and state information.
4. **Interaction and motion:** Define gestures from the approved brief. For LAB 001, EQ point movement is vertical gain adjustment; use subtle active-state response and controlled curve interpolation. Motion communicates state.
5. **Scale and legibility:** Preserve deliberate relationships between elements when scaling. Check label readability, crisp lines, and usable hit areas at the intended UI size.
6. **Isolation:** Reference material does not expand implementation scope. Keep UI R&D separate from playable Alpha PODs, DSP, JUNG engine behavior, and master clock architecture.

For LAB 001, the required composition is waveform, playhead, active region, compact VOL/PAN/SPEED controls, a LOW/MID/HIGH three-point tone curve with a softly fading tinted field, and a single STABLE ↔ RESTLESS JUNG continuum. Waveform first.
