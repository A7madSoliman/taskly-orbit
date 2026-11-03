# D10 — Design foundation

**D10 DONE — D10-v1 owner acceptance recorded on 2026-11-02 after final bounded validation PASS.** The owner's conditional authorization is satisfied: reviewed B03 typography, spacing, radius, borders and elevation join the previously accepted B01/B02 Light/Dark color baseline. Concept C — Balanced Hybrid remains selected under D09-v1. This accepts reusable foundations only; no D11 library, final screen implementation, accessibility certification or frontend approval is implied. D11–D23 remain TODO.

## Verified Figma references

One new page in the existing file: [100:2 — Design Foundation / B01 Candidates](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=100-2).

| Study | Verified node |
|---|---|
| Light role/palette, status and control foundation | [101:2](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=101-2) |
| Dark proposal: same foundation inventory | [101:267](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=101-267) |
| Spacing, radius, elevation and borders | [101:532](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=101-532) |
| Inter/Cairo scale, wrapping and mixed content | [102:2](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=102-2) |
| Light / Dark desktop Tasks | [103:17](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=103-17) / [103:149](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=103-149) |
| Light / Dark Arabic RTL Tasks | [103:285](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=103-285) / [103:314](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=103-314) |

Light retains C's light sidebar (#FAFCFB), original vector icons, neutral canvas, teal primary and moderate geometry. Dark proposes navy navigation (#0B1725), a darker canvas, layered cards and lighter adapted teal; it is not an inversion or a C-Navy Light variant. Originals 87:66/87:206/87:240 and cross-surface study 92:351 remain unchanged.

## Candidate semantic map

The following B01 values are now the owner-approved D10-v1 color baseline. B02 created native local variables using these exact values and names. Repeated raw values share primitive aliases. Original B01 specimens remain unchanged; only the new verification board uses bindings. No published library or screen-wide migration was performed.

| color/ role | Light raw alias and candidate | Dark raw alias and candidate |
|---|---|---|
| background | raw/neutral/025 · #F3F5F3 | raw/night/975 · #0D151D |
| surface | raw/neutral/000 · #FFFFFF | raw/night/900 · #15232D |
| surface-raised | raw/neutral/000 · #FFFFFF | raw/night/850 · #1D303B |
| foreground | raw/ink/900 · #20343A | raw/neutral/050 · #E6EFEA |
| foreground-muted | raw/gray-green/600 · #60736E | raw/gray-green/300 · #B2C4BC |
| border | raw/gray-green/200 · #D3DFD7 | raw/slate/700 · #324A55 |
| border-strong | raw/gray-green/500 · #71857B | raw/slate/400 · #6F8C91 |
| primary | raw/teal/700 · #2E6A60 | raw/teal/300 · #8BC7B4 |
| primary-foreground | raw/neutral/000 · #FFFFFF | raw/forest/950 · #10281F |
| focus | raw/teal/700 · #2E6A60 | raw/mint/200 · #AFE6D0 |
| navigation | raw/neutral/010 · #FAFCFB | raw/navy/975 · #0B1725 |
| navigation-foreground | raw/ink/900 · #20343A | raw/gray-green/150 · #D3E2DC |
| navigation-active | raw/teal/050 · #DFECE7 | raw/teal-slate/850 · #243E43 |
| navigation-active-foreground | raw/teal/800 · #285F57 | raw/mint/200 · #AFE6D0 |
| secondary | raw/neutral/015 · #F6FAF8 | raw/night/850 · #1D303B |
| primary-hover | raw/teal/850 · #25584F | raw/teal/200 · #A3D8C5 |
| primary-pressed | raw/teal/900 · #1E4942 | raw/teal/400 · #78B29E |
| disabled-surface | raw/gray-green/100 · #E3E8E4 | raw/slate/800 · #273A43 |
| disabled-foreground | raw/gray-green/650 · #566B60 | raw/gray-green/400 · #92A79D |
| success | raw/green/800 · #365E3A | raw/green/200 · #ABE0B8 |
| success-surface | raw/green/050 · #E3EFE4 | raw/forest/900 · #1B392B |
| warning | raw/ochre/800 · #735E2A | raw/ochre/200 · #EAD28D |
| warning-surface | raw/ochre/050 · #F5EEDC | raw/ochre/950 · #3B321F |
| error | raw/rust/800 · #853D31 | raw/rust/200 · #F2B6AB |
| error-surface | raw/rust/050 · #F6E6E2 | raw/rust/950 · #432A2A |
| info | raw/blue-teal/800 · #345E68 | raw/blue-teal/200 · #A4D5DE |
| info-surface | raw/blue-teal/050 · #E4EFF0 | raw/blue-teal/950 · #1A3740 |

