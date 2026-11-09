# Taskly Orbit

A brand-new, independent, bilingual task management product.

Taskly Orbit is a reusable backend-agnostic UI/UX design system. The audited Supabase backend is an optional integration reference; implementation may use a new or another compatible backend. Design acceptance reviews editable Figma screens, responsive and bilingual/theme coverage, states and accessible alternatives. Backend authorization, RLS, constraints, API and status-policy compatibility, runtime behavior, security and persistence require separate validation against the chosen implementation. Full owner approval of Figma remains required before frontend development.

Current D17 design status: **DONE**. The owner explicitly approved B03 Task Details and D17-v1 complete design acceptance on 2026-11-09 after bounded B01/B02 acceptance and B03 visual QA PASS. This is design-only; backend, implementation, security and runtime validation remain separate. DEC-05/DEC-07 and G-04/G-08 remain unresolved integration requirements; see the [D17 handoff](docs/handoff/D17-tasks.md). D18 is **REVIEW**: B01 structural and B02 bounded visual acceptance are recorded; explicit D18-v1 complete owner design approval remains pending. See the [Statistics handoff](docs/handoff/D18-statistics.md). D19–D23 remain TODO.

Selected visual direction: **Concept C — Balanced Hybrid, with the existing light sidebar**.

This is a design-first documentation workspace. Frontend development waits for full Figma design approval recorded by the project owner. No application or dependencies are initialized.

## Current status — 2026-11-09

**D-10 is DONE** following D10-v1 owner acceptance and final bounded foundation validation PASS. Accepted: 61 color primitives, 43 semantic colors with native Light/Dark aliases, 20 Inter/Cairo text styles, 15 geometry variables and two elevation styles. Native bindings, English LTR/Arabic RTL examples and sampled contrast are verified. [Foundation and exact Figma references](docs/handoff/D10-design-foundation.md) · [acceptance report](.ai/reports/D10-final-acceptance.md).

D03–D09 approvals remain intact. Selected **Concept C — Balanced Hybrid** retains its existing light sidebar and original line icons. Accepted Dark uses distinct navy navigation and layered surfaces. A/B remain historical alternatives. D-12 is DONE following D12-v1 owner acceptance and bounded validation of four bilingual Light/Dark examples; see the [rules handoff](docs/handoff/D12-bilingual-theme-rules.md). **D-11 is DONE:** the owner accepted D11-v1 as the reusable native component-library baseline after B11 final QA PASS; see the [component handoff](docs/handoff/D11-component-library.md). **D-13 is DONE:** the owner accepted D13-v1 authentication designs after bounded final QA; see the [authentication handoff](docs/handoff/D13-authentication.md). **D-14 is DONE:** D14-v1 Projects and Workspace designs were owner accepted after bounded final validation; see the [projects handoff](docs/handoff/D14-projects.md). **D-15 is DONE:** D15-v1 Members and Invitations designs were owner accepted after bounded final QA; see the [members handoff](docs/handoff/D15-members-invitations.md). **D-16 is DONE:** D16-v1 Epics designs were owner accepted after bounded final QA; see the [epics handoff](docs/handoff/D16-epics.md). D-17 is DONE for design acceptance; D-18 is REVIEW pending explicit final owner design approval; D-19 through D-23 remain TODO. Every subsequent design batch must validate English LTR and Arabic RTL together. These bounded acceptances do not approve the full product design, frontend implementation, runtime behavior or WCAG certification. DEC-05/06/07/08/11/12 remain unresolved, G-01–G-17 OPEN, F-17–F-20 deferred and Statistics conditional under G-17. This current status supersedes earlier progress statements retained below.

## Structure
- `AGENTS.md`: Codex-first Plan → Execute workflow, design gates, and security rules.
- `docs/product/`: Discovery, requirements, scope, and approvals.
- `docs/api/`: sanitized backend evidence and API-to-screen traceability.
- `docs/ux/`: architecture, journeys, screen/state inventory, and wireframes.
- `docs/design-system/`: visual direction, tokens, components, bilingual/theme rules, and motion.
- `docs/handoff/`: approvals, QA, prototypes, and developer handoff.
- `references/`: sanitized reference links and notes; original Taskly stays separate and read-only.
- `.ai/tasks/DESIGN_BACKLOG.md`: preliminary D-00–D-23 backlog.
- `.ai/reports/`: task reports and validation evidence.
- `scripts/copy-report.ps1`: copy a final report and verify exact clipboard equality.

