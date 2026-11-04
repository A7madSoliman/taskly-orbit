# Preliminary Design Backlog

Tasks are preliminary until Discovery (D-01–D-03) confirms scope. Screen titles are candidate areas, not supported feature or endpoint commitments. Reconcile tasks and dependencies after scope approval; record approved exclusions explicitly.

Statuses: TODO, IN_PROGRESS, BLOCKED, REVIEW, DONE. TODO means unstarted, not dependency-ready. D-00 is DONE following bootstrap validation; D-01 is DONE following owner acceptance; D-02 is DONE following owner acceptance of static audit completion only, recorded in `.ai/reports/D02-acceptance.md`. All 17 backend gaps remain open; unresolved capabilities are not approved product features. D-03 is DONE following conditional D03-v1 owner acceptance on 2026-10-28; unresolved decisions and backend gaps remain held. D-04 is DONE following bounded D04-v1 owner acceptance; terminology, mobile validation and behavior-specific holds remain. D-05 is DONE following bounded D05-v1 owner acceptance; D-06 is DONE following bounded D06-v1 owner acceptance of documentation and validation evidence only. D-07 is DONE following bounded D07-v1 owner acceptance. D-08 is DONE following bounded D08-v1 exploratory owner acceptance on 2026-11-02; that exploration approval did not select a direction. D-09 is DONE following explicit D09-v1 owner selection of Concept C — Balanced Hybrid with its existing light sidebar on 2026-11-02. D-10 is DONE following D10-v1 owner acceptance of reusable native foundations on 2026-11-02 after bounded final validation PASS. D-12 is DONE following D12-v1 owner acceptance on 2026-11-02 after bounded validation PASS. D-11 is DONE following D11-v1 owner acceptance of the reusable library after B11 PASS; D-13 is DONE following D13-v1 owner acceptance and bounded final QA PASS; D-14 through D-23 remain TODO. Full Figma approval precedes frontend development. Do not advance automatically to the next task.

## Foundation

### D-00 — Design Workspace Bootstrap
- Objective: Establish the design-first workspace.
- Deliverables: Agent rules, documentation, backlog, clipboard script and report.
- Dependencies: None
- Acceptance criteria: Required artifacts reviewed; clipboard equality verified.
- Status: DONE

### D-01 — Original Taskly Architecture & UX Audit
- Objective: Understand original architecture and UX as a read-only reference.
- Deliverables: Evidence-linked architecture/UX findings, lessons, gaps and questions.
- Dependencies: D-00
- Acceptance criteria: Findings cite inspected sources; assumptions distinguished; original unchanged.
- Status: DONE

### D-02 — Postman API and Backend Contract Audit
- Objective: Verify supplied backend contracts.
- Deliverables: Sanitized contract inventory, auth/permission/error evidence, capability gaps and traceability baseline.
- Dependencies: D-01; sanitized API/Postman inputs available
- Acceptance criteria: Every capability cites evidence; secrets removed; unknown endpoints remain questions.
- Status: DONE

### D-03 — Product Scope & Requirements Approval
- Objective: Confirm Discovery scope and boundaries.
- Deliverables: Requirements, roles, priorities, exclusions, open decisions and owner approval.
- Dependencies: D-01, D-02
- Acceptance criteria: Owner approves scope; unsupported requirements explicitly resolved or blocked.
- Status: DONE

## UX Architecture

### D-04 — Information Architecture & Navigation
- Objective: Organize approved product areas.
- Deliverables: [Information architecture](../../docs/ux/D04-information-architecture.md), [navigation specification](../../docs/ux/D04-navigation-specification.md) and [execution report](../reports/D04-information-architecture-navigation.md).
- Dependencies: D-03 conditional D03-v1 accepted; all six unresolved owner decisions and 17 OPEN backend gaps remain behavior-specific holds.
- Acceptance criteria: Documentation covers approved conditional scope, all 19 surfaces, navigation hierarchy, bilingual/responsive/accessibility/motion rules and qualified permission/deep-link behavior. Documentation validation passed; final owner navigation/glossary acceptance remains required.
- Status: DONE

### D-05 — User Journeys and Role/Permission Flows
- Objective: Describe supported user paths and access constraints.
- Deliverables: Journey maps, permission flows, denied-access paths and API references.
- Dependencies: D-02, D-03, D-04
- Acceptance criteria: Roles and flows trace to requirements and verified contracts; gaps flagged.
- Status: DONE