Additional roles are justified by distinct navigation, essential control boundaries, interaction states and semantic surfaces. border is decorative; border-strong identifies controls. success/warning/error/info are foreground/icon colors on their corresponding -surface role. Disabled specimens describe appearance only, not permission rules.

Status namespaces are proposed as `status/<ENUM>/surface` and `status/<ENUM>/foreground`. Labels preserve raw enum traceability and do not define transitions.

| Status | Light surface / foreground | Dark surface / foreground | Contrast Light / Dark |
|---|---|---|---|
| TO_DO | #E9EFEC / #485F55 | #2A3A3B / #C3D0CA | 5.92 / 7.47 |
| IN_PROGRESS | #DFECE7 / #285F57 | #1B3935 / #8BC7B4 | 6.04 / 6.49 |
| BLOCKED | #F6E6E2 / #853D31 | #432A2A / #F2B6AB | 6.40 / 7.52 |
| IN_REVIEW | #EBE6F1 / #614A7C | #342A45 / #D4C0EF | 6.16 / 8.05 |
| READY_FOR_QA | #E4EFF0 / #345E68 | #1A3740 / #A4D5DE | 6.08 / 7.90 |
| REOPENED | #F5EEDC / #735E2A | #3B321F / #EAD28D | 5.39 / 8.48 |
| READY_FOR_PRODUCTION | #E5EBF3 / #405A7D | #24334C / #B8CDEC | 5.88 / 7.85 |
| DONE | #E3EFE4 / #365E3A | #1B392B / #ABE0B8 | 6.29 / 8.45 |

## Typography and geometry

Available fonts verified: Inter Regular/Semi Bold and Cairo Regular/SemiBold. Size/line-height values are px; these are practical candidates rather than a finalized type system.

| Role | Inter LTR | Cairo RTL | Weight |
|---|---|---|---|
| H1 desktop | 32/40 | 32/52 | 600 |
| H2 desktop | 24/32 | 24/42 | 600 |
| H3 | 18/26 | 20/36 | 600 |
| Body | 16/24 | 16/30 | 400 |
| Strong label specimen | 14/20 | 14/26 | 600 |
| Field label/value | 14/20 | 14/26 | 400 |
| Button label | 14/20 | 14/26 | 600 Inter; 400 Cairo |
| Metadata | 12/18 | 13/24 | 400 |
| Task-card title | 16/24 | 16/30 | 600 |

Compact/mobile adjustments: Inter H1 28/36 and H2 22/30; Cairo H1 28/46 and H2 22/38. Body/label/metadata stay at their listed sizes. No new breakpoint thresholds are approved. Small English technical annotations remain subordinate 11/17 specimens, not the default body style.

Cairo's larger line heights and 13px metadata support Arabic readability. Native Arabic Tasks preserve right-aligned actions and chip, a long wrapped task title and mixed OR-42 content. The type board adds an explicit 360px RTL wrap check and isolated OR-42 / 2026-11-04 example. The date is a mixed-content test, not resolution of DEC-12 or a date/numeral policy.

Spacing candidates: 4, 8, 12, 16, 24, 32, 48, 64px. Radii: 4px small utility, 7px chips, 8px controls, 10px cards, 12px panels. Elevation: 0 flat; Light level 1 uses y3/blur9/4.5% shadow; Dark uses surface layering and borders without card shadows. Soft borders 1px; essential borders 1px; focus 2px with a separated 2px gap in the primary-button specimen. Larger elevation levels and complete interaction behavior are not defined.

