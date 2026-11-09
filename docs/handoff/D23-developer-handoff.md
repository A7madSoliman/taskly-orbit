# D23 B01 — Developer handoff

**B01 review candidate; D23 remains TODO.** Full-product Figma approval must be explicitly recorded in `docs/handoff/` before frontend development. This guide does not release that gate. The product is a reusable bilingual, backend-agnostic task-management design; the audited Supabase contract is an optional integration reference, and a new or other compatible backend is allowed. Design acceptance does not verify backend behavior, authorization, security, persistence or runtime accessibility.

Start with the editable [Figma developer landing 419:3](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=419-3), then this guide. The landing links to source pages; names containing REVIEW, TODO or IN PROGRESS are historical labels, not current status. See the [design backlog](../../.ai/tasks/DESIGN_BACKLOG.md) for current acceptance. Source links in this document identify the existing file; designs and prototype connections were not altered for B01.

## Foundations and implementation approach

- **Tokens and typography:** use the native Light/Dark semantic aliases and geometry from [D10 foundations](D10-design-foundation.md), [Figma 100:2](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=100-2). Inter is the English family and Cairo the Arabic family; use the approved text styles and spacing/radius/elevation variables rather than inferring values from screenshots.
- **Components and icons:** reuse [D11 components](D11-component-library.md), [Figma 138:112](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=138-112), including buttons, fields, feedback, dialog, drawer and navigation. Reuse the original Concept C vector icons and approved Orbit Atelier lockup; retain the Latin wordmark order and original directional exceptions. Asset extraction and licensing must be checked in the eventual implementation.
- **Responsive, locale and theme:** follow [D12 rules](D12-bilingual-theme-rules.md), [Figma 129:2](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=129-2). Deliberately reflow desktop, tablet and mobile; validate 320/360/390px forms, long Arabic, logical start alignment and centered labels where specified. Mirror directional navigation only where the approved meaning requires it; isolate mixed-script identifiers. Apply semantic Light/Dark modes, not palette inversion. Preference persistence and system defaults remain held.
- **Motion:** follow [D20](D20-motion.md), [Figma 311:3](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=311-3). Provide equivalent immediate Reduced Motion states; essential content and choices do not rely on animation. Runtime preference detection and focus behavior require implementation tests.
- **States and accessibility:** use [D06 state matrix](../ux/D06-screen-state-matrix.md), [D05 journeys](../ux/D05-user-journeys.md), [D19 feedback rules](D19-feedback-states.md) and [D22 QA](D22-final-design-qa.md). Distinguish loading, valid empty, failure and retry; pending, definite rejection, qualified acknowledgement and uncertain outcomes; and readonly, denied and unknown eligibility. Never replay uncertain writes automatically. Supply semantic labels, visible focus, keyboard and non-drag alternatives, actual-origin return and screen-reader announcements; validate these at runtime. D22 sampled contrast is not full WCAG certification.

## Screen index

The exact links below are representative editable entry compositions; each authoritative handoff indexes variants, states and additional nodes.