### D-06 — Screen Inventory and UI State Matrix
- Objective: Inventory required screens and states.
- Deliverables: [Screen/state matrix](../../docs/ux/D06-screen-state-matrix.md): 19 surfaces, 278 states and 10 shared patterns; [final validation](../reports/D06-final-validation.md).
- Dependencies: D-04, D-05
- Acceptance criteria: Documentation structural, representative semantic (58 states across all 19 surfaces), shared-pattern and D-07 planning handoff checks PASS. Existing evidence holds preserved; bounded D06-v1 owner acceptance recorded in the [acceptance report](../reports/D06-acceptance.md).
- Status: DONE

### D-07 — Responsive Wireframes
- Objective: Resolve responsive structure before styling.
- Deliverables: Editable mobile/desktop wireframes, breakpoint behavior and review decisions.
- Dependencies: D-06
- Acceptance criteria: Screen inventory covered; responsive and RTL/LTR structure reviewed.
- Status: DONE

## Visual Foundation

### D-08 — Hybrid Visual Concept Exploration
- Objective: Explore Calm & Premium plus Professional Workspace.
- Deliverables: Editable A/B/C concept and cross-surface studies, typography/color candidates and accessibility rationale in the [handoff](../../docs/handoff/D08-visual-concepts.md); [final acceptance report](../reports/D08-final-acceptance.md).
- Dependencies: D-03, D-07
- Acceptance criteria: Concepts fit approved scope and bilingual/responsive needs; approval not assumed.
- Acceptance: D08-v1 exploratory owner acceptance recorded on 2026-11-02 after bounded final validation PASS, under the owner's conditional closure authorization. No direction, final tokens, component library, production design or accessibility certification approved; all existing holds preserved.
- Status: DONE

### D-09 — Visual Direction Approval
- Objective: Select the visual direction.
- Deliverables: [Selected Concept C, rationale and D09-v1 owner approval](../../docs/handoff/D09-visual-direction.md); [approval report](../reports/D09-visual-approval.md).
- Dependencies: D-08
- Acceptance criteria: Explicit approval recorded before foundations are finalized.
- Acceptance: Concept C — Balanced Hybrid explicitly selected by the owner on 2026-11-02; existing light sidebar, original icons and bilingual layouts preserved. A/B remain historical alternatives. Dark Mode guidance only; no C-Navy Light variant, final tokens/components or production approval. D10–D23 remain TODO; all existing holds preserved.
- Status: DONE

### D-10 — Design Tokens, Typography and Color Modes
- Objective: Define reusable foundations.
- Deliverables: Native color/numeric variables, Inter/Cairo text styles, elevation styles and Light/Dark mappings in the [foundation handoff](../../docs/handoff/D10-design-foundation.md); [final acceptance report](../reports/D10-final-acceptance.md).
- Dependencies: D-09
- Acceptance criteria: Token use documented; Arabic/English typography and contrast reviewed.
- Acceptance: D10-v1 owner acceptance recorded on 2026-11-02 after final bounded validation PASS: 61 color primitives, 43 semantic colors with Light/Dark aliases, 20 text styles, 15 geometry variables and two elevation styles. Native bindings, bilingual examples and sampled contrast verified. Reusable foundations only; no final screen implementation, D11 library or accessibility certification. Existing holds preserved; D11–D23 remain TODO.
- Status: DONE

### D-11 — Editable Figma Component Library
- Objective: Build reusable editable components.
- Deliverables: Component library, variants, states, token bindings and usage guidance.
- Dependencies: D-06, D-10, D-12
- Acceptance criteria: Required states editable; reuse, bindings and accessibility reviewed.
- Acceptance: D11-v1 owner acceptance on 2026-11-03 after B11 bounded final QA PASS; reusable native library baseline and limitations are recorded in the [handoff](../../docs/handoff/D11-component-library.md). Final screens, frontend implementation, runtime behavior and WCAG certification are not approved. Existing holds remain.
- Status: DONE

### D-12 — English/Arabic RTL and Light/Dark Design Rules
- Objective: Specify direction, language and theme behavior.
- Deliverables: Mirroring, directional exceptions, mixed-content and theme rules.
- Dependencies: D-07, D-10
- Acceptance criteria: Arabic RTL/English LTR and both themes covered with concrete design examples.
- Acceptance: D12-v1 owner acceptance on 2026-11-02 after bounded validation PASS; four native bilingual Light/Dark examples and direction/theme rules are recorded in the [handoff](../../docs/handoff/D12-bilingual-theme-rules.md). D11 remains TODO; existing holds remain.
- Status: DONE

## Product Screens