## Sampled contrast and accessibility findings

Computed from sRGB candidate hex values using relative luminance and (Llighter + 0.05) / (Ldarker + 0.05). All 48 sampled pairs meet the stated targets: normal text ≥4.5:1, relevant non-text boundaries/focus ≥3:1. This does not certify WCAG conformance.

| Sample | Light | Dark |
|---|---:|---:|
| Foreground / raised surface | 13.01 | 11.64 |
| Muted metadata / raised surface | 5.03 | 7.49 |
| Primary foreground / primary | 6.27 | 8.12 |
| Primary hover / pressed labels | 8.12 / 10.06 | 9.80 / 6.44 |
| Secondary label / secondary | 5.96 | 7.10 |
| Essential border / surface | 3.93 | 4.45 |
| Essential border / secondary | 3.73 | 3.79 |
| Focus / surface | 6.27 | 11.49 |
| Focus / raised surface | 6.27 | 9.79 |
| Focus / workspace | 5.73 | 13.18 |
| Disabled foreground / disabled surface | 4.62 | 4.65 |

Inactive controls are contrast-exempt in some WCAG provisions; the disabled sample was nevertheless checked for readability. Disabled appearance is distinct through its subdued fill/text rather than opacity alone. Status/semantic samples carry text labels; color is not the sole cue. Error input uses a boundary plus a textual error. The focus ring is separated from the primary fill so similar hues do not merge.

Final renders of both foundations, geometry, type board and all four Tasks studies were inspected. No material clipping/overlap remains observed. The wrap specimen and documentation cover sizing were corrected and re-rendered; two capture retries succeeded after native-node inspection. The actual four UI studies contain only colors from their candidate mode/status maps. All 32 reused instances link correctly; Arabic studies use Cairo throughout. No new components or image fills exist on the page. Six protected C/D07 fingerprints match before/after. Static visual checks do not establish keyboard operation, screen-reader support, device behavior, motion/reduced-motion behavior or complete state/theme coverage.

## Earlier batch review items — superseded by D10-v1 acceptance

- Color baseline accepted by explicit owner authorization for B02: Light sidebar, Dark navy navigation, layering, teal, semantic/focus/border/state values preserved without redesign.
- B02 native color variables accepted by the owner for the bounded D10-v1 baseline; no further color selection is required within this batch.
- Inter/Cairo scale, Arabic line spacing, density and geometry remain study candidates pending subsequent scoped D10 work.
- Authorize subsequent work separately; D10 remains TODO and D11 has not begun.

## B02 — Native color variables and modes

[119:40 — Native mode verification board](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=119-40), on existing page 100:2. Native Auto Layout, text, rectangles and bound paints; no new components or raster content.

| Local collection | ID | Modes | Variables |
|---|---|---|---:|
| Taskly Orbit / Color Primitives | VariableCollectionId:118:107 | Value = 118:0 | 61 |
| Taskly Orbit / Semantic Colors | VariableCollectionId:118:108 | Light = 118:1; Dark = 118:2 | 43 |

The semantic collection contains 27 `color/<role>` variables from the table above and 16 `status/<ENUM>/surface` / `status/<ENUM>/foreground` variables from the eight-status table. Each mode value is a native VARIABLE_ALIAS into the primitive collection. Raw names follow the documented aliases; extra unique status values use `raw/status/<lowercase-enum>/<light-or-dark>-<surface-or-foreground>`. Equal hex values reuse one primitive, including feedback/status overlaps. No duplicate names within collections or duplicate raw hex variables were found. Scopes are explicit, with no ALL_SCOPES; primitives have empty scopes. WEB syntax uses `var(--...)` as a proposed naming bridge, not implemented frontend CSS.

