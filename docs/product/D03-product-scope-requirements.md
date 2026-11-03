# D-03 — Product Scope & Requirements

Status: DONE — conditional D03-v1 accepted by owner, 2026-10-28.
Date: 2026-10-28. Proposal version: D03-v1.

## Conditional owner acceptance — 2026-10-28

Owner approved conditional D03-v1 on 2026-10-28. D-03 is DONE. Approved: DEC-01, DEC-02, DEC-03, DEC-04, DEC-09, DEC-10, DEC-13, DEC-14, DEC-15, DEC-16. DEC-05, DEC-06, DEC-07, DEC-08, DEC-11 and DEC-12 remain unresolved. All 17 backend gaps remain OPEN. This approves conditional scope, not backend guarantees or final Figma design. Bounded D-04 planning is allowed but not started here. Figma and frontend implementation have not started.

Proposal-era pending-scope statements below are superseded by this acceptance. Feature records, exclusions and behavior-specific holds remain intact. DEC-13 approves naming principles only; DEC-14 approves safety principles only; detailed terminology and reconciliation remain conditional.

## Authority and evidence baseline

Execution of the documentation plan was authorized in the conversation. That authorization is not product-scope approval. D-01/D-02 acceptance confirms completed static audits only. Planning preferences are preserved below without upgrading them to final decisions. All 17 backend gaps remain OPEN. This document is a proposal for owner review, not an implementation contract.

- [Agent instructions](../../AGENTS.md) and [backlog](../../.ai/tasks/DESIGN_BACKLOG.md).
- [D-01 architecture and UX audit](D01-architecture-ux-audit.md), [D-01 screen inventory](../ux/D01-screen-interaction-inventory.md) and [D-01 acceptance](../../.ai/reports/D01-acceptance.md).
- [D-02 API audit](../api/D02-api-backend-contract-audit.md), [D-02 action mapping](../ux/D02-ui-action-api-mapping.md) and [D-02 acceptance](../../.ai/reports/D02-acceptance.md).
- [D-02 completion validation](../../.ai/reports/D02-api-audit-completion.md); [D-03 screen scope](../ux/D03-screen-scope-matrix.md).
- Audited reference revision: `06e216366f57b80e7db0890efdc0e605eab68be1`. D-03 consumes accepted evidence; it does not re-audit the repository or backend. No live backend requests, new source retrieval or collection script execution.
- D-02 reconciles 23 collection requests and 26 Next.js exported method/path pairs into 29 operation records. Browser-facing and upstream interfaces remain distinct; no new API/interface/schema is specified here.

## Product vision and audience

Taskly Orbit should help small project teams understand their work, coordinate responsibilities and move tasks forward through a calm, professional bilingual interface. It is a new, independent task and project management product. Visual direction: **Hybrid — Calm & Premium + Professional Workspace**.

### Preserved planning selections

| Topic | Planning selection | Approval boundary |
|---|---|---|
| Audience | Small project teams | Selected planning basis; complete scope still awaits owner review |
| Workspace | Navigation and project context only | No new workspace/organization entity or membership model |
| Editing | Explicit field-level Save/Cancel | No implicit atomic multi-field epic save or new endpoint |
| Statistics/calendar | Conditional modules | Metric definitions and populated designs remain held |
| Date policy | Unresolved, explicitly kept open | No unified past-date, overdue-edit or timezone policy invented |

## Goals, priorities and boundaries

- **P0:** coherent project context; project/member/epic/task journeys; accessible authentication/recovery; predictable field editing and feedback; deliberate language/theme/viewport coverage.
- **P1:** conditional read-only statistics/calendar summaries with independent section recovery and verified scope labels before final design approval.
- **Core candidates:** F-01, F-03, F-04, F-05, F-06, F-08, F-10; action eligibility and response behavior still qualified.
- **Conditional core:** F-02, F-07, F-09, F-11, F-12. These support complete journey proposals, with blocked branches kept visible.
- **Conditional secondary:** F-13, F-14. **Cross-cutting core:** F-15, F-16. **Deferred:** F-17, F-18, F-19, F-20.
- **Backend-supported candidate capabilities:** source-observed auth/session, projects, member reads, send/accept invitations, epics, tasks/status updates and read statistics. “Supported” never means independently verified deployed behavior.
- **Frontend-only UX enhancements:** navigation consistency, explicit field editing, feedback/recovery, accessible controls, responsive composition, language/theme controls. These add no backend capability; defaults and preference retention remain undecided.
- **No execution beyond documentation:** no Figma generation, frontend, dependencies, Next.js setup, Original Taskly changes, backend requests/mutations, commits or pushes. Do not start D-04 automatically.

## Classification and traceability rules

| Term | Meaning in this proposal |
|---|---|
| Supported | An action/interface is evidenced in inspected source, or a labeled frontend/design requirement is grounded in project gates; not a live guarantee |
| Conditional | Missing evidence, conflicting contracts or an owner decision prevents unconditional design commitment |
| Unsupported | No sufficient interface established in audited evidence; not proof of absence across the whole backend |
| DOC-REQUEST / H / F / T / U | Preserve D-02 distinctions: request example / handler behavior / frontend assumption / mocked test expectation / unverified |
| Core candidate | Proposed initial product scope; final owner approval pending |
| P0 / P1 / Deferred | Essential journey/design requirement / secondary conditional capability / excluded from initial proposed scope |

Feature support labels summarize source coverage, not every branch or role. Every mutation and permission claim must retain its operation-specific qualifications. G-01 applies across all API-backed features; G-04 across project-scoped authorization. Do not convert an enum into a transition policy or a response schema expectation into a deployed guarantee.

## Product Feature Matrix