## Workflow
Discovery confirms scope. Designs must trace backend-dependent behavior to verified API evidence. Figma is the source of truth, using reusable editable components and tokens. Design mobile and desktop deliberately, including Arabic RTL, English LTR, light/dark themes, accessible motion, and reduced-motion alternatives. See `AGENTS.md` for all gates.

Codex owns architectural and final decisions, subject to project-owner requirements and design approval. The project owner chooses Plan or Execute mode.

### PLAN MODE
- Analyze requirements and available evidence; inspect API contracts and existing references.
- Identify UX issues, risks, and unknowns; propose architecture and design alternatives.
- Prepare task breakdowns and acceptance criteria.
- Remain read-only: no file modifications. Present findings in the conversation.

### EXECUTE MODE
- Execute only the selected, clearly scoped task and follow the approved plan when one exists.
- Review changes independently, run appropriate validation, and record results in a final report.

### USER CONTROL
- Significant tasks should be planned before execution; small, clearly scoped changes may execute directly when requested.
- Do not switch from planning to execution without owner direction or automatically advance to the next task.
- Do not commit or push without authorization.

Review all meaningful changes and validate appropriately. Do not invent product or backend behavior. Historical reports preserve prior evidence; current workflow is governed by `AGENTS.md`. The original D-00 report remains unchanged; its workflow statements are superseded by `.ai/reports/D00-workflow-correction.md`.

D-01 — Original Taskly Architecture & UX Audit is DONE following project-owner acceptance. Closure is recorded in `.ai/reports/D01-acceptance.md`; the audit deliverables retain their historical review state unchanged. D-02 is DONE following project-owner acceptance of static audit completion only, recorded in `.ai/reports/D02-acceptance.md`. See `docs/api/D02-api-backend-contract-audit.md` and `docs/ux/D02-ui-action-api-mapping.md`; their historical REVIEW wording and all earlier reports remain unchanged. All 17 backend gaps remain open; unresolved capabilities are not approved product features. D-03 is DONE following conditional owner acceptance on 2026-10-28: `docs/product/D03-product-scope-requirements.md` and `docs/ux/D03-screen-scope-matrix.md` propose scope and design requirements; conditional D03-v1 scope is approved; backend-dependent behavior remains held. Planning preferences are preserved, date policy remains unresolved, and conditional/deferred capabilities are not approved features. D-04 remains TODO and must not start automatically. Live backend behavior and Figma connectivity have not been validated.

Copy a finalized report in PowerShell:

```powershell
& ./scripts/copy-report.ps1 .ai/reports/D00-design-workspace-bootstrap.md
```

No credentials, tokens, email addresses, or API secrets belong in reports or committed reference files. Sanitize uploaded API samples before storing or sharing.

## D-03 owner acceptance

Owner approved conditional D03-v1 on 2026-10-28. D-03 is DONE. Approved: DEC-01, DEC-02, DEC-03, DEC-04, DEC-09, DEC-10, DEC-13, DEC-14, DEC-15, DEC-16. DEC-05, DEC-06, DEC-07, DEC-08, DEC-11 and DEC-12 remain unresolved. All 17 backend gaps remain OPEN. This approves conditional scope, not backend guarantees or final Figma design. Bounded D-04 planning is allowed but not started here. Figma and frontend implementation have not started.

## Backend-Aware, Frontend-Focused

Taskly Orbit is a frontend-focused training and portfolio project.
- Reuse the existing Supabase backend contract; prioritize frontend architecture and UX quality.
- Do not propose new backend endpoints, tables, migrations or RPCs by default.
- Treat missing backend evidence as a documented design constraint, not an automatic new project.
- Continue independent design wherever safe; hold only behavior affected by unresolved backend evidence.
- If verification becomes necessary, propose the smallest safe read-only check.
- Explain manual backend steps plainly without assuming backend expertise.
- Never expose, log or commit secrets. Do not claim production authorization is verified without appropriate evidence.

## D-04 bounded owner acceptance