To switch: select board 119:40, choose the **Taskly Orbit / Semantic Colors** collection mode **Light** or **Dark** in Figma. The single board inherits that mode throughout. It is left in Light for review. The same root was switched Light → Dark → Light, with all 43 semantic values checked through `resolveForConsumer` against exact approved values in both modes (27/27 base roles plus 16/16 status colors). Persisted root and child mode resolution and bound paint values were verified; static duplicates were not used as switching evidence.

All 181 solid fill/stroke paints on the board bind to semantic variables, covering all 43 roles. Final Light and Dark renders were visually inspected after correcting clipped card actions with Auto Layout height. English Inter and actual Arabic Cairo remain readable; Arabic content, chip and action align right, with mixed-script identifiers retained. No material clipping or overlap remains observed. The first post-switch capture was stale; a subsequent persisted-mode read and fresh render confirmed the actual Dark appearance.

Contrast was recalculated from actual variable resolution: **50/50 pairs pass** (25 per mode), including text ≥4.5:1 and essential boundaries/focus ≥3:1. This extends the B01 48-pair set with active-navigation labels: Light 6.04:1, Dark 8.16:1. Existing body, muted, primary, feedback, disabled and eight status-pair ratios match the tables above. No WCAG certification, runtime keyboard test or permission meaning is implied. Decorative borders remain intentionally subtle; essential boundaries use border-strong.

All eight B01 study-root fingerprints and six selected C/D07 reference fingerprints matched before/after. Sources: 101:2, 101:267, 101:532, 102:2, 103:17, 103:149, 103:285, 103:314; 87:66, 87:206, 87:240, 92:351, 38:318, 38:510. This bounded structural comparison covers recursive IDs, geometry, paints, text/font and hierarchy; it is not a full-file export audit. No material value discrepancy or remaining tooling blocker was found.

## B03 — Native typography and geometry candidates

**B03 QA: PASS; typography/geometry accepted in D10-v1 following final validation.** B02 native colors are accepted as the bounded D10-v1 color baseline. No color variable values, aliases, modes, scopes or syntax changed in B03.

[124:40 — Typography and geometry verification](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=124-40), one new area on existing page 100:2. Type columns: 124:44 English / 124:66 Arabic. Compact checks: [124:89](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=124-89), with 360px English 124:90 and Arabic 124:99; Dark layering 124:108. Spacing 124:116; radius/borders/elevation 124:142. All are native editable objects; no application components were created.

### Text styles

Inter Regular / Semi Bold and Cairo Regular / SemiBold were verified through available-font discovery and loaded. Twenty local styles retain the exact B01 size, weight and language-specific line-height candidates. Shared button roles reuse EN Label/Strong and AR Label/Regular rather than creating redundant styles. Field labels use Label/Regular. Compact H1/H2 are explicit alternatives, not automatically switching styles or newly approved breakpoints. Body/labels/metadata retain their documented compact sizes. Text alignment is a node/layout setting: Arabic text is right-aligned; it is not encoded as a mirrored font style.

