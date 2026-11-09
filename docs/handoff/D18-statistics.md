# D18 — Statistics & Calendar / B01

Status: TODO for D18. The owner accepted B01 as the structural foundation in the B02 brief on 2026-11-09. B02 bounded static design QA PASS; visual upgrade pending owner review. Backend-agnostic editable OR-S18 design; audited API mappings below are optional integration examples. G-17 remains unresolved. No production metric definitions, formulas or live API guarantees are approved.

## Exact Figma references

[Final design page 287:2](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=287-2).

| Composition | EN Light | AR Light | EN Dark | AR Dark |
| --- | --- | --- | --- | --- |
| Desktop, 1472px | 287:3 | 287:110 | 287:217 | 287:320 |
| Mobile, 390px | 287:423 | 287:507 | 287:591 | 287:674 |

All IDs refer to the linked file above. [Tablet 834px 287:757](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=287-757); Arabic compact [320px 287:840](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=287-840), [360px Dark 287:923](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=287-923), [390px 287:1006](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=287-1006).

Sources inspected and preserved: D07 desktop 53:3, tablet 53:52, mobile 53:83, Arabic 53:114; calendar 54:2, per-project 54:44, recovery 54:71. Reused approved D17 shell/brand and D11 buttons, fields, select triggers and responsive drawer; D10 semantic and geometry variables, Inter/Cairo styles. No source master was edited.

## Behavior and integration traceability

D06 OR-S18 / J-16 controls independent scopes. Calendar maps optionally to D02 OP-27: date-only inclusive 1–7-day range, conditional project/status filters. Project options map to OP-08 and do not prove aggregate eligibility. Per-project maps to OP-28 with a separate date range and no project/status filters inherited from calendar or global navigation. No initial date range is selected or promised. No scheduling, velocity, custom metrics or inferred permissions.

Desktop/tablet show a date-sequence overview; mobile stacks equivalent day summaries. The three-day arrangement is a design example, not a default or a fixed range limit. Future selected ranges can contain 1–7 days. No week-start or timezone convention is established. Counts use held-value dashes, not fake zeros; result blocks are explicitly labeled conditional design examples. Example project labels are synthetic and do not establish actual access.

Apply validates the affected section only; invalid input retains local choices without a request. Cancel restores prior local choices and trigger focus. Loading and retry affect one section. Retained results must keep their confirmed scope label; new requests must not allow older responses to replace newer scope. Read activity never traps global navigation. Reconciliation is deliberate reading, not a write or durability guarantee.

## State map

| D06 state | Native example IDs |
| --- | --- |
| READY / CALENDAR-RESULT / PROJECTS-RESULT | Eight bases above; conditional placeholders only |
| CALENDAR-LOADING | 288:392 |
| CALENDAR-ERROR | 288:397 |
| PROJECTS-LOADING | 290:387 |
| PROJECTS-ERROR | 288:404 |
| PROJECTS-EMPTY | 288:411 — valid empty rows, not zero or unavailable |
| CALENDAR-ZERO | 288:416 — zero only from valid returned counts |
| SCOPE-CHANGE | 288:421 — distinguish retained and requested scope |
| VALIDATION | 288:426 |
| READ / OPTIONS-READY / OPTIONS-ERROR | 290:390 / 290:396 / 288:431; qualified empty choices 290:393 |
| AVAILABILITY / ERROR | 288:438 |
| RETURN | 290:399 |
| PARTIAL | Calendar failure with retained project example 290:402; project failure with retained calendar example 290:466 |

Section failures never substitute zero, clear the other section or transfer its filters. Genuine returned zero counts differ from a valid empty project array, unavailable data and unknown access.

## QA and limits

Inspected all eight final bases, tablet, 320/360/390 Arabic and representative loading, error, empty, zero and both partial compositions. Fixed action-row excess space, inherited Tasks navigation, compact selector text overflow, RTL date/action order and desktop brand clipping; reviewed affected final renders. Desktop was widened to 1472px to retain the original 300px sidebar and content spacing. Native inspection: 203 linked instances, no missing masters, no image fills, Inter/Cairo, native semantic Light/Dark modes, bound paints and no direct root-child overflow in 12 base/responsive compositions. Buttons retain centered labels; supporting text uses logical start. Controls remain editable instances; summary cards are editable layout frames.