D-04 is DONE: D04-v1 IA/navigation baseline accepted. See .ai/reports/D04-acceptance.md. Earlier progress statements are superseded by this record. Exact bilingual terminology and control placement remain reviewable; mobile navigation requires D-07/D-21 validation. All six unresolved decisions, 17 OPEN gaps and deferred F-17 through F-20 are preserved. D-05 through D-23 remain TODO. No Figma or frontend implementation started.

## D-05 review readiness

D-05 is REVIEW pending owner acceptance. Its rebuilt interaction handoff is validated for design-planning input, not approved D-06 work or verified backend behavior. D-06 through D-23 remain TODO; all six unresolved decisions and 17 OPEN backend gaps remain held. This progress record supersedes earlier D-05 status statements.

## D-05 bounded owner acceptance

D-05 is DONE: the project owner accepted D05-v1 as the bounded User Journeys and Interaction Flows documentation baseline. This includes 18 individually reviewed journeys, 240 structurally traceable steps, shared patterns, the design-planning handoff and representative independent semantic review. This record supersedes earlier D-05 progress statements. D-06 through D-23 remain TODO; the six unresolved decisions, 17 OPEN gaps and F-17 through F-20 deferrals remain. Acceptance is not live backend verification, final permission or status policy, accessibility certification or Figma approval.

## D-06 review readiness

D-06 is REVIEW pending owner acceptance. The [screen/state matrix](docs/ux/D06-screen-state-matrix.md) contains 19 surfaces, 278 unique states and 10 shared patterns. Final documentation checks passed: structural, representative semantic review of 58 states across all 19 surfaces, shared-pattern consistency and D-07 planning handoff readiness. See the [final report](.ai/reports/D06-final-validation.md) for scope and limitations. This record supersedes earlier D-06 progress statements; it is not D-06 DONE, Figma approval, live backend verification or accessibility certification. D-07 through D-23 remain TODO and are not started. All six unresolved decisions, 17 OPEN gaps and F-17–F-20 deferrals remain; populated Statistics visuals stay conditional under G-17.

## D-06 bounded owner acceptance

D-06 is DONE: the project owner accepted D06-v1 as the bounded Screen Inventory & UI State Matrix documentation baseline on 2026-10-28. Accepted: 19 surfaces, 278 structurally validated states, prior bounded per-surface reviews, final representative semantic review of 58 states, 10 shared patterns, responsive/accessibility guidance, conditional holds and the D-07 planning handoff. See the [acceptance report](.ai/reports/D06-acceptance.md). This record supersedes earlier D-06 progress statements. It is documentation approval only: no full renewed 278-state semantic re-audit, backend runtime verification, permission/status policy approval, finalized Statistics semantics, Figma validation, WCAG certification or frontend approval. Six decisions remain unresolved, G-01–G-17 stay OPEN and F-17–F-20 stay deferred. D-07 through D-23 remain TODO; no D-07 work has started.

## D-07 wireframe review readiness

D-07 is **REVIEW**, pending separate owner visual acceptance. B01–B05-B are accepted as bounded low-fidelity baselines. The [Figma coverage index](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=60-2) has exactly 19 unique surfaces and 95 verified referenced node IDs. Representative desktop, tablet, mobile, English LTR, Arabic RTL and interaction renders passed the bounded final reconciliation; see the [handoff index](docs/handoff/D07-wireframe-index.md) and [validation report](.ai/reports/D07-final-validation.md) for sampling and limits. This supersedes earlier D-07 TODO/no-Figma progress text. It is not D-07 DONE, final visual design approval, prototype validation or accessibility certification. DEC-05/06/07/08/11/12 remain unresolved, G-01–G-17 OPEN, F-17–F-20 deferred, and Statistics conditional under G-17. D-08 through D-23 remain TODO; no frontend work has started.

## D-07 bounded owner acceptance

D-07 is DONE following owner acceptance of D07-v1 as the bounded low-fidelity wireframe baseline on 2026-10-29. The [handoff index](docs/handoff/D07-wireframe-index.md) records scope, [Figma coverage index](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=60-2), evidence and limitations; the [acceptance report](.ai/reports/D07-acceptance.md) records closure. This supersedes earlier D-07 status statements. Final visual design, prototype, accessibility and frontend implementation are not approved. DEC-05/06/07/08/11/12 remain unresolved, G-01–G-17 OPEN, F-17–F-20 deferred and populated Statistics conditional under G-17. D-08 through D-23 remain TODO.