| Native text style | Size / line height | Weight | Style ID |
|---|---:|---:|---|
| Taskly Orbit/EN/Heading/H1 | 32/40 | 600 | S:610cc5e607bed4948e7ee44bb4d07dad5f9b6b49, |
| Taskly Orbit/EN/Heading/H2 | 24/32 | 600 | S:d4340297ae0fd9a5aa704aa460aa187c8b450675, |
| Taskly Orbit/EN/Heading/H3 | 18/26 | 600 | S:04e296d59f06d0a8845c59c4118c6cd3b56ae9a5, |
| Taskly Orbit/EN/Body | 16/24 | 400 | S:3894285b95122f5b4f82abd7ad8db8b4eb245edf, |
| Taskly Orbit/EN/Label/Strong | 14/20 | 600 | S:24556e684b6cc32afd8e4576aab84efb2b0c9d27, |
| Taskly Orbit/EN/Label/Regular | 14/20 | 400 | S:f715083381ead8217bb15244d04d988c811f78a2, |
| Taskly Orbit/EN/Metadata | 12/18 | 400 | S:25ac3b5a27a33d4906c48ad0e64d19da413f739e, |
| Taskly Orbit/EN/Card title | 16/24 | 600 | S:1a012edd6b04ec6559e393d21896758bca278fc2, |
| Taskly Orbit/EN/Compact/H1 | 28/36 | 600 | S:787bdf5a8ba7f86ada533982e617d9508252e1b4, |
| Taskly Orbit/EN/Compact/H2 | 22/30 | 600 | S:7ace2a29ec72d766b278124aebd881d852b2d3cc, |
| Taskly Orbit/AR/Heading/H1 | 32/52 | 600 | S:d7c43a138e04de848dd17044d6088109afdd6e6e, |
| Taskly Orbit/AR/Heading/H2 | 24/42 | 600 | S:03cab53fb71395155c6bcb4e9732a043c057f728, |
| Taskly Orbit/AR/Heading/H3 | 20/36 | 600 | S:3430b1ec610967430aec9485d636ceafc1ca18e6, |
| Taskly Orbit/AR/Body | 16/30 | 400 | S:ef64f1b71fb653dc16bd7f0e5c140d22080ed3ed, |
| Taskly Orbit/AR/Label/Strong | 14/26 | 600 | S:cf57e0c75014f142cc0004250e0e1025ddd24c9e, |
| Taskly Orbit/AR/Label/Regular | 14/26 | 400 | S:49e296db13c536e2e213c757221d11b21ac7440c, |
| Taskly Orbit/AR/Metadata | 13/24 | 400 | S:86d673df50b18444c54c45a02b874b0f88b8984a, |
| Taskly Orbit/AR/Card title | 16/30 | 600 | S:769e0761b73d91f75d8588acf0fb7dac533b9ea4, |
| Taskly Orbit/AR/Compact/H1 | 28/46 | 600 | S:e690f4e00569274c5ff1a1e18dec8892905ba27e, |
| Taskly Orbit/AR/Compact/H2 | 22/38 | 600 | S:2fd698af04e9cddcf0c5ce30167d9bdee0ccceca, |

### Numeric geometry

One local collection **Taskly Orbit / Geometry**, ID **VariableCollectionId:123:127**, single **Value** mode **123:0**. Numeric values are mode-independent. Scopes: spacing GAP; radius CORNER_RADIUS; border widths STROKE_FLOAT. Explicit WEB var() naming metadata is provided; no frontend code exists. One thin width serves both decorative and essential borders; the semantic stroke color distinguishes their roles.

| Variable | Value (px) | ID |
|---|---:|---|
| spacing/4 | 4 | VariableID:123:128 |
| spacing/8 | 8 | VariableID:123:129 |
| spacing/12 | 12 | VariableID:123:130 |
| spacing/16 | 16 | VariableID:123:131 |
| spacing/24 | 24 | VariableID:123:132 |
| spacing/32 | 32 | VariableID:123:133 |
| spacing/48 | 48 | VariableID:123:134 |
| spacing/64 | 64 | VariableID:123:135 |
| radius/utility | 4 | VariableID:123:136 |
| radius/chip | 7 | VariableID:123:137 |
| radius/control | 8 | VariableID:123:138 |
| radius/card | 10 | VariableID:123:139 |
| radius/panel | 12 | VariableID:123:140 |
| border-width/thin | 1 | VariableID:123:141 |
| border-width/focus | 2 | VariableID:123:142 |

All 15 variables are used in actual numeric bindings: 364 bound padding/gap/corner/stroke properties, with zero value mismatches. Every radius binds all four corner fields. Spacing/4 through /64 each drives a real Auto Layout gap in 124:116; root 124:40 uses spacing/32 padding and /24 gap. Field 124:103 binds radius/control and border-width/thin; focus surround 124:105 binds border-width/focus and the existing focus color. The documented 2px focus separation is fixed geometry, not a new general spacing token.

### Elevation styles