### D-13 — Authentication
- Objective: Design approved authentication journeys.
- Deliverables: Responsive editable screens, state coverage, component instances and API mappings.
- Dependencies: D-02, D-06, D-07, D-11, D-12
- Acceptance criteria: Only verified behavior depicted; required language/theme and responsive variants reviewed.
- Status: DONE - D13-v1 owner acceptance after bounded final QA; see `docs/handoff/D13-authentication.md`.

### D-14 — Projects and Workspace
- Objective: Design approved project/workspace journeys.
- Deliverables: Responsive editable screens, navigation, states and API mappings.
- Dependencies: D-02, D-06, D-07, D-11, D-12
- Acceptance criteria: Scope and permissions verified; mobile/desktop, RTL/LTR and themes reviewed.
- Acceptance: D14-v1 owner acceptance on 2026-11-04 after bounded final validation PASS; OR-S06–OR-S08, API mappings and limitations are recorded in the [handoff](../../docs/handoff/D14-projects.md). Scope and permission evidence were reviewed; creation/edit rights remain conditional and unverified. Existing holds remain open. D15–D23 remain TODO.
- Status: DONE

### D-15 — Members and Invitations
- Objective: Design approved membership/invitation journeys.
- Deliverables: Responsive editable screens, permission states and contract mappings.
- Dependencies: D-02, D-06, D-07, D-11, D-12, D-14
- Acceptance criteria: Contract-supported flows only; required modes and role restrictions reviewed.
- Acceptance: D15-v1 owner acceptance on 2026-11-04 after bounded final QA PASS; OR-S09–OR-S11, API mappings and limitations are recorded in the [handoff](../../docs/handoff/D15-members-invitations.md). Invitation eligibility remains conditional and actual authorization unverified. Existing holds remain open. D16–D23 remain TODO.
- Status: DONE

### D-16 — Epics
- Objective: Design epic workflows if Discovery confirms scope.
- Deliverables: Responsive editable screens, states and requirement/API mappings.
- Dependencies: D-02, D-06, D-07, D-11, D-12, D-14
- Acceptance criteria: Scope confirmed; actions evidence-backed; all required modes reviewed.
- Status: TODO

### D-17 — Tasks and Kanban
- Objective: Design task/board workflows confirmed by Discovery.
- Deliverables: Responsive editable task/board screens, interaction specs and API mappings.
- Dependencies: D-02, D-06, D-07, D-11, D-12, D-14
- Acceptance criteria: Transitions and permissions verified; accessible interaction alternatives and all modes specified.
- Status: TODO

### D-18 — Statistics and Calendar
- Objective: Design views confirmed by scope and contracts.
- Deliverables: Responsive editable views, data definitions, states and API mappings.
- Dependencies: D-02, D-06, D-07, D-11, D-12, D-14
- Acceptance criteria: Metrics/calendar behavior evidence-backed; unsupported aggregation flagged; modes reviewed.
- Status: TODO

### D-19 — Loading, Empty, Error, Success and Permission States
- Objective: Complete consistent feedback across screens.
- Deliverables: Reusable feedback patterns, populated state matrix and recovery guidance.
- Dependencies: D-06, D-13, D-14, D-15, D-16, D-17, D-18
- Acceptance criteria: Applicable states covered; recovery traceable; accessibility and language/theme variants reviewed.
- Status: TODO

## Finalization

### D-20 — Motion Specification and Micro-interactions
- Objective: Define purposeful accessible feedback.
- Deliverables: Timings, easing, triggers, interaction specs and reduced-motion alternatives.
- Dependencies: D-13, D-14, D-15, D-16, D-17, D-18, D-19
- Acceptance criteria: Reduced-motion alternatives preserve information and functionality; accessibility reviewed.
- Status: TODO

### D-21 — Interactive Prototypes
- Objective: Demonstrate approved journeys in Figma.
- Deliverables: Linked prototypes, scenario coverage, entry points and review notes.
- Dependencies: D-19, D-20
- Acceptance criteria: Core journeys navigable; permission/states represented; simulated behavior labeled.
- Status: TODO

### D-22 — Responsive, RTL, Theme and Accessibility Design QA
- Objective: Review all required design variants.
- Deliverables: QA matrix, findings, fixes and residual issue decisions.
- Dependencies: D-21
- Acceptance criteria: Mobile/desktop, RTL/LTR, themes, accessibility and reduced motion checked; blockers resolved.
- Status: TODO

### D-23 — Figma Developer Handoff
- Objective: Package approved design for development.
- Deliverables: Figma links/versions, components/tokens, responsive/motion specs, API traceability and approval record.
- Dependencies: D-22; owner full Figma approval
- Acceptance criteria: Full approval recorded; approved scope/modes/states covered; API gaps documented; frontend gate explicitly released.
- Status: TODO
