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

# Reference images to UI components

> **Codex reading instruction:** Before working on flöde~ design or UI components, read this README.md in full, then read the linked ANALYSIS.md and applicable task brief. Interpret the images within the current approved task scope. For UI LAB 001, the POD A waveform-first brief takes precedence: references provide art direction and do not authorize Master/FX work, additional controls, POD B–F design, or Alpha/DSP integration.
>
> **Filename mapping:** `UI_SPACING_AESTHETIC.png` below refers to the supplied file `SPACING_AESTHETIC.png` listed in the reference register.

Here is the English version of the `README.md` for your design and UI folder:

This folder gathers visual inspiration, reference images, and UI components for the instrument **flöde~**.

The purpose of this document is to instruct **Codex** and the development team on exactly how these images should be interpreted, broken down design-wise, and implemented in code to ensure a cohesive, professional, and hardware-inspired user experience.

## 📂 Image Overview & Implementation Instructions

### 1. Layouts & Windows

- **`FLÖDE_ALL_PODS_VIEW.png`**
    - *Description:* Complete overview showing how all parts interact when all 6 PODS are visible in the interface.
    - *Codex Instruction:* Use this as the main reference for the overall layout structure, grid system, and window composition when all modules are active simultaneously.
- **`FLÖDE_MASTER_BPM_MASTER_FX_WINDOW.jpg`**
    - *Description:* Detailed view for the Master BPM and Master FX window.
    - *Codex Instruction:* Implement the controls, knobs, and layout for effects and tempo precision exactly according to this panel. Focus on clear readability and fast access.
- **`FLÖDE_SJÄLVSTÄNDIG_MASTER_BPM_WINDOW.jpg`**
    - *Description:* Our initial design concept for flöde~ featuring the 6 PODS in combination with a separate/independent Master BPM window.
    - *Codex Instruction:* Refer to this concept to understand how the modular division between master controls and individual pods is intended to be separated functionally and visually.

### 2. Aesthetics, Spacing & Typography

- **`FORS-fm-ux-ui.png`**
    - *Description:* Overall UI/UX reference for the instrument's digital hardware feel.
    - *Codex Instruction:* Use this image as a style guide for the overall aesthetic (color palette, shadows, contrast, and controls).
- **`UI_SPACING_AESTHETIC.png`**
    - *Description:* Detailed guidelines for whitespace, margins, and visual balance in the interface.
    - *Codex Instruction:* Follow the exact proportions and spacing (padding/margin) shown here to avoid a cluttered look. A minimalist yet functional layout is key.
- **`TYPSNITT_SPACING_POD_A_DESIGN_SENSOR.jpg`**
    - *Description:* Typography, element spacing, and the base design of **POD A**, which sets the design standard for the rest of the pods.
    - *Codex Instruction:* Extract font styles, text sizes, weights, and component placement from here. POD A acts as the "master template" for all other pods (B through F).

### 3. Components & Interaction

- **`KNAPPAR_LOOP_MODES_COLOURS.jpg`**
    - *Description:* Specific design for buttons (e.g., loop on/off) and corresponding color coding for various states.
    - *Codex Instruction:* Implement button components with states for *Default*, *Hover*, *Active/On*, and *Off*, and follow the specified color scheme for lights/indicators.
- **`MULTICOLOR_WAVEFORM_DESIGN_MINIMALISM.jpg`**
    - *Description:* Design concept for a minimalist and multi-colored waveform (multicolor waveform) for our audio player.
    - *Codex Instruction:* Code the audio player waveform using this multi-colored aesthetic. The waveform should be sharp, clean, and follow minimalist design principles without compromising visual feedback.

## 🛠️ General Guidelines for Codex When Generating Code

1. **Design System & Tokens:** Build reusable components based on the patterns in `TYPSNITT_SPACING_POD_A_DESIGN_SENSOR.jpg` and `KNAPPAR_LOOP_MODES_COLOURS.jpg`. Do not hardcode values that should be design tokens (e.g., colors, font sizes, standard spacing).
2. **Modular Architecture:** Respect the separation between PODS and the Master window (as shown in `FLÖDE_SJÄLVSTÄNDIG_MASTER_BPM_WINDOW.jpg`).
3. **Responsiveness & Scalability:** The interface for flöde~ should feel like a fixed, physical hardware unit (instrument), meaning the mutual relationships and spacing of elements must be maintained even during scaling.