- **Taskly Orbit/Elevation/Flat** — S:6b2f0c71df54c121fc380e3eb1f6851f6571ca0b,; empty native effect list. Applied to Dark surface 124:110 and layered card 124:112, plus flat radius samples.
- **Taskly Orbit/Elevation/Light selective** — S:ea4bbfe8421a1f40a4a8f47f066507b11f0bc4b9,; exact source 101:582 shadow: offset x0/y3, blur9, spread0, color RGB 0.10/0.18/0.15, alpha0.045. Applied to 124:158 with subtle border. No larger elevation scale.
- Dark hierarchy uses existing surface/surface-raised color aliases and Flat effects. Effect styles do not switch by color mode; use the correct treatment deliberately. No fake elevation variable binding.

### B03 checks — accepted in D10-v1

Final full-area and compact bilingual renders were inspected. Long Arabic compact heading is 328px wide and 92px high (two 46px lines); Arabic body is 328×60 (two 30px lines). English compact heading wraps over three 36px lines. Mixed-script OR-42/date text uses isolates; this does not resolve DEC-12. Arabic fields and actions align to the logical right. Inputs hug their actual text with bound padding; no material clipping/overlap remains observed.

All 82 text nodes link to native styles and match their font, size and line height; all 20 styles are exercised. Numeric values match the table; no duplicate style/variable names, new duplicate collection, ALL_SCOPES pollution or components. Colors remain bound to existing semantic variables. Geometry/font styles are accepted as local D10-v1 foundations; no library publication occurred.

Protected recursive fingerprints for eight B01 roots, B02 board, four selected C roots and two D07 Tasks references match before/after (15 roots); both accepted color collection fingerprints also match. Bounded fingerprints cover names/IDs, geometry, paints, text/styles/effects and hierarchy, not a full-file export audit.

The final D10-v1 acceptance below supersedes B03's earlier pending-review wording for type scale, Arabic line spacing, compact wrapping, spacing/radii and selective elevation. This evidence covers static design, not runtime responsiveness, keyboard/screen-reader verification, motion rules or accessibility certification. No D11 execution.

## D10-v1 final owner acceptance — 2026-11-02

Final bounded review PASS under the owner's explicit conditional authorization. D10 is DONE. Exact baseline values and native IDs are those recorded above; earlier candidate labels on preserved Figma specimens and historical batch reports do not indicate pending foundation approval.

- Color collections retain 61 primitives and 43 semantic variables: all 86 mode entries have valid native aliases and resolve to exact approved values. Read-only checks used existing Light consumer 119:40 and Dark consumer 124:108; B02's actual same-board Light → Dark → Light switching evidence is reused.
- All 20 Inter/Cairo text styles and 15 numeric variables match their documented definitions. Both effect styles exist; Flat is empty and Light selective exactly matches 101:582. B03 sample retains 82 linked text nodes, 364 numeric bindings and 135 semantic color bindings; B02 retains 181 color bindings. No binding/value failures or structural overflow found.
- Reused final B02 Light/Dark and B03 full/compact visual evidence: English LTR, right-aligned Cairo RTL, long Arabic wrapping and isolated mixed IDs remain supported. Current Arabic heading 124:100 is 328×92; all 17 Cairo nodes in B03 align right. No new screenshot or specimen was needed.
- Both accepted color collection fingerprints and all 15 protected C/D07/D10 root fingerprints still match. No Figma mutation occurred during acceptance. Existing 50/50 sampled contrast passes remain valid because exact color values/aliases are unchanged. This remains sampled evidence, not accessibility certification.
- Token use, text roles, separate language line heights, compact adjustments, geometry, elevation and mode limitations are documented above. Native foundation criteria pass. No product, permission, transition or API behavior changed.

Light retains Concept C's light sidebar and original icons; Dark retains its distinct navy navigation and layered surfaces. Future design batches must validate English LTR and Arabic RTL together. D11–D23 remain TODO; no subsequent task starts automatically. See [final acceptance report](../../.ai/reports/D10-final-acceptance.md).


D03–D09 approvals remain. DEC-05/06/07/08/11/12 remain unresolved; G-01–G-17 OPEN; F-17–F-20 deferred; Statistics conditional under G-17. No product, permission, transition or API semantics changed. Full Figma approval remains required before frontend implementation.