| D06 surface | Entry | Authoritative handoff |
|---|---|---|
| OR-S01 Sign in | [165:1362](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=165-1362) | [D13](D13-authentication.md) |
| OR-S02 Sign up | [176:254](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=176-254) | [D13](D13-authentication.md) |
| OR-S03 Recovery | [181:233](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=181-233) | [D13](D13-authentication.md) |
| OR-S04 Reset | [188:103](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=188-103) | [D13](D13-authentication.md) |
| OR-S05 Shell / navigation | [192:176](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=192-176), [drawer 313:193](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=313-193) | [D19](D19-feedback-states.md), [D20](D20-motion.md) |
| OR-S06 Projects | [192:176](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=192-176) | [D14](D14-projects.md) |
| OR-S07 Create project | [194:204](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=194-204) | [D14](D14-projects.md) |
| OR-S08 Project details | [199:1376](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=199-1376) | [D14](D14-projects.md) |
| OR-S09 Members | [203:100](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=203-100) | [D15](D15-members-invitations.md) |
| OR-S10 Invite member | [205:243](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=205-243) | [D15](D15-members-invitations.md) |
| OR-S11 Invitation landing | [209:133](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=209-133) | [D15](D15-members-invitations.md) |
| OR-S12 Epics | [216:1445](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=216-1445) | [D16](D16-epics.md) |
| OR-S13 Create epic | [224:3](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=224-3) | [D16](D16-epics.md) |
| OR-S14 Epic details | [232:20](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=232-20) | [D16](D16-epics.md) |
| OR-S15 Tasks / Kanban | [243:1382](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=243-1382) | [D17](D17-tasks.md) |
| OR-S16 Create task | [249:404](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=249-404) | [D17](D17-tasks.md) |
| OR-S17 Task details | [257:3](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=257-3) | [D17](D17-tasks.md) |
| OR-S18 Statistics / calendar | [295:443](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=295-443) | [D18](D18-statistics.md) |
| OR-S19 Display controls | [159:1255](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=159-1255) | [D12](D12-bilingual-theme-rules.md), [D19](D19-feedback-states.md) |

[D21 prototype entry and Preview links](D21-prototypes.md) enumerate B01/B02 journeys, tested versus wired-only branches, actual-parent returns, simulated outcomes and Instant/Reduced Motion examples. They are fixed-state design demonstrations, not functional validation or persistence guarantees.

## Backend-independent contract

**DESIGN REQUIREMENT** describes data and interaction the UI needs when the feature is implemented. **VERIFIED REFERENCE** means the bounded static D02 audit of the optional legacy contract, not production authorization or a universal API. **IMPLEMENTATION HOLD** requires decisions or verification against the chosen backend. [D02 audit](../api/D02-api-backend-contract-audit.md), [D02 mapping](../ux/D02-ui-action-api-mapping.md) and D06 contain operation-specific evidence; no new endpoint, schema, permission, transition or default is prescribed here.

| Area | DESIGN REQUIREMENT | VERIFIED REFERENCE | IMPLEMENTATION HOLD |
|---|---|---|---|
| Authentication | Credentials and session/context results; sign in, sign up, recovery, reset and sign out; validation, pending, rejection and uncertainty. | [D13](D13-authentication.md), D02 authentication operations | DEC-08/G-13 session and safe continuation; actual expiry, recovery and authorization. |
| Projects | Scoped identity, name and optional description; list/read, eligible create/edit; loading, empty, failure, dirty and uncertain. | [D14](D14-projects.md), D02 OP-08–10 and OP-24 | DEC-05 and applicable G-01/G-04/G-09–11/G-16; creation/edit eligibility and persistence. |
| Members | Project-scoped roster and available identity/role display; read and retry; loading, qualified empty, error and unknown. | [D15](D15-members-invitations.md), OP-11 | G-15 zero-member semantics; roster access does not establish invitation rights. |
| Invitations | Available invitation context and qualified result; eligible send/accept and safe continuation; pending, rejected, denied and uncertain. | [D15](D15-members-invitations.md), OP-12–13 | Eligibility, delivery, membership and return context are conditional; no automatic replay. |
| Epics | Project-scoped epic data and supported optional relations; list/search, read, eligible create/edit, options and retries. | [D16](D16-epics.md), OP-14–17 and related reads | Permission, date policy and relation eligibility; no assumed default. |
| Tasks | Scoped task details and available relations; read/list, eligible create/edit and scoped reconciliation; loading, empty, failure and uncertain. | [D17](D17-tasks.md), OP-19–22 and OP-29 | DEC-05/G-04 authorization, nullable fields, date and persistence behavior. |
| Statuses | Last confirmed status, available eligible choices and explicit confirmation; pending/rejected/uncertain preserve confirmed state. | [D17](D17-tasks.md), OP-22 | DEC-07/G-08 transitions, defaults and legacy values; no invented graph or optimistic move. |
| Statistics | Independently scoped calendar and project results, explicit filters, loading/empty/error and section retry, text alternatives. | [D18](D18-statistics.md), OP-27–28 | G-17 metric semantics and availability remain conditional; synthetic examples are not live data. |

