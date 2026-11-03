# D-03 — Screen Scope Matrix

Status: DONE — conditional D03-v1 scope accepted, 2026-10-28; final design approval remains held.
Date: 2026-10-28. Proposal version: D03-v1.

## Conditional owner acceptance

Owner approved conditional D03-v1 on 2026-10-28. D-03 is DONE. Approved: DEC-01, DEC-02, DEC-03, DEC-04, DEC-09, DEC-10, DEC-13, DEC-14, DEC-15, DEC-16. DEC-05, DEC-06, DEC-07, DEC-08, DEC-11 and DEC-12 remain unresolved. All 17 backend gaps remain OPEN. This approves conditional scope, not backend guarantees or final Figma design. Bounded D-04 planning is allowed but not started here. Figma and frontend implementation have not started.

Proposal-era pending-scope wording below is superseded by this acceptance; screen records and behavior-specific holds remain preserved.

## Baseline, authority and identifiers

This document implements the approved documentation plan only. It preserves the planning selections: small project teams, workspace as navigation/project context, explicit field-level Save/Cancel, and conditional statistics/calendar. Date policy remains unresolved. Full product-scope approval is pending.

- [Product scope and requirements](../product/D03-product-scope-requirements.md) governs feature scope, gaps, decisions and readiness.
- [Accepted D-01 inventory](D01-screen-interaction-inventory.md), [D-01 findings](../product/D01-architecture-ux-audit.md#evidence-based-ux-findings-register), [D-02 API audit](../api/D02-api-backend-contract-audit.md) and [D-02 action mapping](D02-ui-action-api-mapping.md) remain unchanged.
- Baseline source revision: `06e216366f57b80e7db0890efdc0e605eab68be1`. No source/API/backend retrieval, runtime validation or Figma generation is performed in D-03.
- Exactly **19 proposed Orbit records**, OR-S01 through OR-S19. OR-S identifiers describe design surfaces, including overlays and a shared shell; they do not prescribe frontend routes or 19 standalone pages.
- SC-00 through SC-14 remain historical reference aliases. Feature IDs F-01 through F-20, operation IDs OP-01 through OP-29 and gaps G-01 through G-17 are preserved. No new backend operation or type is introduced.

## Shared profiles and cross-cutting requirements

Every record explicitly includes desktop/tablet/mobile, English LTR/Arabic RTL, light/dark, keyboard/accessibility and motion/reduced-motion requirements. CR identifiers refer to the [cross-cutting requirement table](../product/D03-product-scope-requirements.md#cross-cutting-design-requirements).

| Profile | Required behavior/state coverage | Evidence boundary |
|---|---|---|
| READ | Initial and applicable incremental loading; populated success; valid empty/no-match; initial/partial/incremental error and explicit read retry; supported missing/denied/session conditions | Never equate empty with denial or failure. Preserve loaded context and stale-scope protection in specifications; runtime validation later |
| WRITE | Pristine/dirty, validation, saving, confirmed success, field/form failure, uncertain outcome, permission unknown/readonly, and pending-close/cancel policy | Preserve draft within the active interaction; no durable/offline draft guarantee. Do not repeat uncertain writes automatically. Empty list may be N/A for a mutation; optional fields/options still need empty states |
| AUTH | Context checking/submitting, validation/rejection, confirmed result and recoverable/expired-context states where evidenced | No invented account-existence, delivery, confirmation, expiry or session guarantees |
| BOARD | Pickup/selection, destination indication, cancellation, provisional request, confirmed change, definite-failure rollback where justified, uncertain reconciliation | Non-drag alternative mandatory; transition graph and ordering remain unverified; UI cannot promise rollback of a committed server write |
| ACCESS | Visible focus, logical order, associated labels/help/errors, progress/error announcements, non-color cues, keyboard activation, overlay focus containment/return and touch-operable controls | Design requirements, not source compliance claims; WCAG 2.2 AA target proposed in DEC-10 |

Full locale/theme requirements apply to every meaningful state, including errors, empty guidance, confirmation, uncertain saves and permission states. No separate enumeration of every cartesian variant is a claim of visual QA. D-06/D-22 will define and verify representative coverage.

## Screen summary

| Screen | Surface | Features | Source aliases | API references |
|---|---|---|---|---|
| [OR-S01](#or-s01) | Sign in | [F-01](../product/D03-product-scope-requirements.md#f-01), [F-07](../product/D03-product-scope-requirements.md#f-07) | SC-01 | [OP-02](../api/D02-api-backend-contract-audit.md#op-02), [OP-05](../api/D02-api-backend-contract-audit.md#op-05) |
| [OR-S02](#or-s02) | Sign up | [F-01](../product/D03-product-scope-requirements.md#f-01) | SC-02 | [OP-01](../api/D02-api-backend-contract-audit.md#op-01) |
| [OR-S03](#or-s03) | Recovery request | [F-02](../product/D03-product-scope-requirements.md#f-02) | SC-03 | [OP-06](../api/D02-api-backend-contract-audit.md#op-06) |
| [OR-S04](#or-s04) | Password reset | [F-02](../product/D03-product-scope-requirements.md#f-02) | SC-04 | [OP-25](../api/D02-api-backend-contract-audit.md#op-25), [OP-26](../api/D02-api-backend-contract-audit.md#op-26), [OP-04](../api/D02-api-backend-contract-audit.md#op-04) |
| [OR-S05](#or-s05) | Shell and navigation | [F-03](../product/D03-product-scope-requirements.md#f-03), [F-15](../product/D03-product-scope-requirements.md#f-15), [F-16](../product/D03-product-scope-requirements.md#f-16) | Shared / new frontend UX | [OP-03](../api/D02-api-backend-contract-audit.md#op-03), [OP-05](../api/D02-api-backend-contract-audit.md#op-05), [OP-07](../api/D02-api-backend-contract-audit.md#op-07), [OP-08](../api/D02-api-backend-contract-audit.md#op-08), [OP-24](../api/D02-api-backend-contract-audit.md#op-24) |
| [OR-S06](#or-s06) | Projects | [F-04](../product/D03-product-scope-requirements.md#f-04) | SC-05 | [OP-08](../api/D02-api-backend-contract-audit.md#op-08) |
| [OR-S07](#or-s07) | Create project | [F-05](../product/D03-product-scope-requirements.md#f-05) | SC-06 | [OP-09](../api/D02-api-backend-contract-audit.md#op-09) |
| [OR-S08](#or-s08) | Project details and edit | [F-04](../product/D03-product-scope-requirements.md#f-04), [F-05](../product/D03-product-scope-requirements.md#f-05) | SC-07 | [OP-24](../api/D02-api-backend-contract-audit.md#op-24), [OP-10](../api/D02-api-backend-contract-audit.md#op-10) |
| [OR-S09](#or-s09) | Members | [F-06](../product/D03-product-scope-requirements.md#f-06) | SC-10 | [OP-11](../api/D02-api-backend-contract-audit.md#op-11) |
| [OR-S10](#or-s10) | Invite member | [F-07](../product/D03-product-scope-requirements.md#f-07) | SC-10 | [OP-12](../api/D02-api-backend-contract-audit.md#op-12) |
| [OR-S11](#or-s11) | Invitation landing | [F-07](../product/D03-product-scope-requirements.md#f-07) | SC-14 | [OP-13](../api/D02-api-backend-contract-audit.md#op-13), [OP-02](../api/D02-api-backend-contract-audit.md#op-02), [OP-05](../api/D02-api-backend-contract-audit.md#op-05) |
| [OR-S12](#or-s12) | Epics | [F-08](../product/D03-product-scope-requirements.md#f-08) | SC-08 | [OP-14](../api/D02-api-backend-contract-audit.md#op-14) |
| [OR-S13](#or-s13) | Create epic | [F-09](../product/D03-product-scope-requirements.md#f-09) | SC-09 | [OP-15](../api/D02-api-backend-contract-audit.md#op-15), [OP-11](../api/D02-api-backend-contract-audit.md#op-11) |
| [OR-S14](#or-s14) | Epic details | [F-08](../product/D03-product-scope-requirements.md#f-08), [F-09](../product/D03-product-scope-requirements.md#f-09) | SC-08 | [OP-16](../api/D02-api-backend-contract-audit.md#op-16), [OP-17](../api/D02-api-backend-contract-audit.md#op-17), [OP-20](../api/D02-api-backend-contract-audit.md#op-20), [OP-11](../api/D02-api-backend-contract-audit.md#op-11) |
| [OR-S15](#or-s15) | Tasks and Kanban | [F-10](../product/D03-product-scope-requirements.md#f-10), [F-12](../product/D03-product-scope-requirements.md#f-12) | SC-11 | [OP-19](../api/D02-api-backend-contract-audit.md#op-19), [OP-22](../api/D02-api-backend-contract-audit.md#op-22), [OP-29](../api/D02-api-backend-contract-audit.md#op-29) |
| [OR-S16](#or-s16) | Create task | [F-11](../product/D03-product-scope-requirements.md#f-11) | SC-11, SC-08 | [OP-21](../api/D02-api-backend-contract-audit.md#op-21), [OP-11](../api/D02-api-backend-contract-audit.md#op-11), [OP-14](../api/D02-api-backend-contract-audit.md#op-14) |
| [OR-S17](#or-s17) | Task details | [F-10](../product/D03-product-scope-requirements.md#f-10), [F-11](../product/D03-product-scope-requirements.md#f-11), [F-12](../product/D03-product-scope-requirements.md#f-12) | SC-11, SC-08 | [OP-29](../api/D02-api-backend-contract-audit.md#op-29), [OP-22](../api/D02-api-backend-contract-audit.md#op-22), [OP-11](../api/D02-api-backend-contract-audit.md#op-11), [OP-14](../api/D02-api-backend-contract-audit.md#op-14) |
| [OR-S18](#or-s18) | Statistics and calendar summary | [F-13](../product/D03-product-scope-requirements.md#f-13), [F-14](../product/D03-product-scope-requirements.md#f-14) | SC-12 | [OP-27](../api/D02-api-backend-contract-audit.md#op-27), [OP-28](../api/D02-api-backend-contract-audit.md#op-28), [OP-08](../api/D02-api-backend-contract-audit.md#op-08) |
| [OR-S19](#or-s19) | Display controls | [F-16](../product/D03-product-scope-requirements.md#f-16) | Shared / new frontend UX | None established |

## Complete screen records

### OR-S01

**Sign in**

- **Feature/module:** [F-01](../product/D03-product-scope-requirements.md#f-01), [F-07](../product/D03-product-scope-requirements.md#f-07).
- **D-01 screen reference:** SC-01 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Enter the product and retain a valid invitation return.
- **Primary user actions:** Sign in; choose session persistence; navigate to signup/recovery.
- **Required data:** Credentials, remember choice, safe return context; no credential display.
- **API operation references:** [OP-02](../api/D02-api-backend-contract-audit.md#op-02), [OP-05](../api/D02-api-backend-contract-audit.md#op-05).
- **Desktop composition:** Centered form with supporting context.
- **Tablet composition:** Single-column form; preserve readable spacing.
- **Mobile composition:** Full-width form, keyboard clearance and long error wrapping.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** AUTH; input validation; invalid credentials mapping; restoration error; expired session; successful authenticated continuation. Empty list state N/A.
- **Accessibility and keyboard:** Label/error associations; keyboard submission; announced pending/error; focus on failed submission. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Progress, validation and success/failure use text/icons; static loading and immediate state changes under reduced motion. No essential meaning depends on animation; timings/easing deferred to D-20. CR-08 applies.
- **Dependencies and unknowns:** [G-13](../api/D02-api-backend-contract-audit.md#g-13); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. No automatic confirmation, session duration or redirect guarantee; authenticate-return constraints require D-13 evidence.
- **Related child/return surfaces:** [OR-S02](#or-s02), [OR-S03](#or-s03), [OR-S11](#or-s11). Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S02

**Sign up**

- **Feature/module:** [F-01](../product/D03-product-scope-requirements.md#f-01).
- **D-01 screen reference:** SC-02 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Create an account using evidenced fields.
- **Primary user actions:** Enter fields; submit; return to sign in.
- **Required data:** Name, account identifier, job title, password/confirmation; exact field rules trace to audit.
- **API operation references:** [OP-01](../api/D02-api-backend-contract-audit.md#op-01).
- **Desktop composition:** Responsive form with optional secondary framing.
- **Tablet composition:** Single-column grouping with clear hierarchy.
- **Mobile composition:** Scrollable form with visible submit and keyboard clearance.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** AUTH; validation; duplicate-account mapping where evidenced; request failure; uncertain write; confirmed submission. Empty N/A.
- **Accessibility and keyboard:** Required/help/error associations; password guidance announced without exposing content. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Progress, validation and success/failure use text/icons; static loading and immediate state changes under reduced motion. No essential meaning depends on animation; timings/easing deferred to D-20. CR-08 applies.
- **Dependencies and unknowns:** [G-01](../api/D02-api-backend-contract-audit.md#g-01), [G-13](../api/D02-api-backend-contract-audit.md#g-13); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. No new verification screen or automatic logged-in state; signup settings and response outcomes unverified.
- **Related child/return surfaces:** No additional child screen required by this proposal. Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S03

**Recovery request**

- **Feature/module:** [F-02](../product/D03-product-scope-requirements.md#f-02).
- **D-01 screen reference:** SC-03 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Request account recovery without asserting account existence.
- **Primary user actions:** Enter account identifier; submit; retry failed request; navigate to sign in.
- **Required data:** Account identifier and generic request outcome.
- **API operation references:** [OP-06](../api/D02-api-backend-contract-audit.md#op-06).
- **Desktop composition:** Compact recovery form and result panel.
- **Tablet composition:** Same content in narrower framing.
- **Mobile composition:** Single column; long localized confirmation wraps.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** AUTH; invalid input; submitting; generic request submitted; request failure; uncertain submission. Empty N/A.
- **Accessibility and keyboard:** Associate errors; announce generic result; preserve focus and retry context. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Progress, validation and success/failure use text/icons; static loading and immediate state changes under reduced motion. No essential meaning depends on animation; timings/easing deferred to D-20. CR-08 applies.
- **Dependencies and unknowns:** [G-13](../api/D02-api-backend-contract-audit.md#g-13); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. Do not imply message delivery, existence of an account or unlimited safe resend.
- **Related child/return surfaces:** No additional child screen required by this proposal. Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S04

**Password reset**

- **Feature/module:** [F-02](../product/D03-product-scope-requirements.md#f-02).
- **D-01 screen reference:** SC-04 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Verify recovery context and set a new password.
- **Primary user actions:** Check context; enter password/confirmation; submit; recover from expired/invalid context.
- **Required data:** Verified recovery context and password fields; context values never exposed.
- **API operation references:** [OP-25](../api/D02-api-backend-contract-audit.md#op-25), [OP-26](../api/D02-api-backend-contract-audit.md#op-26), [OP-04](../api/D02-api-backend-contract-audit.md#op-04).
- **Desktop composition:** Context/result panel with form.
- **Tablet composition:** Single-column form.
- **Mobile composition:** Full-width form with keyboard clearance.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** AUTH + WRITE; checking; invalid/missing/expired context where evidenced; saving; confirmed result; error/uncertain outcome. Empty N/A.
- **Accessibility and keyboard:** Announce context checking/errors; logical focus on next recovery action. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Progress, validation and success/failure use text/icons; static loading and immediate state changes under reduced motion. No essential meaning depends on animation; timings/easing deferred to D-20. CR-08 applies.
- **Dependencies and unknowns:** [G-13](../api/D02-api-backend-contract-audit.md#g-13); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. Recovery-only provenance, live expiry, confirmation and completion destination need evidence.
- **Related child/return surfaces:** No additional child screen required by this proposal. Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S05

**Shell and navigation**

- **Feature/module:** [F-03](../product/D03-product-scope-requirements.md#f-03), [F-15](../product/D03-product-scope-requirements.md#f-15), [F-16](../product/D03-product-scope-requirements.md#f-16).
- **D-01 screen reference:** Shared shell/new frontend UX proposal; no invented legacy route.
- **User objective:** Recognize context and reach global/project destinations.
- **Primary user actions:** Navigate; open/close drawer; switch current project through evidenced project selection; sign out.
- **Required data:** Identity projection, current project and available project list.
- **API operation references:** [OP-03](../api/D02-api-backend-contract-audit.md#op-03), [OP-05](../api/D02-api-backend-contract-audit.md#op-05), [OP-07](../api/D02-api-backend-contract-audit.md#op-07), [OP-08](../api/D02-api-backend-contract-audit.md#op-08), [OP-24](../api/D02-api-backend-contract-audit.md#op-24).
- **Desktop composition:** Sidebar and contextual navigation with consistent names.
- **Tablet composition:** Deliberate collapsed/context pattern; avoid accidental mixed breakpoints.
- **Mobile composition:** Drawer and persistent navigation proposal; project context remains visible.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** Restoring; navigation ready/active; unavailable identity/context; empty project context; session failure; local logout outcome.
- **Accessibility and keyboard:** Landmarks/skip navigation; active destination; drawer containment/Escape/focus return; restore navigation focus. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Specify overlay/open/close and focus handoff without essential movement; reduced motion uses immediate/static transition preserving the same state and focus. Loading and saved/error feedback remain textual. CR-08 applies.
- **Dependencies and unknowns:** [G-03](../api/D02-api-backend-contract-audit.md#g-03), [G-10](../api/D02-api-backend-contract-audit.md#g-10), [G-14](../api/D02-api-backend-contract-audit.md#g-14); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. No organization/workspace switcher; shell architecture only. OP-03 is internal, not a profile page API.
- **Related child/return surfaces:** [OR-S06](#or-s06), [OR-S08](#or-s08), [OR-S19](#or-s19). Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S06

**Projects**

- **Feature/module:** [F-04](../product/D03-product-scope-requirements.md#f-04).
- **D-01 screen reference:** SC-05 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Find and open a project.
- **Primary user actions:** Browse; load more; retry; open project; access permitted create action.
- **Required data:** Project summaries, canonical IDs and exact-count/paging expectations.
- **API operation references:** [OP-08](../api/D02-api-backend-contract-audit.md#op-08).
- **Desktop composition:** Readable grid/list with clear project names.
- **Tablet composition:** Adjusted column density and navigation context.
- **Mobile composition:** Single-column cards/list with explicit incremental feedback.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** READ; zero projects; populated; incremental loading/error with retry; denied/session states only where established.
- **Accessibility and keyboard:** Keyboard cards/links; readable metadata; announce added results without moving focus. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Progress, validation and success/failure use text/icons; static loading and immediate state changes under reduced motion. No essential meaning depends on animation; timings/easing deferred to D-20. CR-08 applies.
- **Dependencies and unknowns:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-10](../api/D02-api-backend-contract-audit.md#g-10), [G-11](../api/D02-api-backend-contract-audit.md#g-11); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. No project-wide search assumed; server counts/caps and create eligibility remain qualified.
- **Related child/return surfaces:** [OR-S07](#or-s07), [OR-S08](#or-s08). Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S07

**Create project**

- **Feature/module:** [F-05](../product/D03-product-scope-requirements.md#f-05).
- **D-01 screen reference:** SC-06 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Create a project with evidenced information.
- **Primary user actions:** Enter title/description; submit; cancel before submission.
- **Required data:** Project title and optional description; browser-to-upstream field translation.
- **API operation references:** [OP-09](../api/D02-api-backend-contract-audit.md#op-09).
- **Desktop composition:** Focused form in project context.
- **Tablet composition:** Single-column form.
- **Mobile composition:** Scrollable form; keyboard-safe submit/cancel.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** WRITE; initial blank form; validation; submitting; confirmed submission; field/form error; uncertain creation; permission conditions.
- **Accessibility and keyboard:** Associated fields/counter/errors; announce submission outcome. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Progress, validation and success/failure use text/icons; static loading and immediate state changes under reduced motion. No essential meaning depends on animation; timings/easing deferred to D-20. CR-08 applies.
- **Dependencies and unknowns:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-09](../api/D02-api-backend-contract-audit.md#g-09); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. No automatic retry/idempotency or guaranteed creation permission; uncertain result must not claim no project was created.
- **Related child/return surfaces:** No additional child screen required by this proposal. Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S08

**Project details and edit**

- **Feature/module:** [F-04](../product/D03-product-scope-requirements.md#f-04), [F-05](../product/D03-product-scope-requirements.md#f-05).
- **D-01 screen reference:** SC-07 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Inspect project details and maintain individual fields.
- **Primary user actions:** Load details; start field edit; Save/Cancel; leave with unsaved draft treatment.
- **Required data:** Project ID, name, optional description; current companion field when required by update schema.
- **API operation references:** [OP-24](../api/D02-api-backend-contract-audit.md#op-24), [OP-10](../api/D02-api-backend-contract-audit.md#op-10).
- **Desktop composition:** Details panel with clear field editors.
- **Tablet composition:** Stacked details and actions.
- **Mobile composition:** Inline/full-width field editor; stable action placement.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** READ + WRITE; absent description; missing/denied only where supported; dirty/saving/saved/failed/uncertain; readonly/unknown.
- **Accessibility and keyboard:** Field edit focus/return; explicit button labels; announce save outcomes. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Progress, validation and success/failure use text/icons; static loading and immediate state changes under reduced motion. No essential meaning depends on animation; timings/easing deferred to D-20. CR-08 applies.
- **Dependencies and unknowns:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-09](../api/D02-api-backend-contract-audit.md#g-09), [G-10](../api/D02-api-backend-contract-audit.md#g-10); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. Field-level UI does not imply a one-field project payload or atomic backend update; permission and confirmation unresolved.
- **Related child/return surfaces:** No additional child screen required by this proposal. Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S09

**Members**

- **Feature/module:** [F-06](../product/D03-product-scope-requirements.md#f-06).
- **D-01 screen reference:** SC-10 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Understand participants and evidenced role information.
- **Primary user actions:** Read members; open invite when eligible; retry.
- **Required data:** Member projection, separate user/membership IDs and roles.
- **API operation references:** [OP-11](../api/D02-api-backend-contract-audit.md#op-11).
- **Desktop composition:** Readable table/list.
- **Tablet composition:** Reduced-column list with essential metadata.
- **Mobile composition:** Compact rows with full accessible names and role text.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** READ; role/permission unknown; conditional valid zero-members versus restricted/inconsistent result; populated; failure.
- **Accessibility and keyboard:** Roles use text as well as color; keyboard invite; accessible list/table structure. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Progress, validation and success/failure use text/icons; static loading and immediate state changes under reduced motion. No essential meaning depends on animation; timings/easing deferred to D-20. CR-08 applies.
- **Dependencies and unknowns:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-05](../api/D02-api-backend-contract-audit.md#g-05), [G-10](../api/D02-api-backend-contract-audit.md#g-10), [G-15](../api/D02-api-backend-contract-audit.md#g-15); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. Do not choose zero-member semantics or creator invite rights without evidence; no edit/remove-role actions.
- **Related child/return surfaces:** [OR-S10](#or-s10). Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S10

**Invite member**

- **Feature/module:** [F-07](../product/D03-product-scope-requirements.md#f-07).
- **D-01 screen reference:** SC-10 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Submit a project invitation.
- **Primary user actions:** Enter account identifier; submit; close/cancel before submission.
- **Required data:** Target account identifier and project context; eligibility separately determined.
- **API operation references:** [OP-12](../api/D02-api-backend-contract-audit.md#op-12).
- **Desktop composition:** Focused dialog.
- **Tablet composition:** Dialog sized for touch/keyboard.
- **Mobile composition:** Deliberate full-height or sheet composition with safe areas.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** WRITE; empty input; invalid input; permission unknown/denied; submitting; submitted; error/conflict where evidenced; uncertain outcome.
- **Accessibility and keyboard:** Contain focus; return to trigger; associated error; announce result. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Specify overlay/open/close and focus handoff without essential movement; reduced motion uses immediate/static transition preserving the same state and focus. Loading and saved/error feedback remain textual. CR-08 applies.
- **Dependencies and unknowns:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-05](../api/D02-api-backend-contract-audit.md#g-05), [G-09](../api/D02-api-backend-contract-audit.md#g-09), [G-12](../api/D02-api-backend-contract-audit.md#g-12); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. No role picker, delivery claim, pending-list, resend or safe-retry promise; close during submit explicitly specified later.
- **Related child/return surfaces:** No additional child screen required by this proposal. Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S11

**Invitation landing**

- **Feature/module:** [F-07](../product/D03-product-scope-requirements.md#f-07).
- **D-01 screen reference:** SC-14 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Authenticate if needed and accept a valid invitation.
- **Primary user actions:** Read available context; sign in and return; accept; continue when destination is supplied.
- **Required data:** Available invitation input and handler result; optional destination project.
- **API operation references:** [OP-13](../api/D02-api-backend-contract-audit.md#op-13), [OP-02](../api/D02-api-backend-contract-audit.md#op-02), [OP-05](../api/D02-api-backend-contract-audit.md#op-05).
- **Desktop composition:** Standalone invitation flow.
- **Tablet composition:** Single-column context and action.
- **Mobile composition:** Stacked actions; clear authentication-return context.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** AUTH + WRITE; invalid input/context; pending acceptance; accepted with/without destination; rejected/expired/denied when evidenced; uncertain result.
- **Accessibility and keyboard:** Announce outcome; logical return focus; no sensitive link contents in copy. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Progress, validation and success/failure use text/icons; static loading and immediate state changes under reduced motion. No essential meaning depends on animation; timings/easing deferred to D-20. CR-08 applies.
- **Dependencies and unknowns:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-09](../api/D02-api-backend-contract-audit.md#g-09), [G-12](../api/D02-api-backend-contract-audit.md#g-12), [G-13](../api/D02-api-backend-contract-audit.md#g-13); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. No invented recipient/project preview. Bodyless acceptance may have no destination; propose neutral continuation rather than invent an ID.
- **Related child/return surfaces:** [OR-S01](#or-s01), [OR-S06](#or-s06). Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S12

**Epics**

- **Feature/module:** [F-08](../product/D03-product-scope-requirements.md#f-08).
- **D-01 screen reference:** SC-08 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Find and inspect epics.
- **Primary user actions:** Browse; search titles; clear search; load more; open details; access eligible create.
- **Required data:** Epic projections, title query, totals and project context.
- **API operation references:** [OP-14](../api/D02-api-backend-contract-audit.md#op-14).
- **Desktop composition:** Collection with scoped search.
- **Tablet composition:** Responsive collection density.
- **Mobile composition:** Single-column collection with readable search and incremental feedback.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** READ; zero epics versus no search matches; loading; partial/incremental error and retry; permission conditions.
- **Accessibility and keyboard:** Search label; clear action; announce results; stable focus after retry. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Progress, validation and success/failure use text/icons; static loading and immediate state changes under reduced motion. No essential meaning depends on animation; timings/easing deferred to D-20. CR-08 applies.
- **Dependencies and unknowns:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-10](../api/D02-api-backend-contract-audit.md#g-10), [G-11](../api/D02-api-backend-contract-audit.md#g-11); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. Literal-versus-wildcard semantics unresolved; no task-style filter set invented.
- **Related child/return surfaces:** [OR-S13](#or-s13), [OR-S14](#or-s14). Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S13

**Create epic**

- **Feature/module:** [F-09](../product/D03-product-scope-requirements.md#f-09).
- **D-01 screen reference:** SC-09 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Create an epic with supported optional fields.
- **Primary user actions:** Enter fields; choose assignee/deadline if supported; submit; cancel draft.
- **Required data:** Title, description, optional assignee/deadline; member options.
- **API operation references:** [OP-15](../api/D02-api-backend-contract-audit.md#op-15), [OP-11](../api/D02-api-backend-contract-audit.md#op-11).
- **Desktop composition:** Focused form.
- **Tablet composition:** Single-column fields and actions.
- **Mobile composition:** Keyboard-safe form with accessible selectors.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** WRITE; options loading/empty/error/retry; unassigned; date-validation policy blocked; submitted/error/uncertain.
- **Accessibility and keyboard:** Errors associated with fields; selectable options keyboard operable; date entry accessible. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Progress, validation and success/failure use text/icons; static loading and immediate state changes under reduced motion. No essential meaning depends on animation; timings/easing deferred to D-20. CR-08 applies.
- **Dependencies and unknowns:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-07](../api/D02-api-backend-contract-audit.md#g-07), [G-09](../api/D02-api-backend-contract-audit.md#g-09), [G-10](../api/D02-api-backend-contract-audit.md#g-10); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. Final date rules remain unresolved. Options failure cannot clear a draft; no actor role inferred from assignee checks.
- **Related child/return surfaces:** No additional child screen required by this proposal. Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S14

**Epic details**

- **Feature/module:** [F-08](../product/D03-product-scope-requirements.md#f-08), [F-09](../product/D03-product-scope-requirements.md#f-09).
- **D-01 screen reference:** SC-08 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Inspect epic and associated tasks; update one field.
- **Primary user actions:** Read details/tasks; open nested task; begin edit; Save/Cancel a field; create task only if eligible.
- **Required data:** Epic, member options, full associated task projection and conditional edit eligibility.
- **API operation references:** [OP-16](../api/D02-api-backend-contract-audit.md#op-16), [OP-17](../api/D02-api-backend-contract-audit.md#op-17), [OP-20](../api/D02-api-backend-contract-audit.md#op-20), [OP-11](../api/D02-api-backend-contract-audit.md#op-11).
- **Desktop composition:** Dialog/panel with independently recoverable task section.
- **Tablet composition:** Deliberate touch-sized panel and nested-overlay ownership.
- **Mobile composition:** Full-height detail surface with controlled scrolling.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** READ + field WRITE; absent optional fields; independent task loading/empty/error; saving/failed/uncertain; readonly; nested overlay return.
- **Accessibility and keyboard:** Contain/restore focus across nested task overlay; explicit Save/Cancel; announce per-field outcomes. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Specify overlay/open/close and focus handoff without essential movement; reduced motion uses immediate/static transition preserving the same state and focus. Loading and saved/error feedback remain textual. CR-08 applies.
- **Dependencies and unknowns:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-06](../api/D02-api-backend-contract-audit.md#g-06), [G-07](../api/D02-api-backend-contract-audit.md#g-07), [G-09](../api/D02-api-backend-contract-audit.md#g-09), [G-10](../api/D02-api-backend-contract-audit.md#g-10), [G-11](../api/D02-api-backend-contract-audit.md#g-11); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. One-field epic PATCH only; no atomic multi-field save. Dates and large all-task retrieval remain conditional.
- **Related child/return surfaces:** [OR-S16](#or-s16), [OR-S17](#or-s17). Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S15

**Tasks and Kanban**

- **Feature/module:** [F-10](../product/D03-product-scope-requirements.md#f-10), [F-12](../product/D03-product-scope-requirements.md#f-12).
- **D-01 screen reference:** SC-11 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Find work by title/status and request a status move.
- **Primary user actions:** Search/filter; inspect task; load/retry; create when eligible; request/cancel status change.
- **Required data:** Task projection, exact totals, status vocabulary and separate edit eligibility.
- **API operation references:** [OP-19](../api/D02-api-backend-contract-audit.md#op-19), [OP-22](../api/D02-api-backend-contract-audit.md#op-22), [OP-29](../api/D02-api-backend-contract-audit.md#op-29).
- **Desktop composition:** Status board with overview and horizontal-scroll cues.
- **Tablet composition:** Explicit intermediate board/list composition; touch and density reviewed.
- **Mobile composition:** Status-oriented list; non-drag status action; scroll priority.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** READ + BOARD; zero tasks/no matches; incremental errors; pickup/destination/cancel; provisional move; confirmed/rollback/uncertain; readonly/unknown.
- **Accessibility and keyboard:** Keyboard/non-drag moves; announcements; focus retention; text/icon status cues. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Specify pickup/drop/cancel/reconciliation feedback; reduced motion removes travel/reordering effects while retaining destination text, announcements and confirmed/uncertain outcome. No animation implies a successful move. CR-08 applies.
- **Dependencies and unknowns:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-08](../api/D02-api-backend-contract-audit.md#g-08), [G-09](../api/D02-api-backend-contract-audit.md#g-09), [G-10](../api/D02-api-backend-contract-audit.md#g-10), [G-11](../api/D02-api-backend-contract-audit.md#g-11); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. Allowed destinations unresolved; no arbitrary transitions, persisted intra-column order, realtime or conflict-free guarantee.
- **Related child/return surfaces:** [OR-S16](#or-s16), [OR-S17](#or-s17). Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S16

**Create task**

- **Feature/module:** [F-11](../product/D03-product-scope-requirements.md#f-11).
- **D-01 screen reference:** SC-11, SC-08 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Create a task in the current project.
- **Primary user actions:** Enter supported fields; choose members/epic/status; submit; cancel draft.
- **Required data:** Title, description, epic, assignee, status, due date; all form keys required by browser schema even if content optional.
- **API operation references:** [OP-21](../api/D02-api-backend-contract-audit.md#op-21), [OP-11](../api/D02-api-backend-contract-audit.md#op-11), [OP-14](../api/D02-api-backend-contract-audit.md#op-14).
- **Desktop composition:** Dialog/form surface.
- **Tablet composition:** Touch-sized dialog with logical groups.
- **Mobile composition:** Full-height form with keyboard-safe controls.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** WRITE; member/epic options loading/empty/error; nullable choices; validation; submission/error/uncertain; no duplicate retry promise.
- **Accessibility and keyboard:** Keyboard selectors; associated errors; first-error focus; pending announcements. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Specify overlay/open/close and focus handoff without essential movement; reduced motion uses immediate/static transition preserving the same state and focus. Loading and saved/error feedback remain textual. CR-08 applies.
- **Dependencies and unknowns:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-07](../api/D02-api-backend-contract-audit.md#g-07), [G-08](../api/D02-api-backend-contract-audit.md#g-08), [G-09](../api/D02-api-backend-contract-audit.md#g-09), [G-10](../api/D02-api-backend-contract-audit.md#g-10); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. Initial status/date policy and eligibility require evidence; uncertain creation may already have written.
- **Related child/return surfaces:** No additional child screen required by this proposal. Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S17

**Task details**

- **Feature/module:** [F-10](../product/D03-product-scope-requirements.md#f-10), [F-11](../product/D03-product-scope-requirements.md#f-11), [F-12](../product/D03-product-scope-requirements.md#f-12).
- **D-01 screen reference:** SC-11, SC-08 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Inspect task details and explicitly save supported field edits.
- **Primary user actions:** Read; edit field; Save/Cancel; clear supported optional value; request permitted status change.
- **Required data:** Task detail, separate canEdit, member/epic options and legacy display values.
- **API operation references:** [OP-29](../api/D02-api-backend-contract-audit.md#op-29), [OP-22](../api/D02-api-backend-contract-audit.md#op-22), [OP-11](../api/D02-api-backend-contract-audit.md#op-11), [OP-14](../api/D02-api-backend-contract-audit.md#op-14).
- **Desktop composition:** Detail dialog/panel.
- **Tablet composition:** Touch-sized panel.
- **Mobile composition:** Full-height detail/editor surface.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** READ + field WRITE; unassigned/no epic/no description/no date; missing; unknown legacy status; option failure; saving/confirmed/error/uncertain; readonly.
- **Accessibility and keyboard:** Accessible field actions; announcements; focus return to board or epic parent. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Specify overlay/open/close and focus handoff without essential movement; reduced motion uses immediate/static transition preserving the same state and focus. Loading and saved/error feedback remain textual. CR-08 applies.
- **Dependencies and unknowns:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-07](../api/D02-api-backend-contract-audit.md#g-07), [G-08](../api/D02-api-backend-contract-audit.md#g-08), [G-09](../api/D02-api-backend-contract-audit.md#g-09), [G-10](../api/D02-api-backend-contract-audit.md#g-10); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. No translation of raw API status keys. Preserve unavailable current options; changed-past-date policy and transition choices blocked.
- **Related child/return surfaces:** [OR-S14](#or-s14), [OR-S15](#or-s15). Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S18

**Statistics and calendar summary**

- **Feature/module:** [F-13](../product/D03-product-scope-requirements.md#f-13), [F-14](../product/D03-product-scope-requirements.md#f-14).
- **D-01 screen reference:** SC-12 in the [D-02 reference index](D02-ui-action-api-mapping.md#d-01-screen-reference-index), derived from the accepted D-01 inventory.
- **User objective:** Inspect independently scoped task summaries.
- **Primary user actions:** Choose valid range; apply calendar-only supported filters; inspect counts; retry each section.
- **Required data:** Dates, projects, calendar project/status filters, daily counts and per-project aggregates.
- **API operation references:** [OP-27](../api/D02-api-backend-contract-audit.md#op-27), [OP-28](../api/D02-api-backend-contract-audit.md#op-28), [OP-08](../api/D02-api-backend-contract-audit.md#op-08).
- **Desktop composition:** Separately labeled summaries and calendar sections.
- **Tablet composition:** Reflowed sections with distinct filter scope.
- **Mobile composition:** Stacked readable summaries and accessible date-based list/table alternative.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** Independent READ; checking range; loading without fabricated values; genuine zero counts versus unavailable; partial success; section error/retry; filter no-data.
- **Accessibility and keyboard:** Keyboard range controls; textual summaries; chart/table alternatives; section announcements. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Static loading/count placeholders; no count-up animation required; reduced motion uses immediate section updates and text announcements, never invented zero values. CR-08 applies.
- **Dependencies and unknowns:** [G-01](../api/D02-api-backend-contract-audit.md#g-01), [G-03](../api/D02-api-backend-contract-audit.md#g-03), [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-07](../api/D02-api-backend-contract-audit.md#g-07), [G-17](../api/D02-api-backend-contract-audit.md#g-17); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. Conditional module. Metric labels, formulas, overdue scope, all-project access and date/week policy block final populated designs; no scheduling.
- **Related child/return surfaces:** No additional child screen required by this proposal. Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

### OR-S19

**Display controls**

- **Feature/module:** [F-16](../product/D03-product-scope-requirements.md#f-16).
- **D-01 screen reference:** Shared shell/new frontend UX proposal; no invented legacy route.
- **User objective:** Choose interface language and theme.
- **Primary user actions:** Open controls; select language/theme; close controls.
- **Required data:** Interface preference state only; no backend operation.
- **API operation references:** No API; interface preference controls only.
- **Desktop composition:** Shell control/popover proposal.
- **Tablet composition:** Compact accessible control.
- **Mobile composition:** Shell control or narrow-screen preference surface.
- **Locale and direction:** English LTR and Arabic RTL; CR-01/CR-04 apply. Mirror navigation/layout logically; keep account inputs, IDs and mixed-script fragments intelligible; translate display labels separately from raw IDs/enums. Long text and responsive typography required. DEC-12/DEC-13 conventions remain pending.
- **Themes:** Light and dark; CR-02 applies to surfaces, text, borders, focus, status, feedback and readonly/disabled states; selected/failed states require text/icon cues as well as color.
- **Required UI states:** Current/selected option; keyboard focus; selection applied feedback; pending/error only if a later retention mechanism justifies it. Data empty/loading/error N/A.
- **Accessibility and keyboard:** Keyboard selection; selected-state text; direction switch preserves understandable focus. Common ACCESS profile and CR-06/CR-07 apply; design target DEC-10 awaits confirmation, source tests do not establish compliance.
- **Motion and reduced motion:** Specify overlay/open/close and focus handoff without essential movement; reduced motion uses immediate/static transition preserving the same state and focus. Loading and saved/error feedback remain textual. CR-08 applies.
- **Dependencies and unknowns:** [G-14](../api/D02-api-backend-contract-audit.md#g-14); G-01 applies to all API-backed data, G-04 to all project-scoped permissions. New frontend UX proposal; placement/defaults/local retention unresolved, no backend persistence or sync assumed.
- **Related child/return surfaces:** No additional child screen required by this proposal. Navigation to a child delegates its data/actions to that child's listed operations; it does not create a new route or parent API.
- **Design approval blockers:** Final scope acceptance pending on every row. Resolve or explicitly exclude the affected behavior in the listed gaps and [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register); do not fill missing outcomes with invented guarantees.

## Reference route reconciliation

All 15 accepted D-01 aliases are accounted for. This is coverage traceability, not a decision to duplicate old URL structure.

| D-01 alias | Orbit surface or disposition |
|---|---|
| SC-00 | Root entry/redirect behavior within [OR-S05](#or-s05)/[OR-S06](#or-s06); no additional standalone screen |
| SC-01 | [OR-S01](#or-s01) |
| SC-02 | [OR-S02](#or-s02) |
| SC-03 | [OR-S03](#or-s03) |
| SC-04 | [OR-S04](#or-s04) |
| SC-05 | [OR-S06](#or-s06) |
| SC-06 | [OR-S07](#or-s07) |
| SC-07 | [OR-S08](#or-s08) |
| SC-08 | [OR-S12](#or-s12), [OR-S14](#or-s14); nested [OR-S16](#or-s16)/[OR-S17](#or-s17) |
| SC-09 | [OR-S13](#or-s13) |
| SC-10 | [OR-S09](#or-s09), [OR-S10](#or-s10) |
| SC-11 | [OR-S15](#or-s15), [OR-S16](#or-s16), [OR-S17](#or-s17) |
| SC-12 | [OR-S18](#or-s18) conditional |
| SC-13 | Statistics alias/redirect to [OR-S18](#or-s18); no extra product screen |
| SC-14 | [OR-S11](#or-s11) with [OR-S01](#or-s01) authentication return |

[OR-S05](#or-s05) is shared; [OR-S19](#or-s19) is a new frontend-only UX proposal. OP-03/OP-05/OP-25/OP-26 remain verification/restoration/context dependencies, not invented independent pages. OP-18/OP-23 remain deferred; there is no committed delete screen. See the [29-operation disposition table](../product/D03-product-scope-requirements.md#complete-api-operation-dispositions).

## Interaction and approval constraints

- Field edits use proposed explicit Save/Cancel, not blur-autosave. Single-field epic PATCH is preserved; project payload translation may still require both current name/description. Task PATCH can accept a subset; no atomic cross-field or multi-request guarantee is added.
- A failed or uncertain option lookup does not silently clear existing assignment/epic. Nullable content and required browser keys remain separate concepts.
- Draft cancellation before a request is distinct from undoing a submitted write. Pending-close policy is DEC-14; no universal cancel/undo behavior is invented.
- A status selector or board destination must use approved feasible transitions; an enum alone does not authorize all moves. Legacy unknown statuses need neutral readable treatment without silently coercing data.
- Read retry is distinct from mutation retry. Confirmation and reconciliation depend on the operation; no universal optimistic-success, retry/idempotency or conflict-resolution policy.
- Calendar and per-project statistics use different filter scopes. Do not apply calendar project/status filters to OP-28 or imply count denominators match; no velocity/weekly-planner/scheduling claims.
- “Workspace” labels describe shell/project context. No separate organizations, membership or billing implied.
- No preference backend; local retention/defaults/system-following are undecided. Language/theme switches must preserve understandable focus without promising cross-device sync.

## D-04 readiness and final-design holds

Use the [D-04 checklist](../product/D03-product-scope-requirements.md#d-04-design-readiness-checklist) with these screen-level implications:

| Readiness area | Screen implications | Gate |
|---|---|---|
| Evidence-supported foundations | OR-S05/OR-S06 project context; sourced form fields and all reference aliases; bilingual/theme/responsive requirements | Source evidence only; complete scope approval pending |
| Bilingual terminology | Consistent shell destinations, explicit edit wording and conditional Statistics naming; long Arabic/English content on every surface | DEC-13; no final translation glossary generated |
| Semantic theme tokens | Focus/error/status/readonly/permission-unknown and neutral legacy-status variants; readable feedback in both modes | CR-02, D-10/D-12; tokens/components not created here |
| Responsive navigation | OR-S05 global/project context; OR-S15 tablet density and mobile non-drag action; overlays/keyboard safe areas | D-04/D-07/D-17 after separate authorization |
| Conditional permissions | OR-S07 through OR-S17 actions; OR-S18 aggregate visibility | G-04/G-05; do not finalize role eligibility |
| Conditional dates/status/auth | OR-S13 through OR-S18 dates; OR-S15 through OR-S17 transitions; OR-S01 through OR-S04/OR-S11 auth/recovery | G-07/G-08/G-13 and owner decisions |
| Conditional statistics | OR-S18 layout can be proposed conditionally; final metrics/filters/populated examples held | G-01/G-03/G-17 |
| Accessible feedback and motion | All records require ACCESS and static/reduced-motion alternatives; OR-S15 touch/keyboard alternatives | CR-06/CR-07/CR-08; later prototype/device/assistive-tech QA |
| Deferred/excluded | No extra workspace, deletion, role/invite management, scheduling or extended-productivity surfaces | F-17 through F-20; owner confirms exclusions |
| Start/approval gate | D-03 REVIEW is not owner scope acceptance; D-04 remains TODO | Separate owner instruction required; full Figma approval before frontend |

## Validation and disposition

Target coverage: 19/19 screen records with explicit required fields and cross-cutting modes, 15/15 reference-route dispositions, links to all included feature/API/gap dependencies, and explicit internal/deferred operation boundaries. The [product package](../product/D03-product-scope-requirements.md) provides all 20 feature records, 29 operation dispositions, 17 gap dispositions and 16 UX-finding mappings. Independent checks are recorded in the [D-03 report](../../.ai/reports/D03-product-scope-requirements.md).

No product scope or Figma design is approved by this matrix. Keep D-03 REVIEW pending owner review; do not start D-04 automatically.
