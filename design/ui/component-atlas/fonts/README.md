# UI fonts — CJ choice, 2026-10-01

- **Jersey 10 Regular:** labels and POD letters. [User-selected family](https://fonts.google.com/specimen/Jersey+10). Internal family name: `Jersey 10`.
- **IBM Plex Mono Regular:** numeric values and units. Internal family name: `IBM Plex Mono`.

Install [Jersey10-Regular.ttf](Jersey10-Regular.ttf) and [IBMPlexMono-Regular.ttf](IBMPlexMono-Regular.ttf) at OS level, then restart Max 9. Max `mgraphics.select_font_face` selects these installed family names; placing a font in a Max project's folder does not install it.

Browser previews load [fonts.css](fonts.css) locally and await both font faces before drawing. Export scripts embed the used faces in SVGs so sharing a standalone asset does not require a font server. Editable text is retained; some SVG editors may still need OS-installed fonts.

| File | Source | Git blob SHA |
| --- | --- | --- |
| Jersey10-Regular.ttf | [google/fonts](https://github.com/google/fonts/blob/main/ofl/jersey10/Jersey10-Regular.ttf) | `6870bfd222d1fa0c32a20c1d348320bb9a04b9ed` |
| IBMPlexMono-Regular.ttf | [google/fonts](https://github.com/google/fonts/blob/main/ofl/ibmplexmono/IBMPlexMono-Regular.ttf) | `0c9770d5183ba60dc4350d3e011b782a320761ae` |

Retrieved unmodified. Jersey 10 is credited by upstream metadata to Sarah Cadigan-Fried / The Soft Type Project Authors. Both fonts use SIL Open Font License 1.1. Original [Jersey licence](Jersey10-OFL.txt) and [IBM Plex licence](IBMPlexMono-OFL.txt) accompany redistribution.

This font pairing is the user's explicit choice. Rendering and legibility at actual Max/browser scale still require host review.
