# D22 — Final Product Design QA

**Status: REVIEW — bounded design QA PASS, pending explicit owner acceptance.** This is not full product approval or runtime accessibility certification.

Figma file: [Taskly Orbit](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9). Rendered samples were inspected as listed below; no nodes were repaired. Existing D13–D21 acceptance evidence remains authoritative within its original scope.

## Surface coverage matrix

| Surface | D06 scope | D22 final rendered QA |
|---|---|---|
| OR-S01 | Sign in | Rendered sample: 165:1362, 165:1387, 165:1437 |
| OR-S02 | Sign up | Rendered sample: 176:449 |
| OR-S03 | Recovery request | Rendered sample: 181:233 |
| OR-S04 | Password reset | Rendered sample: 188:229 |
| OR-S05 | Shell and navigation | Rendered sample: 302:95, 313:193 |
| OR-S06 | Projects | Rendered sample: 192:176 |
| OR-S07 | Create project | Rendered sample: 194:524, 198:1026, 198:1134, 198:1263 |
| OR-S08 | Project details and edit | Rendered sample: 199:1376, 201:1031 |
| OR-S09 | Members | Rendered sample: 203:406, 203:607, 203:484, 203:504 |
| OR-S10 | Invite member | Rendered sample: 205:243 |
| OR-S11 | Invitation landing | Rendered sample: 209:350 |
| OR-S12 | Epics | Rendered sample: 216:1445 |
| OR-S13 | Create epic | Rendered sample: 224:668 |
| OR-S14 | Epic details | Rendered sample: 232:20 |
| OR-S15 | Tasks and Kanban | Rendered sample: 243:1382, 243:3144 |
| OR-S16 | Create task | Rendered sample: 249:967 |
| OR-S17 | Task details | Rendered sample: 257:3 |
| OR-S18 | Statistics and calendar summary | Rendered sample: 295:443, 287:757, 295:2031, 295:2162, 295:2293 |
| OR-S19 | Display controls | Rendered sample: 159:1255 |

## Findings and next checks

- No P0/P1 defect was established in the bounded rendered and native samples. P2 consistency candidate is recorded below.
- No before/after comparison exists; no edits were made. Exact inspected page IDs: 0:1, 1:2, 9:2, 14:2, 21:2, 26:2, 38:317, 53:2, 57:2, 74:2, 100:2, 129:2, 138:112, 165:1361, 171:2, 176:253, 181:232, 188:102, 192:175, 194:203, 199:1375, 203:99, 205:242, 209:132, 216:1444, 224:2, 232:19, 243:1381, 249:403, 257:2, 287:2, 302:2, 311:2, 316:437. These are inventory evidence, not visual QA.
- Focus ring and warning text/icon are visible in rendered 312:49; reduced-motion drawer 313:193 and dialog 312:35 were rendered. Representative contrast measurements are recorded below. Runtime focus, keyboard, screen-reader and accessibility certification remain unverified. D21 pointer QA was reused and not repeated; no prototype mutations occurred.
- DEC-05/06/07/08/11/12 remain unresolved; G-01–G-17 remain open, F-17–F-20 deferred, and Statistics conditional under G-17. Backend selection and implementation validation remain separate.
- D23 remains TODO. Its handoff should follow completed D22 review and owner acceptance; preserve approved components, links, decisions and unresolved holds.

## D22 continuation evidence

Rendered 320/360/390 Arabic validation forms 198:1026, 198:1134 and 198:1263; tablet 203:607; empty 203:484, error 203:504, denied 302:129, uncertainty 201:1031 and 243:3144. Screenshots 295:2031/2162/2293 were re-rendered at higher resolution; the static layouts show readable hierarchy and no obvious horizontal clipping in the inspected output. The static samples do not prove runtime behavior.

Native readback: 194:524 had 14 linked instances with no missing masters, an explicit semantic mode and variable aliases for fill and spacing; 312:49 had six linked instances with no missing masters and 15 bound nodes; 295:2162 had 18 linked instances with no missing masters and 80 bound nodes. Cairo text in those Arabic samples aligned right. These are sampled counts, not whole-file certification. Form 194:524 surface is contained within its 390px root. Contrast measurements are recorded below.