Focus containment/return, keyboard/touch operation, announcements, responsive scrolling and reduced-motion are static design intent. Essential feedback remains visible without motion. This is not runtime, accessibility, integration, security or persistence certification.

DEC-05/06/07/08/11/12 and G-01–G-17 remain unresolved as recorded; F-17–F-20 remain deferred. G-17 holds metric definitions and populated semantics. Implementation must establish actual permissions, aggregation definitions, date conventions, API compatibility and security against its selected backend. D18 stays TODO pending owner review; D19 was not started.

## B02 — Premium dashboard presentation

Owner direction on 2026-11-09 accepts B01 structure and requests a visual dashboard upgrade. B01 nodes and recovery examples above remain preserved; the following B02 nodes are alongside them on page 287:2. This is assistant bounded visual QA, not owner approval of B02 or final D18 acceptance.

| Composition | EN Light | AR Light | EN Dark | AR Dark |
| --- | --- | --- | --- | --- |
| Desktop 1472px | 295:443 | 295:578 | 295:713 | 295:848 |
| Mobile 390px | 295:983 | 295:1114 | 295:1245 | 295:1376 |
| Tablet 834px | 295:1507 | 295:1638 | 295:1769 | 295:1900 |

[B02 desktop entry](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=295-443). Compact Arabic: 320px Light 295:2031, 360px Dark 295:2162, 390px Light 295:2293. All IDs use the same file link. Chart text fallback 296:1520; valid empty project result 296:1524; calendar error with section retry 296:1528. Existing B01 loading, zero, unavailable, reconciliation and partial-success mappings continue to apply.

Presentation uses native editable KPI-style cards, ellipse-arc donuts, labeled project bars and a seven-day overview with compact mobile day/value rows. Repeated summary and bar rows use local component instances; controls retain D11 instances. D10 semantic colors, geometry bindings and Inter/Cairo styles preserve Concept C. Actual native Light/Dark modes apply to all 15 responsive compositions. No original master, B01 node or brand lockup was replaced.

Every populated section is visibly marked synthetic and not live data. Calendar-only status examples show In progress 12, In review 6 and Done 18; the donut represents this illustrative subset, not the complete status taxonomy or an approved aggregation. Day counts 4/6/3/8/5/7/3 are separate illustrative fixtures, not an approved reconciliation formula. Project A/B/C show independent illustrative counts 16/11/7 on a labeled 0–20 example scale. Their range and filters are never inherited from Calendar. These fixtures do not define which timestamp, event, membership, access rule or aggregation a selected backend must use. No velocity, scheduling, growth, percentage KPI or new metric is established. Initial dates remain unselected; populated examples are visual references, not evidence of a completed request.

Text labels and exact values remain visible beside charts; color and animation are supplementary. Mobile uses a vertical reading order and day/value list; Arabic reverses the date/day and comparison-bar direction while retaining readable numbers and the Latin brand. Empty/error examples omit numeric charts rather than fabricate zero. A rendering fallback retains available textual values; a data failure must not use that fallback to imply values were returned.

Motion intent: use existing D11 hover/pressed/focus feedback on actionable controls. A subtle opacity transition may introduce an independently refreshed section after confirmed reading; retain the scope label and visible loading/error feedback. Do not animate number counting or require a donut sweep, autoplay, hover tooltip or moving element to understand values. Reduced-motion uses immediate replacement with the same labels and announcements. This is documented interaction intent; no working runtime or new prototype is claimed.

B02 QA inspected all eight final desktop/mobile bases, all four tablet modes, 320/360/390px examples and the three chart fallback/empty/error examples. Corrected horizontal chart clipping, compact day overflow, text wrapping, tablet date widths and Arabic action ordering; inspected affected renders after fixes. Native inspection found editable frames, linked instances, text, ellipse arcs and rectangles, no image fills, and only Inter/Cairo fonts. Backend, permissions, persistence, keyboard/screen-reader behavior and accessibility certification remain outside this static QA. D18 remains TODO; D19 was not started.
