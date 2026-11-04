# D16 — Epics

Status: TODO. B01 Epics Collection: REVIEW (bounded design QA PASS; owner review pending). Create Epic and Epic Details are outside this batch.

## B01 — Epics Collection

[Figma page 216:1444](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=216-1444) contains desktop EN Light 216:1445, AR Light 216:1504, EN Dark 216:1563, AR Dark 216:1622; mobile EN Light 216:1681, AR Light 216:1728, EN Dark 216:1775, AR Dark 216:1822. Responsive specimens: 320 AR Dark 217:2287, 360 AR Dark 217:2324, 390 AR Dark 217:2361, tablet 768 EN Light 217:2398, and compact Arabic failure 219:560. State specimens: initial loading 216:1869, qualified empty 216:1900, no matches 216:1931, initial failure 216:1962, incremental loading 216:1995, incremental failure 216:2030, unknown eligibility 216:2067, established restriction 216:2101, uncertain-creation reconciliation 220:548 and failed reconciliation 220:586.

## Contract and decisions

D03 F-08 identifies project-scoped browsing/search as a supported core candidate; creation remains conditional under F-09. OR-S12 maps to D02 OP-14, D06 OR-S12 and J-10/J-11: only title query, clear, and evidenced limit/offset reads are represented. Results show titles, available descriptions and a missing-description fallback; selecting an existing Epic preserves the actual project, canonical identity and available list origin for the separate details journey. A successful empty result with no query differs from no matches and failure. Incremental loading/failure retains safe rows and current query; retry addresses the same read, with no assumed total, page advance or end-of-collection claim. Deliberate reconciliation after uncertain creation does not identify a created Epic by title or absence. Read access does not establish create rights; Create is an eligible-condition specimen, with unknown and established restriction shown separately. No additional filters, role policy or frontend/backend behavior was introduced.

## Reuse and QA

All eight desktop/mobile EN/AR Light/Dark renders, tablet and 320/360/390 long Arabic title specimens, and representative state renders were inspected. Compact Arabic failure feedback wraps and grows. Reused linked D11 Epic Row, Text Field, Button, Collection Read State, Feedback, Navigation and Orbit Atelier identity; D10 native semantic modes and bindings and D12 direction rules are retained. Native readback found no missing instance masters or horizontal overflow in the checked layouts. Original D14/D15/D11 and D07 sources were preserved. An unrelated project-card instance within the partial state was hidden and confirmed Epic rows retained. Static design QA does not establish runtime search, paging, keyboard, focus, screen-reader, responsive or accessibility behavior, or actual authorization. Essential feedback is static; reduce nonessential motion when requested.

Existing DEC-05/06/07/08/11/12, G-01–G-17 and F-17–F-20 holds remain as recorded; G-04/G-10/G-11/G-16 are particularly relevant. Statistics remains conditional. D16 stays TODO until later batches and owner acceptance.