P2 candidate: English Sign in actions 165:1381, 165:1383 and 165:1385 render left-aligned, unlike centered Arabic Sign in and other authentication buttons. Native text readback confirms LEFT. D13 explicitly specifies centered Arabic buttons; English treatment is an inconsistency, not evidence of an approved English centering requirement. No change was made. No before/after repair exists.

Additional renders: loading 203:464, pending 198:365, qualified acknowledgement 198:563, unknown eligibility 203:527 and focus 260:1953. The final bounded native and contrast checks are recorded below. Reuse D21 playback because no interactions were changed. D23 must preserve approved source links, conditional states and unresolved holds after D22 acceptance.

## Final native and contrast reconciliation

Actual Figma paints and parent fills were read in their explicit semantic modes. Each measured paint and its applicable parent was opaque (opacity 1, normal blending), so no alpha compositing was needed for these pairs. Ratios use WCAG relative luminance; normal text requires 4.5:1, large text and meaningful UI indicators 3:1. This is a representative sample, not a complete contrast certification.

| Sample and role | Foreground / background | Ratio | Result |
|---|---|---:|---|
| 192:197 normal text / 192:176 canvas, Light | #60736E / #F3F5F3 | 4.59:1 | PASS |
| 165:1366 24px heading / 165:1365 surface, Light | #20343A / #FFFFFF | 13.01:1 | PASS |
| 295:2169 normal text / 295:2167 surface, Dark | #B2C4BC / #15232D | 8.79:1 | PASS |
| 295:2165 32px heading / 295:2162 canvas, Dark | #E6EFEA / #0D151D | 15.67:1 | PASS |
| 312:57 focus ring / 312:49 surface, Dark | #AFE6D0 / #15232D | 11.49:1 | PASS |
| 260:1958 strong control border / white surface, Light | #71857B / #FFFFFF | 3.93:1 | PASS |
| 312:57 field border / 312:49 surface, Dark | #6F8C91 / #15232D | 4.45:1 | PASS |
| 313:193 original navigation icon / drawer, Light | #20343A / #FAFCFB | 12.63:1 | PASS |

Native checks: 192:176 (EN desktop Light), 203:607 (EN tablet Light), 165:1362 (EN desktop Light), 194:524 (AR mobile Dark), 198:1026 (AR 320 Light), 295:2162 (AR 360 Dark), and 312:49 (AR 360 Dark) resolved the expected explicit Light 118:1 or Dark 118:2 mode. Sampled component instances resolved masters; 192:176 had 9, 203:607 had 6, 165:1362 had 7, 194:524 had 11 visible, 295:2162 had 18 and 312:49 had 6, with no missing masters in each sample. Semantic aliases bind sampled foreground, surface, background, focus and border paints. Counts reflect sampled visible traversal and do not certify the entire file.

RTL form 194:538 has right-aligned Arabic labels and centered action labels; Create is to the right of Cancel in logical RTL order, and the surface fits its 390px root. The earlier rendered 320/360/390 validation samples show wrapping and padding; hidden collection content is excluded from containment conclusions. On 312:49, the focused field 312:57 lies at x=16, width 328 in a 360px frame; its ring is within the specimen with a 2px design gap and visible surrounding clearance. The Arabic drawer 313:193 uses right-aligned labels and original C icon instances, including the documented sign-out exception; the Latin brand lockup remains LTR. These are static native and rendered observations, not a runtime reading-order, keyboard or screen-reader test.

No P0/P1 was identified in this bounded sample; no repairs or prototype destinations changed, so no retest was necessary. P2 English sign-in alignment remains optional polish. Existing D21 tested-versus-wired coverage and Reduced Motion limitations remain authoritative. D23 should preserve source links, conditional states and DEC/G/F holds, and organize the developer entry after owner review. The separate full Figma approval gate for frontend work remains in force.