| Feature | Area | Proposed scope | Support | Priority |
|---|---|---|---|---|
| [F-01](#f-01) | Authentication | Core candidate | Supported | P0 |
| [F-02](#f-02) | Recovery | Conditional core | Conditional | P0 |
| [F-03](#f-03) | Workspace/navigation | Core candidate | Supported | P0 |
| [F-04](#f-04) | Projects | Core candidate | Supported | P0 |
| [F-05](#f-05) | Project editing | Core candidate | Supported | P0 |
| [F-06](#f-06) | Members | Core candidate | Supported | P0 |
| [F-07](#f-07) | Invitations | Conditional core | Conditional | P0 |
| [F-08](#f-08) | Epics | Core candidate | Supported | P0 |
| [F-09](#f-09) | Epic editing | Conditional core | Conditional | P0 |
| [F-10](#f-10) | Tasks | Core candidate | Supported | P0 |
| [F-11](#f-11) | Task editing | Conditional core | Conditional | P0 |
| [F-12](#f-12) | Kanban | Conditional core | Conditional | P0 |
| [F-13](#f-13) | Statistics | Conditional secondary | Conditional | P1 |
| [F-14](#f-14) | Calendar summary | Conditional secondary | Conditional | P1 |
| [F-15](#f-15) | Feedback and permissions | Cross-cutting core | Supported | P0 |
| [F-16](#f-16) | Language, appearance and accessibility | Cross-cutting core | Supported | P0 |
| [F-17](#f-17) | Deletion | Deferred | Conditional | Deferred |
| [F-18](#f-18) | Invitation/role administration | Deferred | Unsupported | Deferred |
| [F-19](#f-19) | Separate workspaces | Deferred | Unsupported | Deferred |
| [F-20](#f-20) | Extended productivity | Deferred | Unsupported | Deferred |

### F-01

**Authentication**

- **User goal:** Create an account and access the product.
- **Core user actions:** Sign up; sign in; choose session persistence; restore a session; sign out.
- **Proposed scope / support / UX priority:** Core candidate / Supported / P0.
- **API references:** [OP-01](../api/D02-api-backend-contract-audit.md#op-01), [OP-02](../api/D02-api-backend-contract-audit.md#op-02), [OP-05](../api/D02-api-backend-contract-audit.md#op-05), [OP-07](../api/D02-api-backend-contract-audit.md#op-07).
- **Evidence and backend dependencies:** Auth forms and cookie/session handlers are source evidence; signup result and remember choice do not establish live confirmation or expiry policy.
- **Screen references:** [OR-S01](../ux/D03-screen-scope-matrix.md#or-s01), [OR-S02](../ux/D03-screen-scope-matrix.md#or-s02), [OR-S05](../ux/D03-screen-scope-matrix.md#or-s05).
- **Relevant unresolved gaps:** [G-01](../api/D02-api-backend-contract-audit.md#g-01), [G-13](../api/D02-api-backend-contract-audit.md#g-13). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-02

**Recovery**

- **User goal:** Recover access safely.
- **Core user actions:** Request recovery; validate context; set a new password.
- **Proposed scope / support / UX priority:** Conditional core / Conditional / P0.
- **API references:** [OP-04](../api/D02-api-backend-contract-audit.md#op-04), [OP-06](../api/D02-api-backend-contract-audit.md#op-06), [OP-25](../api/D02-api-backend-contract-audit.md#op-25), [OP-26](../api/D02-api-backend-contract-audit.md#op-26).
- **Evidence and backend dependencies:** Recovery handlers and frontend flow exist; delivery, redirects, confirmation and recovery-only provenance remain unverified.
- **Screen references:** [OR-S03](../ux/D03-screen-scope-matrix.md#or-s03), [OR-S04](../ux/D03-screen-scope-matrix.md#or-s04).
- **Relevant unresolved gaps:** [G-01](../api/D02-api-backend-contract-audit.md#g-01), [G-13](../api/D02-api-backend-contract-audit.md#g-13). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-03

**Workspace/navigation**

- **User goal:** Find work and understand current project context.
- **Core user actions:** Navigate global/project destinations; identify context; restore session; sign out.
- **Proposed scope / support / UX priority:** Core candidate / Supported / P0.
- **API references:** [OP-03](../api/D02-api-backend-contract-audit.md#op-03), [OP-05](../api/D02-api-backend-contract-audit.md#op-05), [OP-07](../api/D02-api-backend-contract-audit.md#op-07), [OP-08](../api/D02-api-backend-contract-audit.md#op-08), [OP-24](../api/D02-api-backend-contract-audit.md#op-24).
- **Evidence and backend dependencies:** Reference shared shell and context reads support navigation; UX improvements are frontend proposals. OP-03 is an internal verification dependency, not an exported profile endpoint.
- **Screen references:** [OR-S05](../ux/D03-screen-scope-matrix.md#or-s05), [OR-S06](../ux/D03-screen-scope-matrix.md#or-s06), [OR-S08](../ux/D03-screen-scope-matrix.md#or-s08).
- **Relevant unresolved gaps:** [G-03](../api/D02-api-backend-contract-audit.md#g-03), [G-10](../api/D02-api-backend-contract-audit.md#g-10), [G-14](../api/D02-api-backend-contract-audit.md#g-14). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-04

**Projects**

- **User goal:** Find and open a project.
- **Core user actions:** Browse projects; load additional results; open project details.
- **Proposed scope / support / UX priority:** Core candidate / Supported / P0.
- **API references:** [OP-08](../api/D02-api-backend-contract-audit.md#op-08), [OP-24](../api/D02-api-backend-contract-audit.md#op-24).
- **Evidence and backend dependencies:** Source list/detail handlers establish projections and paging expectations; canonical IDs, exact-count behavior and live visibility remain qualified.
- **Screen references:** [OR-S06](../ux/D03-screen-scope-matrix.md#or-s06), [OR-S08](../ux/D03-screen-scope-matrix.md#or-s08).
- **Relevant unresolved gaps:** [G-01](../api/D02-api-backend-contract-audit.md#g-01), [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-10](../api/D02-api-backend-contract-audit.md#g-10), [G-11](../api/D02-api-backend-contract-audit.md#g-11). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-05

**Project editing**

- **User goal:** Create and maintain project information.
- **Core user actions:** Create project; inspect and explicitly save name/description changes.
- **Proposed scope / support / UX priority:** Core candidate / Supported / P0.
- **API references:** [OP-09](../api/D02-api-backend-contract-audit.md#op-09), [OP-10](../api/D02-api-backend-contract-audit.md#op-10), [OP-24](../api/D02-api-backend-contract-audit.md#op-24).
- **Evidence and backend dependencies:** Browser creation uses title while edit uses name. Update accepts name/description together; field-level UX may need the other current field in its request. No new endpoint or atomic guarantee is proposed.
- **Screen references:** [OR-S07](../ux/D03-screen-scope-matrix.md#or-s07), [OR-S08](../ux/D03-screen-scope-matrix.md#or-s08).
- **Relevant unresolved gaps:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-09](../api/D02-api-backend-contract-audit.md#g-09), [G-10](../api/D02-api-backend-contract-audit.md#g-10). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-06

**Members**

- **User goal:** Understand project participants.
- **Core user actions:** Read member list and evidenced role information.
- **Proposed scope / support / UX priority:** Core candidate / Supported / P0.
- **API references:** [OP-11](../api/D02-api-backend-contract-audit.md#op-11).
- **Evidence and backend dependencies:** Member projection is evidenced; membership IDs differ from user IDs. Empty membership reachability and creator membership invariants are unknown.
- **Screen references:** [OR-S09](../ux/D03-screen-scope-matrix.md#or-s09).
- **Relevant unresolved gaps:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-05](../api/D02-api-backend-contract-audit.md#g-05), [G-10](../api/D02-api-backend-contract-audit.md#g-10), [G-15](../api/D02-api-backend-contract-audit.md#g-15). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-07

**Invitations**

- **User goal:** Invite someone and join through an invitation.
- **Core user actions:** Submit invitation; authenticate/return if necessary; accept invitation.
- **Proposed scope / support / UX priority:** Conditional core / Conditional / P0.
- **API references:** [OP-12](../api/D02-api-backend-contract-audit.md#op-12), [OP-13](../api/D02-api-backend-contract-audit.md#op-13), [OP-02](../api/D02-api-backend-contract-audit.md#op-02), [OP-05](../api/D02-api-backend-contract-audit.md#op-05).
- **Evidence and backend dependencies:** Send/accept handlers exist; delivery, eligibility, expiry, role assignment and destination availability need evidence. No pending-invitation management is implied.
- **Screen references:** [OR-S10](../ux/D03-screen-scope-matrix.md#or-s10), [OR-S11](../ux/D03-screen-scope-matrix.md#or-s11), [OR-S01](../ux/D03-screen-scope-matrix.md#or-s01).
- **Relevant unresolved gaps:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-05](../api/D02-api-backend-contract-audit.md#g-05), [G-09](../api/D02-api-backend-contract-audit.md#g-09), [G-12](../api/D02-api-backend-contract-audit.md#g-12), [G-13](../api/D02-api-backend-contract-audit.md#g-13). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-08

**Epics**

- **User goal:** Inspect larger work groupings.
- **Core user actions:** Browse/search epics; inspect an epic and its associated tasks.
- **Proposed scope / support / UX priority:** Core candidate / Supported / P0.
- **API references:** [OP-14](../api/D02-api-backend-contract-audit.md#op-14), [OP-16](../api/D02-api-backend-contract-audit.md#op-16), [OP-20](../api/D02-api-backend-contract-audit.md#op-20).
- **Evidence and backend dependencies:** Epic views and all-epic-task retrieval are source supported. Server-side task page assembly does not imply an incremental browser contract.
- **Screen references:** [OR-S12](../ux/D03-screen-scope-matrix.md#or-s12), [OR-S14](../ux/D03-screen-scope-matrix.md#or-s14).
- **Relevant unresolved gaps:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-10](../api/D02-api-backend-contract-audit.md#g-10), [G-11](../api/D02-api-backend-contract-audit.md#g-11). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-09

**Epic editing**

- **User goal:** Create and update an epic.
- **Core user actions:** Create epic; explicitly save one changed field at a time; assign or clear supported values.
- **Proposed scope / support / UX priority:** Conditional core / Conditional / P0.
- **API references:** [OP-15](../api/D02-api-backend-contract-audit.md#op-15), [OP-17](../api/D02-api-backend-contract-audit.md#op-17), [OP-11](../api/D02-api-backend-contract-audit.md#op-11).
- **Evidence and backend dependencies:** Browser epic PATCH accepts exactly one field, unlike the two-field collection example. Final date validation and successful-write confirmation remain open.
- **Screen references:** [OR-S13](../ux/D03-screen-scope-matrix.md#or-s13), [OR-S14](../ux/D03-screen-scope-matrix.md#or-s14).
- **Relevant unresolved gaps:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-06](../api/D02-api-backend-contract-audit.md#g-06), [G-07](../api/D02-api-backend-contract-audit.md#g-07), [G-09](../api/D02-api-backend-contract-audit.md#g-09), [G-10](../api/D02-api-backend-contract-audit.md#g-10). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-10

**Tasks**

- **User goal:** Find and inspect work.
- **Core user actions:** Browse tasks; search titles; filter by evidenced status; open details.
- **Proposed scope / support / UX priority:** Core candidate / Supported / P0.
- **API references:** [OP-19](../api/D02-api-backend-contract-audit.md#op-19), [OP-29](../api/D02-api-backend-contract-audit.md#op-29).
- **Evidence and backend dependencies:** Scoped reads, search, status filtering and pagination are evidenced; unknown detail status strings and exact-total expectations require care.
- **Screen references:** [OR-S15](../ux/D03-screen-scope-matrix.md#or-s15), [OR-S17](../ux/D03-screen-scope-matrix.md#or-s17).
- **Relevant unresolved gaps:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-08](../api/D02-api-backend-contract-audit.md#g-08), [G-10](../api/D02-api-backend-contract-audit.md#g-10), [G-11](../api/D02-api-backend-contract-audit.md#g-11). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-11

**Task editing**

- **User goal:** Create and maintain actionable work.
- **Core user actions:** Create task; explicitly save supported fields; assign members/epics; clear nullable fields.
- **Proposed scope / support / UX priority:** Conditional core / Conditional / P0.
- **API references:** [OP-21](../api/D02-api-backend-contract-audit.md#op-21), [OP-22](../api/D02-api-backend-contract-audit.md#op-22), [OP-11](../api/D02-api-backend-contract-audit.md#op-11), [OP-14](../api/D02-api-backend-contract-audit.md#op-14).
- **Evidence and backend dependencies:** Create/update schemas and relation validation exist. Task PATCH verifies persisted changes; create may be uncertain after possible write. Date rules remain unresolved.
- **Screen references:** [OR-S16](../ux/D03-screen-scope-matrix.md#or-s16), [OR-S17](../ux/D03-screen-scope-matrix.md#or-s17).
- **Relevant unresolved gaps:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-07](../api/D02-api-backend-contract-audit.md#g-07), [G-08](../api/D02-api-backend-contract-audit.md#g-08), [G-09](../api/D02-api-backend-contract-audit.md#g-09), [G-10](../api/D02-api-backend-contract-audit.md#g-10). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-12

**Kanban**

- **User goal:** Understand work by status and request a move.
- **Core user actions:** Scan status groups; request a status change through pointer, touch or keyboard; cancel/reconcile.
- **Proposed scope / support / UX priority:** Conditional core / Conditional / P0.
- **API references:** [OP-19](../api/D02-api-backend-contract-audit.md#op-19), [OP-22](../api/D02-api-backend-contract-audit.md#op-22), [OP-29](../api/D02-api-backend-contract-audit.md#op-29).
- **Evidence and backend dependencies:** Reference movement and keyboard patterns are evidenced; eight constants are not a transition graph. No persisted within-column ordering or realtime guarantee.
- **Screen references:** [OR-S15](../ux/D03-screen-scope-matrix.md#or-s15), [OR-S17](../ux/D03-screen-scope-matrix.md#or-s17).
- **Relevant unresolved gaps:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-08](../api/D02-api-backend-contract-audit.md#g-08), [G-09](../api/D02-api-backend-contract-audit.md#g-09). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-13

**Statistics**

- **User goal:** Understand project-level task summaries.
- **Core user actions:** Select supported dates; read per-project counts; retry a failed section.
- **Proposed scope / support / UX priority:** Conditional secondary / Conditional / P1.
- **API references:** [OP-28](../api/D02-api-backend-contract-audit.md#op-28).
- **Evidence and backend dependencies:** Source-only RPC wrapper accepts dates, not calendar project/status filters. Metric formulas, all-project visibility and overdue semantics need authoritative evidence.
- **Screen references:** [OR-S18](../ux/D03-screen-scope-matrix.md#or-s18).
- **Relevant unresolved gaps:** [G-01](../api/D02-api-backend-contract-audit.md#g-01), [G-03](../api/D02-api-backend-contract-audit.md#g-03), [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-17](../api/D02-api-backend-contract-audit.md#g-17). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-14

**Calendar summary**

- **User goal:** Understand date-based task statistics.
- **Core user actions:** Choose supported range and calendar-specific project/status filters; inspect counts.
- **Proposed scope / support / UX priority:** Conditional secondary / Conditional / P1.
- **API references:** [OP-27](../api/D02-api-backend-contract-audit.md#op-27), [OP-08](../api/D02-api-backend-contract-audit.md#op-08).
- **Evidence and backend dependencies:** Source statistics handler supports bounded date ranges and filters; it is a read projection, not scheduling or event CRUD.
- **Screen references:** [OR-S18](../ux/D03-screen-scope-matrix.md#or-s18).
- **Relevant unresolved gaps:** [G-03](../api/D02-api-backend-contract-audit.md#g-03), [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-07](../api/D02-api-backend-contract-audit.md#g-07), [G-17](../api/D02-api-backend-contract-audit.md#g-17). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-15

**Feedback and permissions**

- **User goal:** Understand progress, outcomes and available actions.
- **Core user actions:** Read clear feedback; retry eligible reads; retain drafts; understand readonly/denied/unknown permission.
- **Proposed scope / support / UX priority:** Cross-cutting core / Supported / P0.
- **API references:** [OP-01](../api/D02-api-backend-contract-audit.md#op-01), [OP-02](../api/D02-api-backend-contract-audit.md#op-02), [OP-03](../api/D02-api-backend-contract-audit.md#op-03), [OP-04](../api/D02-api-backend-contract-audit.md#op-04), [OP-05](../api/D02-api-backend-contract-audit.md#op-05), [OP-06](../api/D02-api-backend-contract-audit.md#op-06), [OP-07](../api/D02-api-backend-contract-audit.md#op-07), [OP-08](../api/D02-api-backend-contract-audit.md#op-08), [OP-09](../api/D02-api-backend-contract-audit.md#op-09), [OP-10](../api/D02-api-backend-contract-audit.md#op-10), [OP-11](../api/D02-api-backend-contract-audit.md#op-11), [OP-12](../api/D02-api-backend-contract-audit.md#op-12), [OP-13](../api/D02-api-backend-contract-audit.md#op-13), [OP-14](../api/D02-api-backend-contract-audit.md#op-14), [OP-15](../api/D02-api-backend-contract-audit.md#op-15), [OP-16](../api/D02-api-backend-contract-audit.md#op-16), [OP-17](../api/D02-api-backend-contract-audit.md#op-17), [OP-18](../api/D02-api-backend-contract-audit.md#op-18), [OP-19](../api/D02-api-backend-contract-audit.md#op-19), [OP-20](../api/D02-api-backend-contract-audit.md#op-20), [OP-21](../api/D02-api-backend-contract-audit.md#op-21), [OP-22](../api/D02-api-backend-contract-audit.md#op-22), [OP-23](../api/D02-api-backend-contract-audit.md#op-23), [OP-24](../api/D02-api-backend-contract-audit.md#op-24), [OP-25](../api/D02-api-backend-contract-audit.md#op-25), [OP-26](../api/D02-api-backend-contract-audit.md#op-26), [OP-27](../api/D02-api-backend-contract-audit.md#op-27), [OP-28](../api/D02-api-backend-contract-audit.md#op-28), [OP-29](../api/D02-api-backend-contract-audit.md#op-29).
- **Evidence and backend dependencies:** Supported here denotes a frontend design requirement grounded in D-01/D-02, not already complete UI or a new permission backend. OP-18/OP-23 remain deferred with no committed deletion states.
- **Screen references:** [OR-S01](../ux/D03-screen-scope-matrix.md#or-s01), [OR-S02](../ux/D03-screen-scope-matrix.md#or-s02), [OR-S03](../ux/D03-screen-scope-matrix.md#or-s03), [OR-S04](../ux/D03-screen-scope-matrix.md#or-s04), [OR-S05](../ux/D03-screen-scope-matrix.md#or-s05), [OR-S06](../ux/D03-screen-scope-matrix.md#or-s06), [OR-S07](../ux/D03-screen-scope-matrix.md#or-s07), [OR-S08](../ux/D03-screen-scope-matrix.md#or-s08), [OR-S09](../ux/D03-screen-scope-matrix.md#or-s09), [OR-S10](../ux/D03-screen-scope-matrix.md#or-s10), [OR-S11](../ux/D03-screen-scope-matrix.md#or-s11), [OR-S12](../ux/D03-screen-scope-matrix.md#or-s12), [OR-S13](../ux/D03-screen-scope-matrix.md#or-s13), [OR-S14](../ux/D03-screen-scope-matrix.md#or-s14), [OR-S15](../ux/D03-screen-scope-matrix.md#or-s15), [OR-S16](../ux/D03-screen-scope-matrix.md#or-s16), [OR-S17](../ux/D03-screen-scope-matrix.md#or-s17), [OR-S18](../ux/D03-screen-scope-matrix.md#or-s18), [OR-S19](../ux/D03-screen-scope-matrix.md#or-s19).
- **Relevant unresolved gaps:** [G-04](../api/D02-api-backend-contract-audit.md#g-04), [G-05](../api/D02-api-backend-contract-audit.md#g-05), [G-09](../api/D02-api-backend-contract-audit.md#g-09), [G-15](../api/D02-api-backend-contract-audit.md#g-15), [G-16](../api/D02-api-backend-contract-audit.md#g-16). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-16

**Language, appearance and accessibility**

- **User goal:** Use the product across languages, themes, viewports and input methods.
- **Core user actions:** Choose interface language/theme; use accessible responsive controls.
- **Proposed scope / support / UX priority:** Cross-cutting core / Supported / P0.
- **API references:** None established.
- **Evidence and backend dependencies:** Mandatory design gates and frontend-only controls; no preference storage endpoint, cross-device sync or finalized default/retention policy is evidenced.
- **Screen references:** [OR-S01](../ux/D03-screen-scope-matrix.md#or-s01), [OR-S02](../ux/D03-screen-scope-matrix.md#or-s02), [OR-S03](../ux/D03-screen-scope-matrix.md#or-s03), [OR-S04](../ux/D03-screen-scope-matrix.md#or-s04), [OR-S05](../ux/D03-screen-scope-matrix.md#or-s05), [OR-S06](../ux/D03-screen-scope-matrix.md#or-s06), [OR-S07](../ux/D03-screen-scope-matrix.md#or-s07), [OR-S08](../ux/D03-screen-scope-matrix.md#or-s08), [OR-S09](../ux/D03-screen-scope-matrix.md#or-s09), [OR-S10](../ux/D03-screen-scope-matrix.md#or-s10), [OR-S11](../ux/D03-screen-scope-matrix.md#or-s11), [OR-S12](../ux/D03-screen-scope-matrix.md#or-s12), [OR-S13](../ux/D03-screen-scope-matrix.md#or-s13), [OR-S14](../ux/D03-screen-scope-matrix.md#or-s14), [OR-S15](../ux/D03-screen-scope-matrix.md#or-s15), [OR-S16](../ux/D03-screen-scope-matrix.md#or-s16), [OR-S17](../ux/D03-screen-scope-matrix.md#or-s17), [OR-S18](../ux/D03-screen-scope-matrix.md#or-s18), [OR-S19](../ux/D03-screen-scope-matrix.md#or-s19).
- **Relevant unresolved gaps:** [G-14](../api/D02-api-backend-contract-audit.md#g-14). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-17

**Deletion**

- **User goal:** Remove an epic or task if a future safe contract is established.
- **Core user actions:** Potential future delete/confirmation/recovery only after evidence and approval.
- **Proposed scope / support / UX priority:** Deferred / Conditional / Deferred.
- **API references:** [OP-18](../api/D02-api-backend-contract-audit.md#op-18), [OP-23](../api/D02-api-backend-contract-audit.md#op-23).
- **Evidence and backend dependencies:** Only collection requests exist; no browser handler/caller or safety contract. No deletion screen is in the 19-screen proposal.
- **Screen references:** No committed screen; deferred proposal.
- **Relevant unresolved gaps:** [G-02](../api/D02-api-backend-contract-audit.md#g-02). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-18

**Invitation/role administration**

- **User goal:** Potential future administration of invites and roles.
- **Core user actions:** Pending invitations; resend/revoke; select/change roles.
- **Proposed scope / support / UX priority:** Deferred / Unsupported / Deferred.
- **API references:** None established.
- **Evidence and backend dependencies:** No sufficient audited interface for these actions; send/accept does not imply administration. Unsupported refers only to available evidence.
- **Screen references:** No committed screen; deferred proposal.
- **Relevant unresolved gaps:** [G-05](../api/D02-api-backend-contract-audit.md#g-05), [G-12](../api/D02-api-backend-contract-audit.md#g-12), [G-14](../api/D02-api-backend-contract-audit.md#g-14). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-19

**Separate workspaces**

- **User goal:** Potential future organization-level work separation.
- **Core user actions:** Create/manage organizations or workspaces; switch; manage workspace members.
- **Proposed scope / support / UX priority:** Deferred / Unsupported / Deferred.
- **API references:** None established.
- **Evidence and backend dependencies:** No dedicated entity/interface established; planning selection limits workspace to navigation/project context.
- **Screen references:** No committed screen; deferred proposal.
- **Relevant unresolved gaps:** [G-14](../api/D02-api-backend-contract-audit.md#g-14). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

### F-20

**Extended productivity**

- **User goal:** Potential future advanced productivity.
- **Core user actions:** Scheduling writes; configurable workflow; persisted task ordering; comments; files; recurring tasks.
- **Proposed scope / support / UX priority:** Deferred / Unsupported / Deferred.
- **API references:** None established.
- **Evidence and backend dependencies:** None of these interfaces is sufficiently established by supplied evidence. Task status update and calendar statistics do not imply these additions.
- **Screen references:** No committed screen; deferred proposal.
- **Relevant unresolved gaps:** [G-08](../api/D02-api-backend-contract-audit.md#g-08), [G-14](../api/D02-api-backend-contract-audit.md#g-14). G-01 applies to every API-backed claim; G-04 also applies to project-scoped authorization.

## Complete API operation dispositions

Each of the 29 D-02 operations has one explicit disposition below. Direct collection alignment, handler-only and internal distinctions remain in the linked audit. This table does not merge upstream and browser payloads.

| Operation | Proposed disposition | Meaning / boundary | Features | Screens |
|---|---|---|---|---|
| [OP-01](../api/D02-api-backend-contract-audit.md#op-01) | Core candidate | Account creation | [F-01](#f-01) | [OR-S02](../ux/D03-screen-scope-matrix.md#or-s02) |
| [OP-02](../api/D02-api-backend-contract-audit.md#op-02) | Core candidate | Login and invitation authentication return | [F-01](#f-01), [F-07](#f-07) | [OR-S01](../ux/D03-screen-scope-matrix.md#or-s01), [OR-S11](../ux/D03-screen-scope-matrix.md#or-s11) |
| [OP-03](../api/D02-api-backend-contract-audit.md#op-03) | Internal dependency | User verification for shell/session; no exported user-profile route | [F-03](#f-03) | [OR-S05](../ux/D03-screen-scope-matrix.md#or-s05) |
| [OP-04](../api/D02-api-backend-contract-audit.md#op-04) | Conditional core | Recovery password update | [F-02](#f-02) | [OR-S04](../ux/D03-screen-scope-matrix.md#or-s04) |
| [OP-05](../api/D02-api-backend-contract-audit.md#op-05) | Internal dependency | Session restoration and invitation return; no independent screen | [F-01](#f-01), [F-03](#f-03), [F-07](#f-07) | [OR-S01](../ux/D03-screen-scope-matrix.md#or-s01), [OR-S05](../ux/D03-screen-scope-matrix.md#or-s05), [OR-S11](../ux/D03-screen-scope-matrix.md#or-s11) |
| [OP-06](../api/D02-api-backend-contract-audit.md#op-06) | Conditional core | Recovery request; no delivery promise | [F-02](#f-02) | [OR-S03](../ux/D03-screen-scope-matrix.md#or-s03) |
| [OP-07](../api/D02-api-backend-contract-audit.md#op-07) | Core candidate | Local logout; remote revocation not guaranteed | [F-01](#f-01), [F-03](#f-03) | [OR-S05](../ux/D03-screen-scope-matrix.md#or-s05) |
| [OP-08](../api/D02-api-backend-contract-audit.md#op-08) | Core candidate | Project list and context/filter options | [F-03](#f-03), [F-04](#f-04), [F-14](#f-14) | [OR-S05](../ux/D03-screen-scope-matrix.md#or-s05), [OR-S06](../ux/D03-screen-scope-matrix.md#or-s06), [OR-S18](../ux/D03-screen-scope-matrix.md#or-s18) |
| [OP-09](../api/D02-api-backend-contract-audit.md#op-09) | Core candidate | Project creation with uncertain-write state | [F-05](#f-05) | [OR-S07](../ux/D03-screen-scope-matrix.md#or-s07) |
| [OP-10](../api/D02-api-backend-contract-audit.md#op-10) | Core candidate | Project updates with qualified confirmation | [F-05](#f-05) | [OR-S08](../ux/D03-screen-scope-matrix.md#or-s08) |
| [OP-11](../api/D02-api-backend-contract-audit.md#op-11) | Core candidate / dependency | Member read and assignment option projections | [F-06](#f-06), [F-09](#f-09), [F-11](#f-11) | [OR-S09](../ux/D03-screen-scope-matrix.md#or-s09), [OR-S13](../ux/D03-screen-scope-matrix.md#or-s13), [OR-S14](../ux/D03-screen-scope-matrix.md#or-s14), [OR-S16](../ux/D03-screen-scope-matrix.md#or-s16), [OR-S17](../ux/D03-screen-scope-matrix.md#or-s17) |
| [OP-12](../api/D02-api-backend-contract-audit.md#op-12) | Conditional core | Send invitation; no invite management | [F-07](#f-07) | [OR-S10](../ux/D03-screen-scope-matrix.md#or-s10) |
| [OP-13](../api/D02-api-backend-contract-audit.md#op-13) | Conditional core | Accept invitation with optional destination | [F-07](#f-07) | [OR-S11](../ux/D03-screen-scope-matrix.md#or-s11) |
| [OP-14](../api/D02-api-backend-contract-audit.md#op-14) | Core candidate / dependency | Epic browse/search and task epic options | [F-08](#f-08), [F-11](#f-11) | [OR-S12](../ux/D03-screen-scope-matrix.md#or-s12), [OR-S16](../ux/D03-screen-scope-matrix.md#or-s16), [OR-S17](../ux/D03-screen-scope-matrix.md#or-s17) |
| [OP-15](../api/D02-api-backend-contract-audit.md#op-15) | Conditional core | Create epic; date and authorization holds | [F-09](#f-09) | [OR-S13](../ux/D03-screen-scope-matrix.md#or-s13) |
| [OP-16](../api/D02-api-backend-contract-audit.md#op-16) | Core candidate | Epic detail read | [F-08](#f-08) | [OR-S14](../ux/D03-screen-scope-matrix.md#or-s14) |
| [OP-17](../api/D02-api-backend-contract-audit.md#op-17) | Conditional core | Exactly one epic field per browser update | [F-09](#f-09) | [OR-S14](../ux/D03-screen-scope-matrix.md#or-s14) |
| [OP-18](../api/D02-api-backend-contract-audit.md#op-18) | Deferred | Collection-only epic deletion; no committed screen | [F-17](#f-17) | None; deferred |
| [OP-19](../api/D02-api-backend-contract-audit.md#op-19) | Core candidate | Task browse/search/status filter; board data | [F-10](#f-10), [F-12](#f-12) | [OR-S15](../ux/D03-screen-scope-matrix.md#or-s15) |
| [OP-20](../api/D02-api-backend-contract-audit.md#op-20) | Core candidate | Full epic-task read projection | [F-08](#f-08) | [OR-S14](../ux/D03-screen-scope-matrix.md#or-s14) |
| [OP-21](../api/D02-api-backend-contract-audit.md#op-21) | Conditional core | Task create, including entry from epic details through OR-S16 | [F-11](#f-11) | [OR-S16](../ux/D03-screen-scope-matrix.md#or-s16) |
| [OP-22](../api/D02-api-backend-contract-audit.md#op-22) | Conditional core | Explicit field update or status request; transition/date holds | [F-11](#f-11), [F-12](#f-12) | [OR-S15](../ux/D03-screen-scope-matrix.md#or-s15), [OR-S17](../ux/D03-screen-scope-matrix.md#or-s17) |
| [OP-23](../api/D02-api-backend-contract-audit.md#op-23) | Deferred | Collection-only task deletion; no committed screen | [F-17](#f-17) | None; deferred |
| [OP-24](../api/D02-api-backend-contract-audit.md#op-24) | Core candidate / dependency | Project detail/context read; source-only collection omission | [F-03](#f-03), [F-04](#f-04), [F-05](#f-05) | [OR-S05](../ux/D03-screen-scope-matrix.md#or-s05), [OR-S08](../ux/D03-screen-scope-matrix.md#or-s08) |
| [OP-25](../api/D02-api-backend-contract-audit.md#op-25) | Internal conditional dependency | Recovery bootstrap; source-only | [F-02](#f-02) | [OR-S04](../ux/D03-screen-scope-matrix.md#or-s04) |
| [OP-26](../api/D02-api-backend-contract-audit.md#op-26) | Internal conditional dependency | Recovery context check; source-only | [F-02](#f-02) | [OR-S04](../ux/D03-screen-scope-matrix.md#or-s04) |
| [OP-27](../api/D02-api-backend-contract-audit.md#op-27) | Conditional secondary | Calendar statistics read; no scheduling writes; source-only | [F-14](#f-14) | [OR-S18](../ux/D03-screen-scope-matrix.md#or-s18) |
| [OP-28](../api/D02-api-backend-contract-audit.md#op-28) | Conditional secondary | Date-scoped per-project statistics read; source-only | [F-13](#f-13) | [OR-S18](../ux/D03-screen-scope-matrix.md#or-s18) |
| [OP-29](../api/D02-api-backend-contract-audit.md#op-29) | Core candidate | Task details and separate edit eligibility; nested entry through OR-S17 | [F-10](#f-10), [F-12](#f-12) | [OR-S15](../ux/D03-screen-scope-matrix.md#or-s15), [OR-S17](../ux/D03-screen-scope-matrix.md#or-s17) |

## Data and backend dependencies

The seven [D-02 entity projections](../api/D02-api-backend-contract-audit.md#entity-relationship-inventory) inform design; they are not a new canonical schema or database ERD.

| Evidence entity | Design implication | Unresolved dependency |
|---|---|---|
| EN-01 User/session | Identity and restoration/recovery flow; never display credentials | G-13; live confirmation/expiry/provenance |
| EN-02 Project | Context and project-scoped actions | G-04/G-10; creator rights and canonical IDs |
| EN-03 Membership | Participants and assignment options use user IDs rather than membership-record IDs | G-05/G-10/G-15; creator membership and zero-member reachability |
| EN-04 Invitation | Send/accept journey may have no destination ID | G-12; eligibility, expiry, delivery and result |
| EN-05 Epic | Project grouping; optional assignee/deadline; associated tasks | G-06/G-07/G-10; field updates, dates and relation values |
| EN-06 Task | Project task; nullable epic/assignee/date/description; display code distinct from ID | G-07/G-08/G-09/G-10; dates, status transitions, confirmation and relations |
| EN-07 Aggregates | Read-only calendar/project summaries with different scopes | G-03/G-17; formulas, filters and all-project authorization |

Schema field requiredness remains in D-02, including required task-create keys whose optional content can be empty. Option-loading failures must not silently remove existing relationships. No foreign-key/cardinality/cascade guarantee is introduced.

### Source field and workflow constraints to carry forward

- Projects: creation uses browser title; editing uses name; optional description. The reference validates trimmed names at 3–100 characters and description at up to 500. These are source rules, not a new canonical backend contract.
- Epics: title, description, assignee and deadline are evidenced fields. Creation and editing have different title/date rules. Browser editing accepts exactly one field per request; do not submit the collection's two-field example unchanged.
- Tasks: title, description, epic, assignee, status and due date are the evidenced editable fields. Nullable clearing must match the operation; do not invent task title/description maxima absent from the audited schemas.
- Source status vocabulary: TO_DO, IN_PROGRESS, BLOCKED, IN_REVIEW, READY_FOR_QA, REOPENED, READY_FOR_PRODUCTION, DONE. Display translations are separate. This list establishes no allowed transition graph, initial default, custom workflow or ordering guarantee; unknown nonempty detail statuses remain possible.
- Statistics: source handlers enforce an inclusive 1–7-day range. Calendar statistics accept project/status filters; per-project statistics accept dates only. The product date policy and metric semantics remain undecided; no source rule is silently expanded.
- Authentication fields/settings and all validation details remain linked to D-02 operation/schema evidence. Confirmation requirements, live session behavior and recovery-only provenance are not independently verified.

## UX improvement requirements from D-01

All 16 findings are accounted for. Observed source behavior, documented limitations, hypotheses and positive patterns retain their D-01 classifications. These requirements do not claim reproduced usability defects or accessibility certification.

| Finding / evidence | Proposed requirement | Features | Representative screens | Priority / later validation |
|---|---|---|---|---|
| [UX-01 — Destination naming](D01-architecture-ux-audit.md#ux-01--destination-naming) | Consistent destination names; distinguish details from editing; do not imply scheduling with Planner. | [F-03](#f-03), [F-13](#f-13), [F-14](#f-14) | [OR-S05](../ux/D03-screen-scope-matrix.md#or-s05), [OR-S08](../ux/D03-screen-scope-matrix.md#or-s08), [OR-S18](../ux/D03-screen-scope-matrix.md#or-s18) | P0; D-04 glossary/navigation; later comprehension review |
| [UX-02 — Project-dependent mobile navigation](D01-architecture-ux-audit.md#ux-02--project-dependent-mobile-navigation) | Make global/project context and project selection discoverable at all sizes. | [F-03](#f-03) | [OR-S05](../ux/D03-screen-scope-matrix.md#or-s05), [OR-S06](../ux/D03-screen-scope-matrix.md#or-s06) | P0; D-04/D-05 navigation journeys and D-21 prototype |
| [UX-03 — English-specific foundations](D01-architecture-ux-audit.md#ux-03--english-specific-foundations) | Arabic-capable typography; logical layout; mixed text/number rules and localized copy. | [F-16](#f-16) | [OR-S19](../ux/D03-screen-scope-matrix.md#or-s19) | P0; D-10/D-12/D-22; applies to every screen |
| [UX-04 — One inspected token palette](D01-architecture-ux-audit.md#ux-04--one-inspected-token-palette) | Semantic light/dark tokens, focus and feedback variants; no contrast failure asserted. | [F-16](#f-16) | [OR-S19](../ux/D03-screen-scope-matrix.md#or-s19) | P0; D-10/D-12/D-22; all screens |
| [UX-05 — Different editing persistence](D01-architecture-ux-audit.md#ux-05--different-editing-persistence) | Consistent explicit field Save/Cancel; dirty/saving/confirmed/failed/uncertain and pending-close states. | [F-05](#f-05), [F-09](#f-09), [F-11](#f-11), [F-15](#f-15) | [OR-S08](../ux/D03-screen-scope-matrix.md#or-s08), [OR-S14](../ux/D03-screen-scope-matrix.md#or-s14), [OR-S17](../ux/D03-screen-scope-matrix.md#or-s17) | P0; D-16/D-17/D-19/D-21; DEC-03/DEC-14 and G-06/G-09 |
| [UX-06 — Incremental loading recovery](D01-architecture-ux-audit.md#ux-06--incremental-loading-recovery) | Keep loaded content and add explicit incremental retry without resetting scope. | [F-04](#f-04), [F-08](#f-08), [F-10](#f-10), [F-15](#f-15) | [OR-S06](../ux/D03-screen-scope-matrix.md#or-s06), [OR-S12](../ux/D03-screen-scope-matrix.md#or-s12), [OR-S15](../ux/D03-screen-scope-matrix.md#or-s15) | P0; D-06/D-19 and later failure injection; G-16 |
| [UX-07 — Members zero-result feedback](D01-architecture-ux-audit.md#ux-07--members-zero-result-feedback) | Specify alternatives for valid empty, restricted or inconsistent membership; no reachability assumption. | [F-06](#f-06), [F-15](#f-15) | [OR-S09](../ux/D03-screen-scope-matrix.md#or-s09) | P0; G-15 evidence before final branch; D-06/D-19 |
| [UX-08 — Input focus depends on consumers](D01-architecture-ux-audit.md#ux-08--input-focus-depends-on-consumers) | Reusable visible focus states in both themes. | [F-16](#f-16) | [OR-S19](../ux/D03-screen-scope-matrix.md#or-s19) | P0; D-11/D-22; every keyboard-operable screen |
| [UX-09 — Error associations differ](D01-architecture-ux-audit.md#ux-09--error-associations-differ) | Shared label/help/error relationships and submission announcements. | [F-15](#f-15), [F-16](#f-16) | [OR-S01](../ux/D03-screen-scope-matrix.md#or-s01), [OR-S07](../ux/D03-screen-scope-matrix.md#or-s07) | P0; D-11/D-22 and all forms; later assistive-technology testing |
| [UX-10 — Board density and tablet behavior](D01-architecture-ux-audit.md#ux-10--board-density-and-tablet-behavior) | Board overview/scroll cues, mobile list and deliberate intermediate-width composition. | [F-10](#f-10), [F-12](#f-12) | [OR-S15](../ux/D03-screen-scope-matrix.md#or-s15), [OR-S16](../ux/D03-screen-scope-matrix.md#or-s16) | P0; D-07/D-17/D-22 at boundary widths, zoom and long text |
| [UX-11 — Reduced-motion treatment varies](D01-architecture-ux-audit.md#ux-11--reduced-motion-treatment-varies) | Uniform static loading and reduced-motion overlay/confirmation alternatives. | [F-15](#f-15), [F-16](#f-16) | [OR-S05](../ux/D03-screen-scope-matrix.md#or-s05), [OR-S15](../ux/D03-screen-scope-matrix.md#or-s15), [OR-S18](../ux/D03-screen-scope-matrix.md#or-s18) | P0; D-20/D-22; applies to all motion |
| [UX-12 — Keyboard movement and focus handling](D01-architecture-ux-audit.md#ux-12--keyboard-movement-and-focus-handling) | Retain keyboard/non-drag moves, announcements and nested-overlay focus return. | [F-12](#f-12), [F-16](#f-16) | [OR-S05](../ux/D03-screen-scope-matrix.md#or-s05), [OR-S14](../ux/D03-screen-scope-matrix.md#or-s14), [OR-S15](../ux/D03-screen-scope-matrix.md#or-s15), [OR-S17](../ux/D03-screen-scope-matrix.md#or-s17) | P0; D-11/D-17/D-22; source tests are not certification |
| [UX-13 — Invitation visibility differs from helper rules](D01-architecture-ux-audit.md#ux-13--invitation-visibility-differs-from-helper-rules) | Align action visibility with approved rights without broadening creator/member permissions. | [F-06](#f-06), [F-07](#f-07) | [OR-S09](../ux/D03-screen-scope-matrix.md#or-s09), [OR-S10](../ux/D03-screen-scope-matrix.md#or-s10) | P0; G-04/G-05 evidence; D-05/D-15 |
| [UX-14 — Overdue metric time scope](D01-architecture-ux-audit.md#ux-14--overdue-metric-time-scope) | Verify definitions; label section scopes independently; no fabricated values or same-denominator assumption. | [F-13](#f-13), [F-14](#f-14) | [OR-S18](../ux/D03-screen-scope-matrix.md#or-s18) | P1; G-17 evidence before D-18 populated designs |
| [UX-15 — Independent section recovery](D01-architecture-ux-audit.md#ux-15--independent-section-recovery) | Retain useful statistics sections when another fails; section-specific retry. | [F-13](#f-13), [F-14](#f-14), [F-15](#f-15) | [OR-S18](../ux/D03-screen-scope-matrix.md#or-s18) | P1; D-18/D-19 and later independent failure injection |
| [UX-16 — Touch scrolling versus dragging](D01-architecture-ux-audit.md#ux-16--touch-scrolling-versus-dragging) | Preserve nondrag status action; explicit pickup/cancel/uncertain feedback and scrolling priority. | [F-12](#f-12) | [OR-S15](../ux/D03-screen-scope-matrix.md#or-s15) | P0; D-17/D-21/D-22 real-device validation; no reproduced defect claimed |

The finding links must resolve to the exact historical headings; source paths/line evidence and original classifications remain in D-01. Positive keyboard/focus and independent-section recovery patterns are retained without copying implementation.

## Cross-cutting design requirements

| Requirement | Required scope and design implication | Approval/evidence boundary |
|---|---|---|
| CR-01 Language/direction | English LTR and Arabic RTL on all 19 screens; consistent bilingual terminology, Arabic-capable typography, logical mirroring and mixed-script isolation; raw enum/ID values remain distinct from translated labels | DEC-13 glossary approval; date/numeral/calendar conventions remain DEC-12 |
| CR-02 Semantic themes | Editable tokens for surface/text/border/focus/status/success/warning/error/disabled/readonly in light and dark; semantic variants and readable charts/feedback | Both themes reviewed independently; no inherited contrast compliance claim |
| CR-03 Responsive navigation | Deliberate desktop, tablet and mobile; global versus project context, long text, safe areas, software keyboard and zoom; tablet not an accidental breakpoint crossover | D-04/D-07 decisions later; inspect 375/768/1023/1024/1440 CSS px plus content-driven cases |
| CR-04 Typography | Responsive hierarchy, readable form labels and metadata, Arabic/English metrics, long titles and mixed numbers/identifiers | Fonts/tokens finalized in D-10/D-12, not selected or installed here |
| CR-05 Editable components | Original Figma shell/cards/fields/badges/feedback/filters/dialogs/sheets and conditional summary components; variants bound to semantic tokens | D-10 through D-12; no components generated here |
| CR-06 Touch and keyboard | Non-drag status action, keyboard navigation/editing, focus containment/return, accessible selectors, announcements and touch-safe scroll/drag handling | DEC-07 transitions and DEC-10 accessibility target; real-device/assistive-tech validation later |
| CR-07 Feedback/forms | Distinguish valid empty/no-match, denied, missing, unavailable and unknown permission only where justified; associated label/help/error and section-level recovery | G-01/G-04/G-15; no user-facing secrets/raw diagnostics; uncertain outcomes are not definite failures |
| CR-08 Motion | Purposeful progress/confirmation/cancel/rollback; static loading and reduced-motion transitions; information not conveyed only by movement or color | D-20 specifies timings/easing; no animation values invented in D-03 |
| CR-09 Preference controls | Frontend-only language/theme selection; understandable focus and selected-state feedback | DEC-11: defaults/system behavior/local retention/placement open; no backend sync/persistence assumed |
| CR-10 Dates | Localized display and accessible input/range controls; existing overdue, empty and invalid states captured conditionally | DEC-06/DEC-12 unresolved; no unified validation, week start or timezone silently selected |
| CR-11 Design/implementation gate | Figma remains design source of truth; approve full product design before frontend | Record exact later file/node/version approval; D-03 is not design approval |
| CR-12 Independent identity | Original Taskly is separate read-only evidence; create original Orbit assets and visual language | DEC-16; no unverified asset rights or imported implementation |

WCAG 2.2 AA is a proposed design review target (DEC-10), not an approved compliance claim. Mandatory keyboard, motion and bilingual/theme requirements already follow project instructions.

## Backend gap disposition proposals

All G-01 through G-17 remain OPEN. Primary classifications identify the current design consequence; evidence can still be needed later even for a conditional/deferred item. A blocked branch does not automatically block unaffected navigation/foundation documentation. No evidence request was sent as part of D-03.

### G-01

**Response contracts — OPEN**

- **Evidence:** [G-01](../api/D02-api-backend-contract-audit.md#g-01) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Requires backend evidence later.
- **Affected scope:** All operation-backed features/screens.
- **Required evidence or decision:** Sanitized success/error/header samples or authoritative schemas; no live requests in D-03.
- **Proposed responsible role:** Backend contract owner (person unassigned); no message/request sent and no named assignment made.
- **Design implication / hold point:** Qualified structural design only; block uncertain response-dependent labels/branches until evidence.
- **Owner decisions:** [DEC-01](#dec-01), [DEC-05](#dec-05).

### G-02

**Collection-only deletion — OPEN**

- **Evidence:** [G-02](../api/D02-api-backend-contract-audit.md#g-02) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Can be deferred.
- **Affected scope:** F-17; no committed screen.
- **Required evidence or decision:** Permissions, affected-row confirmation, cascades, linked records and restoration evidence plus explicit scope approval.
- **Proposed responsible role:** Backend contract owner and product owner; no message/request sent and no named assignment made.
- **Design implication / hold point:** Exclude deletion from initial screen scope; do not add confirmation/recovery UI as approved work.
- **Owner decisions:** [DEC-09](#dec-09).

### G-03

**Collection omissions — OPEN**

- **Evidence:** [G-03](../api/D02-api-backend-contract-audit.md#g-03) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Requires backend evidence later.
- **Affected scope:** F-02, F-03, F-04, F-10, F-13, F-14.
- **Required evidence or decision:** Authoritative definitions for source-only details, recovery and statistics; internal user verification distinguished.
- **Proposed responsible role:** Backend contract owner (person unassigned); no message/request sent and no named assignment made.
- **Design implication / hold point:** Retain source-only classification; statistics remains conditional; do not treat collection as complete.
- **Owner decisions:** [DEC-04](#dec-04), [DEC-05](#dec-05).

### G-04

**Authorization — OPEN**

- **Evidence:** [G-04](../api/D02-api-backend-contract-audit.md#g-04) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Blocking a scope/design decision.
- **Affected scope:** Project-scoped features and actions.
- **Required evidence or decision:** Operation-specific policy/RPC evidence and approved rights; UI checks do not prove RLS.
- **Proposed responsible role:** Backend/security owner and product owner; no message/request sent and no named assignment made.
- **Design implication / hold point:** Block final action eligibility/role journeys; production authorization remains a separate release prerequisite.
- **Owner decisions:** [DEC-05](#dec-05).

### G-05

**Membership and invite visibility — OPEN**

- **Evidence:** [G-05](../api/D02-api-backend-contract-audit.md#g-05) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Blocking a scope/design decision.
- **Affected scope:** F-06, F-07; OR-S09, OR-S10, OR-S11.
- **Required evidence or decision:** Creator-membership invariant and role behavior; reconcile UI/helper difference.
- **Proposed responsible role:** Backend contract owner and product owner; no message/request sent and no named assignment made.
- **Design implication / hold point:** Do not broaden invite eligibility or merge member IDs and user IDs.
- **Owner decisions:** [DEC-05](#dec-05).

### G-06

**Epic single-field save conflict — OPEN**

- **Evidence:** [G-06](../api/D02-api-backend-contract-audit.md#g-06) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Can be designed conditionally.
- **Affected scope:** F-09; OR-S14.
- **Required evidence or decision:** Owner confirmation of field Save/Cancel; preserve one-field browser PATCH; obtain more evidence for any future batch policy.
- **Proposed responsible role:** Product owner; backend owner for new contracts; no message/request sent and no named assignment made.
- **Design implication / hold point:** Field editing can be specified; no atomic whole-form promise. Planning preference is not gap closure.
- **Owner decisions:** [DEC-03](#dec-03).

### G-07

**Date rules — OPEN**

- **Evidence:** [G-07](../api/D02-api-backend-contract-audit.md#g-07) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Blocking a scope/design decision.
- **Affected scope:** F-09, F-11, F-14; OR-S13 through OR-S18 where dates apply.
- **Required evidence or decision:** Feasible owner-approved create/edit/overdue/date/timezone/week policy; date display conventions.
- **Proposed responsible role:** Product owner and backend contract owner; no message/request sent and no named assignment made.
- **Design implication / hold point:** Keep unresolved as selected; block final date validation, related copy and metric boundaries.
- **Owner decisions:** [DEC-06](#dec-06), [DEC-12](#dec-12).

### G-08

**Statuses and transitions — OPEN**

- **Evidence:** [G-08](../api/D02-api-backend-contract-audit.md#g-08) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Blocking a scope/design decision.
- **Affected scope:** F-10, F-11, F-12; OR-S15, OR-S16, OR-S17.
- **Required evidence or decision:** Allowed transitions, initial status and legacy-value policy; ordering evidence if later requested.
- **Proposed responsible role:** Product owner and backend contract owner; no message/request sent and no named assignment made.
- **Design implication / hold point:** Board structure conditional; no arbitrary move eligibility, configurable workflow or persisted ordering.
- **Owner decisions:** [DEC-07](#dec-07).

### G-09

**Uncertain mutations — OPEN**

- **Evidence:** [G-09](../api/D02-api-backend-contract-audit.md#g-09) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Can be designed conditionally.
- **Affected scope:** F-05, F-07, F-09, F-11, F-12; mutation screens.
- **Required evidence or decision:** Operation-specific confirmation/reconciliation and idempotency evidence; approved pending-close behavior.
- **Proposed responsible role:** Backend contract owner and product owner; no message/request sent and no named assignment made.
- **Design implication / hold point:** Preserve drafts; show uncertain outcomes; no universal automatic retry, rollback or transactional promise.
- **Owner decisions:** [DEC-03](#dec-03), [DEC-14](#dec-14).

### G-10

**IDs and nullability — OPEN**

- **Evidence:** [G-10](../api/D02-api-backend-contract-audit.md#g-10) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Requires backend evidence later.
- **Affected scope:** F-03 through F-12 where identity/relations apply.
- **Required evidence or decision:** Canonical identifiers, user/member mapping and nullable relation examples.
- **Proposed responsible role:** Backend contract owner (person unassigned); no message/request sent and no named assignment made.
- **Design implication / hold point:** Design neutral missing-value fallbacks; block final data-binding assumptions and invalid option clearing.
- **Owner decisions:** [DEC-01](#dec-01), [DEC-05](#dec-05).

### G-11

**Pagination and search — OPEN**

- **Evidence:** [G-11](../api/D02-api-backend-contract-audit.md#g-11) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Can be designed conditionally.
- **Affected scope:** F-04, F-08, F-10; OR-S06, OR-S12, OR-S14, OR-S15.
- **Required evidence or decision:** Count/range/416 examples, caps and literal/wildcard behavior; large-data constraints.
- **Proposed responsible role:** Backend contract owner; later UX validation owner; no message/request sent and no named assignment made.
- **Design implication / hold point:** Design explicit incremental retry and no-match states; don't assume universal infinite loading or new filters.
- **Owner decisions:** [DEC-01](#dec-01).

### G-12

**Invitation semantics — OPEN**

- **Evidence:** [G-12](../api/D02-api-backend-contract-audit.md#g-12) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Can be designed conditionally.
- **Affected scope:** F-07, F-18; OR-S10, OR-S11.
- **Required evidence or decision:** Eligibility, expiry, duplicate acceptance, delivery, default roles and optional destination result.
- **Proposed responsible role:** Backend contract owner and product owner; no message/request sent and no named assignment made.
- **Design implication / hold point:** Limit scope to send/accept; block unsupported preview/result claims; defer invitation management.
- **Owner decisions:** [DEC-05](#dec-05), [DEC-09](#dec-09).

### G-13

**Auth/session/recovery — OPEN**

- **Evidence:** [G-13](../api/D02-api-backend-contract-audit.md#g-13) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Blocking a scope/design decision.
- **Affected scope:** F-01, F-02, F-07; OR-S01 through OR-S05, OR-S11.
- **Required evidence or decision:** Authoritative confirmation/redirect/expiry/recovery-origin settings and result evidence.
- **Proposed responsible role:** Backend/auth owner and product owner; no message/request sent and no named assignment made.
- **Design implication / hold point:** Block final recovery/session outcome branches; never expose session data or promise delivery.
- **Owner decisions:** [DEC-08](#dec-08).

### G-14

**Unevidenced additions — OPEN**

- **Evidence:** [G-14](../api/D02-api-backend-contract-audit.md#g-14) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Can be deferred.
- **Affected scope:** F-16 through F-20 where extensions apply.
- **Required evidence or decision:** New scope approval plus supporting contracts for any backend addition; preference controls can remain frontend-only proposal.
- **Proposed responsible role:** Product owner; backend owner if an addition is requested; no message/request sent and no named assignment made.
- **Design implication / hold point:** Keep workspace contextual; defer extra backend features; preference persistence remains uncommitted.
- **Owner decisions:** [DEC-02](#dec-02), [DEC-09](#dec-09), [DEC-11](#dec-11).

### G-15

**Zero-member reachability — OPEN**

- **Evidence:** [G-15](../api/D02-api-backend-contract-audit.md#g-15) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Can be designed conditionally.
- **Affected scope:** F-06; OR-S09.
- **Required evidence or decision:** Whether zero members is valid, restricted or inconsistent data.
- **Proposed responsible role:** Backend contract owner and product owner; no message/request sent and no named assignment made.
- **Design implication / hold point:** Document conditional empty/denied/inconsistent alternatives; do not silently select one.
- **Owner decisions:** [DEC-05](#dec-05).

### G-16

**Feedback coverage — OPEN**

- **Evidence:** [G-16](../api/D02-api-backend-contract-audit.md#g-16) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Can be designed conditionally.
- **Affected scope:** F-15; OR-S06, OR-S12, OR-S15 and all affected feedback.
- **Required evidence or decision:** D-06/D-19 state contracts; later runtime failure and permission validation.
- **Proposed responsible role:** Design owner; later implementation/QA owner; no message/request sent and no named assignment made.
- **Design implication / hold point:** Specify recovery and permission-unknown states; source omissions are not a design standard.
- **Owner decisions:** [DEC-10](#dec-10), [DEC-14](#dec-14).

### G-17

**Statistics semantics — OPEN**

- **Evidence:** [G-17](../api/D02-api-backend-contract-audit.md#g-17) in the accepted static API audit; no new backend verification performed.
- **Proposed classification:** Blocking a scope/design decision.
- **Affected scope:** F-13, F-14; OR-S18.
- **Required evidence or decision:** RPC definitions, all-project visibility, overdue formula/scope, filter effects and boundaries.
- **Proposed responsible role:** Backend statistics owner and product owner; no message/request sent and no named assignment made.
- **Design implication / hold point:** Conditional navigation planning only; block final metric labels/values/filter claims and populated analytics design.
- **Owner decisions:** [DEC-04](#dec-04), [DEC-06](#dec-06), [DEC-12](#dec-12).

## Owner decision register

Statuses: **Planning preference** records a conversation selection; **Proposed** awaits approval; **Blocked** needs evidence/decision; future **Approved** or **Deferred** requires an explicit owner record and exact document revision. No final complete-scope approval is recorded in D03-v1.

### DEC-01

**Core feature/screen scope — Approved**

- **Proposal or planning selection:** Approve or amend F-01 through F-16 with stated conditions; F-17 through F-20 deferred.
- **Required confirmation/evidence:** Owner acceptance of exact D-03 document revision, inclusions, exclusions and hold points.
- **Decision authority:** Project owner; backend evidence supplied by the relevant backend owner where needed.
- **Approval record:** Owner approved conditional D03-v1 on 2026-10-28 within the limits stated in this acceptance.

### DEC-02

**Workspace meaning — Approved**

- **Proposal or planning selection:** Navigation/project context only; no separate workspace entity.
- **Required confirmation/evidence:** Confirm contextual model in final scope approval.
- **Decision authority:** Project owner; backend evidence supplied by the relevant backend owner where needed.
- **Approval record:** Owner approved conditional D03-v1 on 2026-10-28 within the limits stated in this acceptance.

### DEC-03

**Editing model — Approved**

- **Proposal or planning selection:** Explicit field-level Save/Cancel; one epic field per request; operation-specific confirmation.
- **Required confirmation/evidence:** Approve interaction policy; confirm translation feasibility without assuming atomic saves.
- **Decision authority:** Project owner; backend evidence supplied by the relevant backend owner where needed.
- **Approval record:** Owner approved conditional D03-v1 on 2026-10-28 within the limits stated in this acceptance.

### DEC-04

**Statistics/calendar — Approved**

- **Proposal or planning selection:** Conditional modules; distinguish read summaries from scheduling.
- **Required confirmation/evidence:** Confirm conditional scope and resolve or explicitly hold metric-dependent design.
- **Decision authority:** Project owner; backend evidence supplied by the relevant backend owner where needed.
- **Approval record:** Owner approved conditional D03-v1 on 2026-10-28 within the limits stated in this acceptance.

### DEC-05

**Roles and permissions — Blocked**

- **Proposal or planning selection:** Reference recognizes owner/admin/member/viewer in some projections/helpers; no universal rights matrix approved.
- **Required confirmation/evidence:** Backend policy evidence and owner-approved operation rights, creator membership and invitation visibility.
- **Decision authority:** Project owner; backend evidence supplied by the relevant backend owner where needed.
- **Approval record:** Pending; no final owner scope approval or approving revision recorded by D-03 execution.

### DEC-06

**Date validation — Blocked**

- **Proposal or planning selection:** Unresolved by explicit planning selection; no chosen past-date or overdue-edit policy.
- **Required confirmation/evidence:** Feasible owner-approved creation/editing/unchanged-overdue rules supported by backend evidence.
- **Decision authority:** Project owner; backend evidence supplied by the relevant backend owner where needed.
- **Approval record:** Pending; no final owner scope approval or approving revision recorded by D-03 execution.

### DEC-07

**Status workflow — Blocked**

- **Proposal or planning selection:** Source eight-status vocabulary is evidence; transitions, initial default and legacy policy remain open.
- **Required confirmation/evidence:** Approved feasible transition/legacy policy; no persisted reorder or custom statuses inferred.
- **Decision authority:** Project owner; backend evidence supplied by the relevant backend owner where needed.
- **Approval record:** Pending; no final owner scope approval or approving revision recorded by D-03 execution.

### DEC-08

**Auth/session outcomes — Blocked**

- **Proposal or planning selection:** Use evidenced forms with conditional recovery/session branches.
- **Required confirmation/evidence:** Authoritative confirmation, redirects, expiry, recovery-origin and user-facing outcomes.
- **Decision authority:** Project owner; backend evidence supplied by the relevant backend owner where needed.
- **Approval record:** Pending; no final owner scope approval or approving revision recorded by D-03 execution.

### DEC-09

**Exclusions — Approved**

- **Proposal or planning selection:** Defer deletion, invite/role administration, separate workspaces and extended productivity.
- **Required confirmation/evidence:** Owner confirmation of exclusions; any future addition needs separate evidence and approval.
- **Decision authority:** Project owner; backend evidence supplied by the relevant backend owner where needed.
- **Approval record:** Owner approved conditional D03-v1 on 2026-10-28 within the limits stated in this acceptance.

### DEC-10

**Accessibility review target — Approved**

- **Proposal or planning selection:** WCAG 2.2 AA as design review target; keyboard/non-drag alternatives and visible focus.
- **Required confirmation/evidence:** Owner confirmation of target; later QA evidence, no certification claim.
- **Decision authority:** Project owner; backend evidence supplied by the relevant backend owner where needed.
- **Approval record:** Owner approved conditional D03-v1 on 2026-10-28 within the limits stated in this acceptance.

### DEC-11

**Language/theme controls — Proposed**

- **Proposal or planning selection:** Frontend-only selection controls with semantic modes and direction support.
- **Required confirmation/evidence:** Decide defaults, system preference behavior, local retention and placement; no backend persistence assumed.
- **Decision authority:** Project owner; backend evidence supplied by the relevant backend owner where needed.
- **Approval record:** Pending; no final owner scope approval or approving revision recorded by D-03 execution.

### DEC-12

**Date presentation conventions — Blocked**

- **Proposal or planning selection:** Timezone, week start, calendar/numeral conventions and localized date presentation remain open.
- **Required confirmation/evidence:** Owner/localization decision aligned with G-07/G-17; no hidden locale-based default.
- **Decision authority:** Project owner; backend evidence supplied by the relevant backend owner where needed.
- **Approval record:** Pending; no final owner scope approval or approving revision recorded by D-03 execution.

### DEC-13

**Bilingual terminology — Approved**

- **Proposal or planning selection:** Consistent Projects, Members, Epics, Tasks and Statistics concepts; workspace contextual.
- **Required confirmation/evidence:** Owner-approved English/Arabic glossary; resolve Statistics versus Planner and Details versus Edit naming in D-04.
- **Decision authority:** Project owner; backend evidence supplied by the relevant backend owner where needed.
- **Approval record:** Owner approved conditional D03-v1 on 2026-10-28 within the limits stated in this acceptance.

### DEC-14

**Mutation recovery and pending close — Approved**

- **Proposal or planning selection:** Preserve drafts; distinguish failure/uncertain outcome; no blind repeated writes.
- **Required confirmation/evidence:** Approve per-operation pending-close/cancel/reconciliation policy using G-09 evidence.
- **Decision authority:** Project owner; backend evidence supplied by the relevant backend owner where needed.
- **Approval record:** Owner approved conditional D03-v1 on 2026-10-28 within the limits stated in this acceptance.

### DEC-15

**D-04 readiness boundary — Approved**

- **Proposal or planning selection:** D-04 remains unstarted; only owner-accepted scope can govern its later execution.
- **Required confirmation/evidence:** Separate owner instruction after D-03 acceptance; conditional branches retain explicit holds.
- **Decision authority:** Project owner; backend evidence supplied by the relevant backend owner where needed.
- **Approval record:** Owner approved conditional D03-v1 on 2026-10-28 within the limits stated in this acceptance.

### DEC-16

**Independent assets — Approved**

- **Proposal or planning selection:** Create original Orbit assets; reuse no reference implementation or unverified assets.
- **Required confirmation/evidence:** Confirm any requested reuse rights before use; no new asset generation in D-03.
- **Decision authority:** Project owner; backend evidence supplied by the relevant backend owner where needed.
- **Approval record:** Owner approved conditional D03-v1 on 2026-10-28 within the limits stated in this acceptance.

## Explicit exclusions and unresolved decisions

- F-17 deletion is collection-only and deferred; no delete/restore/confirmation screen commitment.
- F-18 role/invitation administration is unevidenced; no role editor, selectable invite role, pending list, resend or revoke.
- F-19 organizations/separate workspaces are excluded from the contextual workspace proposal.
- F-20 scheduling writes, custom statuses/workflow, persisted within-column ordering, comments, attachments and recurrence remain deferred. Calendar statistics are read-only.
- No global search, cross-project task aggregation, personal-task area, realtime sync, offline guarantee, SSO/MFA, billing or additional profile-management API is approved by these documents; such additions need separate evidence and owner scope review.
- Roles are evidence labels, not an approved rights matrix. Final permissions, dates, transitions, response shapes, auth/recovery results and statistics semantics remain unresolved.
- Preference defaults/local retention and final bilingual/date conventions remain undecided; no backend preference persistence.
- Declining or deferring a proposal does not assert that a capability cannot exist elsewhere in the backend.

## D-04 design-readiness checklist

| Readiness class | Checklist / specific implication | Current state |
|---|---|---|
| Authorized foundation | Independent Orbit; design-first gate; Calm & Premium + Professional Workspace; English/Arabic, light/dark, responsive and reduced-motion coverage | Existing project requirements; no new approval needed to document them |
| Evidence-supported foundation | Stable OP/G/UX/SC mappings; contextual shell and project/member/epic/task source patterns; accepted static audit baseline | Available as evidence only, not live guarantees |
| Planning basis | Small teams, contextual workspace, explicit field Save/Cancel, conditional statistics/calendar | Preserved selections; full scope approval pending |
| Scope gate | Owner accepts exact D03-v1 feature/screen package, exclusions and explicit holds; D-03 closure recorded | NOT SATISFIED; D-03 remains REVIEW |
| Conditional IA | Navigation can reserve conditional statistics and role-dependent branches only with visible specification holds; no organization switcher | Later D-04 proposal after separate instruction; no unconditional feature promise |
| Bilingual terminology | Agree global/project hierarchy and English/Arabic glossary; distinguish Details/Edit and Statistics/Planner | DEC-13 pending; final terminology not invented |
| Theme foundations | Semantic theme roles and components include focus/error/readonly/unknown permission and legacy status fallbacks | Required in later D-10/D-12, final tokens not generated |
| Responsive/input | Deliberate tablet navigation, mobile context and nondrag status interaction; visible focus, touch scrolling and overlay ownership | D-04/D-07/D-17 design work later |
| Feedback/motion | State contracts carry empty/no-match/error/retry/uncertain writes; static reduced-motion alternatives and announcements | Later D-06/D-19/D-20; G-09/G-15/G-16 remain open |
| Final Figma hold points | Resolve or explicitly exclude affected behavior for permissions, response contracts, dates, transitions, auth and statistics before approving those designs | DEC-05 through DEC-08/DEC-12; G-01/G-04/G-05/G-07/G-08/G-13/G-17 |
| Deferred features | No F-17 through F-20 screens or invented backend features in D-04 scope | Proposed exclusion awaits owner confirmation |
| Start authorization | Separate instruction to begin D-04 after D-03 acceptance | NOT GIVEN; D-04 remains TODO |

D-04 readiness is conditional until scope acceptance. Owner acceptance may explicitly defer/exclude unresolved branches; it must not label unknown backend behavior verified. Full Figma approval still precedes frontend development.

## Documentation acceptance and review disposition

Coverage target: 20 features, 19 screens, 29 operation dispositions, 17 open gaps and 16 D-01 findings. Each feature/screen retains evidence and dependency links; all screen modes/states/accessibility/motion requirements are explicit or inherited through named profiles.

D-03 REVIEW means the documentation package is ready for owner review. The backlog criterion requiring owner scope approval is intentionally still pending; D-03 must not be marked DONE until the owner accepts scope and explicitly resolves, defers or blocks unsupported requirements. No other task is advanced. Validation is recorded in the [D-03 report](../../.ai/reports/D03-product-scope-requirements.md).