All DEC-05/06/07/08/11/12, G-01–G-17 and deferred F-17–F-20 remain visible requirements. Verify selected-backend RLS/authorization, constraints, compatibility, transition enforcement, security, runtime and persistence before integration or production claims.

## Figma dependency and cleanup inventory

B01 made no deletion, archive, move or rename of existing source. Page inventory uses exact IDs; membership in a group does not prove every descendant is unused.

| Classification | Page IDs | Reason |
|---|---|---|
| Approved source — KEEP | 165:1361, 176:253, 181:232, 188:102, 192:175, 194:203, 199:1375, 203:99, 205:242, 209:132, 216:1444, 224:2, 232:19, 243:1381, 249:403, 257:2, 287:2 | Accepted D13–D18 screen families and linked source variants. |
| Active design-system dependency — KEEP | 100:2, 129:2, 138:112, 171:2 | D10/D11/D12 foundations, reusable components and approved brand references. |
| Prototype dependency — KEEP | 316:437 | D21 accepted B01/B02 fixtures and Preview destinations; preserve reactions and links. |
| Decision/QA evidence — KEEP | 0:1, 74:2, 302:2, 311:2 | Wireframe index, concept decisions, D19 feedback and D20 motion evidence. |
| Uncertain dependency — KEEP / INVESTIGATE | 1:2, 9:2, 14:2, 21:2, 26:2, 38:317, 53:2, 57:2 | Earlier wireframe families may be linked evidence or dependencies; do not assume duplicates are unused. |
| Developer entry — KEEP | 419:2 / 419:3 | New D23 B01 page and landing frame. |
| Verified unused duplicate — CLEANUP CANDIDATE | None established | Page inventory alone cannot establish absence of references. |

B02 proposal: inspect inbound prototype reactions, component instances, links and documentation references for individually identified candidate nodes; preserve decision and QA evidence and record exact IDs and impact. Only propose removal or archive after dependencies and owner scope are confirmed. No cleanup is authorized by this inventory.

## Implementation checklist

1. Obtain and record explicit owner full-product Figma approval before beginning frontend work.
2. Review the indexed screens, D05/D06 flows and D11/D12 variants; implement semantic tokens, bilingual layout and responsive behavior.
3. Map each feature and state to the selected backend; resolve holds and validate authorization, API behavior and persistence separately.
4. Implement keyboard, focus, screen-reader, non-drag and Reduced Motion alternatives; test actual contrast, zoom, devices and locale behavior.
5. Validate actual navigation, overlay ownership, recovery, uncertainty and data outcomes; never treat Figma Preview as runtime proof.
6. Keep D23 TODO until cleanup, full handoff review and explicit owner approval are complete.

## B01 verification and limits

Main was synchronized at `543ce99` before the bounded work. The Figma page inventory and landing were inspected; the final 419:3 render was checked after correcting a clipped footer. Landing links are native text hyperlinks; their target IDs and all representative screen IDs above resolve in the existing file. All 18 starting-point IDs referenced by the D21 Preview links resolve; this is node-resolution evidence, not a new playback or URL-opening test. Existing D21 pointer QA and D22 visual QA were reused. No accepted master, source screen or prototype reaction was intentionally changed; this is mutation-scope and targeted reference evidence, not a whole-file fingerprint.

The landing uses editable Inter text and D10 color bindings. It is a developer-facing index rather than a product screen; it does not add a locale, theme or responsive product variant. The D22 P2 English Sign in alignment remains accepted as optional future polish. Link checking verified local relative paths in this guide and README; historical ignored report links may depend on the local workspace. A complete runtime accessibility, security or backend audit was not performed.
