# D12 — Bilingual and theme rules

**D12-v1 owner acceptance: DONE, 2026-11-02**, following bounded final validation of B01 evidence. Concept C and D10-v1 remain the approved identity/foundation. These examples define design intent, not working runtime behavior or a D11 component library.

## Native examples

Existing file: o5x1eCbKM7xPx7SKB0hsI9. New [rules page 129:2](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=129-2), [comparison area 129:3](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=129-3).

| Combination | Composition | Task / focus / mobile / drawer nodes |
|---|---|---|
| English LTR Light | [129:5](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=129-5) | 130:36 / 130:49 / 130:104 / 130:132 |
| Arabic RTL Light | [129:6](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=129-6) | 130:179 / 130:192 / 130:247 / 130:275 |
| English LTR Dark | [129:8](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=129-8) | 130:322 / 130:335 / 130:390 / 130:418 |
| Arabic RTL Dark | [129:9](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=129-9) | 130:465 / 130:478 / 130:533 / 130:561 |

Each includes original navigation icons, confirmed task/status, title editor, actions, focus, default/hover/pressed/disabled specimens, four labeled feedback treatments, all eight raw status identifiers, a 360px mobile study and drawer/directional examples. These are separate representative studies, not one new application screen. Content follows D07/C; no status transitions or permission policy are added.

## Direction and icon rules

- Use logical start/end: left/right in English, right/left in Arabic. Mirror sidebar position and icon/label arrangement; retain global, current-project and utility grouping. Read each section from its logical start, then top to bottom. Do not reverse characters to simulate RTL.
- Labels, field values, headings, task titles and status context align to start; button labels can be centered. The Save/Cancel pair is anchored at start: Save then Cancel in logical reading order. English shows Save left of Cancel; Arabic shows Save right of Cancel. This follows approved C title editors 92:397 / 92:465. Open-task actions and narrow controls also use start alignment.
- Unified navigation drawer enters at start: left English, right Arabic, following D07 4:128 / 4:162. Its close control stays at start inside the drawer. Detail-panel Close is a different pattern: logical end, as in C 92:384 / 92:454. Closing intent retains actual-origin focus return and existing dirty/pending safeguards.
- Back points left in LTR/right in RTL; forward reverses accordingly. Arrow specimens describe direction, not a new enabled workflow. The original sign-out vector 87:184 mirrors as a complete exit symbol with the navigation edge.
- Preserve original Projects/folder, Statistics/chart, Tasks/checks, Epics/layers, Members, Project-details/document and Language/appearance shapes (87:177–87:183). Their category/content meaning is not reading direction. Keep chart/data order, check marks, menu and close glyphs intact. Moving an icon beside RTL text does not require reflecting its geometry. Taskly Orbit's brand stays intact.

## Typography, mixed content and responsive use

Apply existing `Taskly Orbit/EN/*` Inter and `Taskly Orbit/AR/*` Cairo styles; preserve each language's approved line heights. Allow Arabic expansion using height-resizing text and Auto Layout. Right alignment is a node/layout property, separate from the text style.

The mobile studies use 360px outer width/328px content and real multiline Arabic. This is a stress-test width, not a breakpoint decision. Let titles, errors and labels wrap; keep actions reachable through responsive stacking/scrolling when required. Runtime keyboard clearance, zoom, text resizing and overflow still need implementation testing.

Keep task/project IDs, raw enums and date fixtures intrinsically LTR within RTL prose. The editable Arabic examples use Unicode LRI/PDI isolation around OR-42, PRJ-01, TO_DO and 2026-11-04; raw enum specimens use Inter and retain their exact values. Runtime must provide equivalent bidi isolation, preserve copied data and handle user-entered text by content direction. The date is a fixture, not a selected date, numeral, timezone or calendar convention. **DEC-12 remains unresolved.** Arabic labels remain editorial review candidates; translations never change backend values.

## Theme and state application

Inherit `Taskly Orbit / Semantic Colors` (VariableCollectionId:118:108), Light 118:1 or Dark 118:2, across descendants. Language and appearance are independent axes. Both modes use the same 43 semantic roles and existing aliases to primitives. Geometry uses VariableCollectionId:123:127; text/elevation styles reuse D10. No new palette, variable, style or component was created.

Light retains light navigation, neutral surfaces and muted teal. Dark retains navy navigation, layered surfaces and adapted teal. Use surface-raised for task cards, border-strong for essential controls, border for decorative separation, paired feedback/status surface/foreground roles, and explicit text labels. Hover/pressed alter presentation without changing meaning. Disabled appearance does not establish permissions. Status order is not a transition graph; retain last-confirmed content until a qualified result. Light uses selective elevation; Dark uses flat effects and surface layering.

Show the D10 2px focus treatment separately from active/error states. Existing D06 focus intent remains: meaningful navigation destinations, first invalid field, topmost modal ownership and return to the actual trigger; no duplicate write or automatic replay. Keyboard/touch equivalents and static reduced-motion alternatives are runtime requirements, not demonstrated interactions. No preference default, system following, persistence, Settings API or new Save request is specified. **DEC-11 remains unresolved.**

## Validation and limits

All four final PNG renders were independently viewed after repairs. No material clipping/overlap remained. Each root has 65 frames, 70 styled text nodes and 11 editable vectors; no raster UI or components. Per root: 135 paint bindings, 455 numeric bindings, all 43 semantic roles. All bindings resolve to the expected persisted values. Arabic has 61 Cairo nodes plus nine intentional Inter brand/raw-code nodes; Arabic prose aligns right and control labels center.

Same root 129:5 was switched Light → Dark → Light: persisted bound background changed #F3F5F3 → #0D151D → #F3F5F3, navigation #FAFCFB → #0B1725 → #FAFCFB. Final roots retain the intended explicit modes. Across 280 sampled text/background pairs, minimum contrast is 4.59:1 Light/4.65:1 Dark. Focus/surface is 6.27/11.49; essential border/surface 3.93/4.45. These samples support legibility, not WCAG certification or working focus/screen-reader behavior.

Before/after fingerprints matched 16 selected D07/C/D10/display/drawer source roots and all 119 existing variables, 20 text styles and two effect styles. The local audit found no unbound solid paints, binding mismatches, containment failures or unintended Auto Layout sibling overlaps. One screenshot transport interruption recovered after inspecting the existing root; no duplicate output was created.

Owner accepted the direction/icon exceptions, action order, mixed-content treatment and four-combination consistency as D12-v1. D11’s D12 dependency is satisfied; D11 remains TODO until separately authorized. D03–D10 approvals, DEC-05/06/07/08/11/12 unresolved, G-01–G-17 OPEN, F-17–F-20 deferred and conditional Statistics under G-17 remain unchanged.
