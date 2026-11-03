# D-04 — Information Architecture

## Owner acceptance — D04-v1

Status: DONE — bounded owner acceptance recorded in the conversation.

D04-v1 is accepted by the project owner as the bounded Information Architecture and Navigation baseline. Global: Projects and conditional Statistics. Current Project: Tasks (default), Epics, Members, Project details. Utilities: language/appearance controls and Sign out. Desktop uses a labeled sidebar; tablet/mobile use a unified drawer with consistent LTR/RTL hierarchy. This is not final Figma or backend behavior approval.

Validate frequent mobile navigation in D-07/D-21. Exact bilingual terminology remains reviewable; language/theme placement remains unresolved. Deep-link restoration is a design intent, not a verified router/backend guarantee. DEC-05, DEC-06, DEC-07, DEC-08, DEC-11 and DEC-12 remain unresolved; all 17 backend gaps remain OPEN; F-17 through F-20 remain deferred. Earlier pending-acceptance wording below is superseded only within this bounded acceptance. D-05 through D-23 remain TODO. No Figma or frontend work has started.

Status: REVIEW — documentation proposal; final navigation acceptance requires the project owner.
Date: 2026-10-28. Version: D04-v1. Scope baseline: conditional D03-v1.

## Authority and evidence

The owner authorized documentation execution and confirmed the detailed execution request as the complete approved planning baseline when no separate proposal was discoverable. Technical review of that plan is not final navigation acceptance. Taskly Orbit remains independent, design-first, for small project teams; direction: Hybrid — Calm & Premium + Professional Workspace.

- [Instructions](../../AGENTS.md), [backlog](../../.ai/tasks/DESIGN_BACKLOG.md).
- [D-03 scope](../product/D03-product-scope-requirements.md), including its acceptance notice, feature records, exclusions, six unresolved decisions and 17 OPEN gaps; [D-03 surface matrix](D03-screen-scope-matrix.md).
- [D-01 architecture/UX evidence](../product/D01-architecture-ux-audit.md) and [interaction inventory](D01-screen-interaction-inventory.md).
- [D-02 action mapping](D02-ui-action-api-mapping.md) and its linked operation evidence. OP identifiers below refer to that accepted static mapping, not newly verified APIs.
- [Navigation specification](D04-navigation-specification.md) defines interaction rules. Historical proposal-era status text is not rewritten; D-03 acceptance notices take precedence.

Reference revision remains `06e216366f57b80e7db0890efdc0e605eab68be1`. No backend/runtime re-audit occurred. Sitemap labels express conceptual destinations, not committed URL patterns, new endpoints or database entities.

## Complete conceptual sitemap

```text
Entry / internal session gate (no separate product surface)
Public authentication frame
  Sign in (OR-S01)
  Sign up (OR-S02)
  Recovery request (OR-S03, conditional outcomes)
  Password reset (OR-S04, conditional recovery context)
Invitation landing (OR-S11; standalone, session-aware)
Authenticated shell (OR-S05; workspace means navigation/project context)
  GLOBAL
    Projects (OR-S06)
      Create project (OR-S07; contextual action)
    Statistics (OR-S18; conditional, not a project child)
      Calendar summary and per-project summaries (read-only sections)
  CURRENT PROJECT — validated project identity, not another entity
    Tasks (OR-S15; default project landing; board/list presentations)
      Create task (OR-S16; contextual overlay)
      Task details (OR-S17; contextual or direct-entry intent)
    Epics (OR-S12)
      Create epic (OR-S13; contextual form)
      Epic details (OR-S14; contextual or direct-entry intent)
        Associated tasks → OR-S17 / eligible creation → OR-S16
    Members (OR-S09)
      Invite member (OR-S10; conditional contextual overlay)
    Project details (OR-S08; explicit field editing within details)
  UTILITIES
    Language and appearance controls (OR-S19)
    Sign out (action, no independent page)
Cross-cutting: loading, empty, no-match, unavailable, missing/denied where
justified, readonly/unknown permission, dirty/pending/uncertain feedback.
```

Public forms also expose language/appearance controls through their frame; sign out is authenticated-only. No separate home dashboard, workspace administration, Calendar destination, Settings/profile destination or global search is introduced. Feedback and internal redirects are states, not extra OR surfaces.

## Global versus project navigation

GLOBAL always contains Projects and conditionally Statistics, in that order. CURRENT PROJECT contains Tasks, Epics, Members, Project details, in that order. UTILITIES contains language/appearance controls and Sign out, separated from content destinations. All device compositions preserve those groups and order. Group names are descriptive labels, not clickable destinations.

Projects opens the project collection; selecting a project establishes its validated context and opens Tasks by default. Project details remains explicitly reachable and is not synonymous with the project landing. Explicit shortcuts/deep links to other sections retain their requested destination. The current project is identified by name and canonical identity, never inferred from a title alone. Without a selected project, show a select-project explanation/action rather than invalid project links. On global destinations, do not imply that global content is scoped to a previously selected project; retain no active project section there. Remembering a last project across sessions is not promised.

Read visibility and mutation eligibility are separate. Navigation does not grant authorization. No owner/admin/member/viewer rights matrix is finalized; G-04/G-05 and DEC-05 hold affected eligibility only. Readonly users still need supported read destinations; unknown eligibility must not be presented as authorized editing.

## All 19 surface dispositions and traceability

Every row inherits the D-03 READ/WRITE/AUTH/BOARD/ACCESS profiles where applicable. Source aliases and operation qualifications remain in the linked evidence above.

| Surface | Conceptual location / disposition | Entry and parent/return | Evidence operations / conditional boundary |
|---|---|---|---|
| OR-S01 Sign in | Public page | Entry/session gate; signup/recovery/invitation return | OP-02, OP-05; G-13, DEC-08 |
| OR-S02 Sign up | Public page | Sign in; return to Sign in after confirmed submission | OP-01; no automatic authenticated state |
| OR-S03 Recovery request | Public page, conditional outcome | Sign in; return to Sign in | OP-06; no delivery/account-existence claim |
| OR-S04 Password reset | Public recovery-context page | Recovery link/reentry; invalid context → recovery request | OP-25, OP-26, OP-04; completion outcomes held |
| OR-S05 Shell and navigation | Shared authenticated frame | Session gate; hosts global/project destinations | OP-03 internal, OP-05, OP-07, OP-08, OP-24 |
| OR-S06 Projects | GLOBAL destination | Authenticated default; parent for project selection/create | OP-08; no project-wide search invented |
| OR-S07 Create project | Contextual form, not nav item | Projects → form → Projects | OP-09; no created ID guaranteed |
| OR-S08 Project details and edit | CURRENT PROJECT destination | Explicit link/direct-entry intent; parent Projects | OP-24, OP-10; field Save/Cancel, qualified confirmation |
| OR-S09 Members | CURRENT PROJECT destination | Project section; parent project/Projects | OP-11; zero-result interpretation conditional |
| OR-S10 Invite member | Contextual dialog/sheet | Members → invite → Members | OP-12; eligibility/delivery/duplicates held |
| OR-S11 Invitation landing | Standalone session-aware flow | External invitation; Sign in return; Projects fallback | OP-13, OP-02, OP-05; optional destination only |
| OR-S12 Epics | CURRENT PROJECT destination | Project section; parent project/Projects | OP-14; scoped title search, paging qualified |
| OR-S13 Create epic | Contextual form, not nav item | Epics → form → Epics | OP-15, OP-11; dates/eligibility conditional |
| OR-S14 Epic details | Detail dialog/panel; direct-entry intent | Epics → detail; nested task return to this epic | OP-16, OP-17, OP-20, OP-11; one-field PATCH |
| OR-S15 Tasks and Kanban | CURRENT PROJECT default destination | Project selection; parent project/Projects | OP-19, OP-22, OP-29; movement conditional |
| OR-S16 Create task | Contextual dialog/full-height form | Tasks or epic details → form → actual origin | OP-21, OP-11, OP-14; status/date/uncertain-write holds |
| OR-S17 Task details | Detail dialog/panel; direct-entry intent | Tasks or epic details → detail → actual origin | OP-29, OP-22, OP-11, OP-14; independent canEdit |
| OR-S18 Statistics and calendar summary | Conditional GLOBAL destination | Global link/direct intent; parent Projects | OP-27, OP-28, OP-08; no scheduling, metric population held |
| OR-S19 Display controls | Utility popover/selection surface | Shared/public frame → controls → origin | No API; DEC-11 defaults/retention/placement open |

## Public and authenticated flows

- Entry without a valid session → Sign in; verified authenticated entry without a specific safe destination → Projects. Refreshable state → explicit restoration within OR-S05, not an optimistic authenticated view.
- Sign in ↔ Sign up; Sign in → Recovery request. Confirmed signup proposes return to Sign in, consistent with source evidence, without claiming account confirmation or immediate access. Recovery request gives generic submission feedback, not proof of delivery. Reset first checks context; invalid/unconfirmed context offers recovery request and Sign in. Final recovery/session outcome branches remain DEC-08/G-13 holds.
- Authenticated Projects → select project → Tasks; section links → Epics / Members / Project details. Creation and editing are contextual actions, not permanent navigation destinations.
- Invitation → validate available input → authenticate/restore if necessary → return to invitation → explicit acceptance. If a supplied project destination can be validated, propose its Tasks landing; otherwise offer Projects. Do not invent invitation preview metadata or derive a project ID from an opaque invitation. Expiry/recipient/duplicate categories require evidence.
- Sign out → confirmed local logout → Sign in. Failure retains actionable feedback; no all-device revocation claim. Internal verification/restoration operations OP-03/OP-05 and recovery OP-25/OP-26 are not pages.

## Contextual actions, overlays and conditional Statistics

Create project belongs to Projects; create epic belongs to Epics; invite belongs to Members; create task belongs to Tasks or the associated-task section of an epic. Editing belongs inside details with explicit field Save/Cancel, not blur autosave. No delete, role picker or invitation administration action is exposed. Create/edit/invite visibility remains operation-specific and conditional on verified eligibility.

Epic/task details may use panels/dialogs at wider sizes and full-height detail surfaces on mobile without changing conceptual parents. Nested task focus and return belong to the epic origin, not an assumed board. Drawer, display popover, date-range popup, assignment controls, dirty-close confirmation, feedback and conditional move feedback are supporting interactions, not extra sitemap destinations. Their lifecycle is specified in the [navigation specification](D04-navigation-specification.md#overlay-lifecycle-and-pending-close).

Statistics is a reserved conditional global destination, not an unconditional release feature. Review prototypes must visibly label it conditional; omit it from a future released navigation if its capability is not cleared, rather than show fabricated data. A direct intent while unavailable offers an explanation and Projects, not a silent success redirect. Final inclusion requires owner acceptance and affected evidence; no feature-flag backend is specified. OP-27 calendar summaries accept supported project/status filters; OP-28 per-project counts accept dates only. The source inclusive 1–7-day range is not expanded. Preserve independent section loading/retry and explicit scope labels; no finalized formulas, overdue labels/values or common denominator until G-17 is resolved. Calendar is a read-only section, not Planner or scheduling.

## Internal redirects and session states

Historical SC-00 root and SC-13 statistics aliases map to entry routing and OR-S18 respectively, not additional surfaces. Do not inherit Original Taskly URLs as Orbit requirements. Proposed aliases, if later retained, resolve to a single canonical conceptual destination without adding Back-loop entries. Conditional Statistics remains conditional through aliases. Session restoration prioritizes a safe validated requested destination; absent/unavailable context falls back to Projects after authentication. General deep-link return across authentication is a design intent pending route/session verification, not an evidenced universal restoration capability. Sensitive invitation/recovery inputs must not enter reports, ordinary preference storage or visible breadcrumbs.

## Alternatives and tradeoffs for owner review

| Alternative | Benefit | Cost / disposition |
|---|---|---|
| Unified two-level model; labeled desktop sidebar and unified tablet/mobile drawer | Consistent global/project hierarchy; visible desktop context; scalable labels | Primary proposal; drawer adds repeated mobile taps; validate before acceptance |
| Split global menu plus separate project tabs | Faster peer-section switching | Duplicated navigation ownership and narrow/Arabic crowding; not selected |
| Bottom navigation | Potentially faster frequent mobile switching | Limited labels/space, competing global/project hierarchy; not introduced automatically; revisit only after evidence and owner decision |
| Icon-only/collapsible desktop rail | More content width | Discoverability, Arabic labels and context cost; not primary proposal |
| Project details or Epics as default landing | Emphasizes setup/groupings | Adds steps to everyday work; Tasks proposed as default, explicit links still honored |
| Separate Calendar/Planner destination | Strong date discovery | Misrepresents conditional summaries as scheduling; excluded |

## Naming and bilingual terminology proposals

DEC-13 approved naming principles, not these final translations. Owner/native-language comprehension review remains required. Match navigation, headings, breadcrumbs and accessible names. Keep raw IDs/enums and user-authored names unchanged; do not translate product brand elements automatically.

| English proposal | Arabic proposal | Meaning / caution |
|---|---|---|
| Global | عام | Group label, not a workspace entity |
| Projects | المشاريع | Global collection |
| Statistics | الإحصاءات | Conditional summaries; never Weekly Planner |
| Current project | المشروع الحالي | Context group |
| Select project / Switch project | اختيار مشروع / تبديل المشروع | Select existing accessible project, not workspace management |
| Tasks | المهام | Default project destination |
| Epics | الملاحم | Work groupings; validate comprehension against alternative مجموعات العمل الكبيرة before acceptance |
| Members | الأعضاء | Read roster, not role administration |
| Project details | تفاصيل المشروع | Viewing with explicit eligible editing, not Edit as destination name |
| Create project / Create epic / Create task | إنشاء مشروع / إنشاء ملحمة / إنشاء مهمة | Contextual actions |
| Invite member | دعوة عضو | Send invitation only |
| Language / Appearance | اللغة / المظهر | Utilities; placement remains proposal under DEC-11 |
| Light / Dark | فاتح / داكن | No default or system-following policy implied |
| Sign in / Sign up / Sign out | تسجيل الدخول / إنشاء حساب / تسجيل الخروج | Consistent authentication language |
| Back to Tasks / Back to Epics / Projects | العودة إلى المهام / العودة إلى الملاحم / المشاريع | Explicit parent fallback rather than ambiguous Back |
| Save / Cancel / Keep editing / Discard changes | حفظ / إلغاء / متابعة التحرير / تجاهل التغييرات | Discard draft is not server undo |

## Unresolved owner decisions — all remain open

Source of authority: [owner decision register](../product/D03-product-scope-requirements.md#owner-decision-register). D-04 proposes no closure or new rights.

| Decision | Preserved status | Affected hold only |
|---|---|---|
| DEC-05 Roles and permissions | Blocked; unresolved | Final action/visibility and role journeys, creator/member/invite rules |
| DEC-06 Date validation | Blocked; unresolved | Past-date/overdue editing validation and related copy |
| DEC-07 Status workflow | Blocked; unresolved | Initial status, legal transitions, legacy handling; board structure can proceed conditionally |
| DEC-08 Auth/session outcomes | Blocked; unresolved | Confirmation, redirects, expiry, recovery provenance and final restoration outcomes |
| DEC-11 Language/theme controls | Proposed; unresolved | Defaults, system behavior, retention and final placement; utility placement here is a proposal |
| DEC-12 Date presentation conventions | Blocked; unresolved | Timezone, week start, calendar/numeral conventions; no locale-driven hidden choice |

## Backend gaps — all 17 remain OPEN

Each link points to the preserved D-03 disposition and onward to D-02 evidence. No new backend request or gap closure is claimed.

| Gap | Navigation/design consequence and bounded hold |
|---|---|
| [G-01 Response contracts](../product/D03-product-scope-requirements.md#g-01) — OPEN | All data-backed surfaces: qualify response-dependent feedback/branches |
| [G-02 Collection-only deletion](../product/D03-product-scope-requirements.md#g-02) — OPEN | Deferred; no deletion destination/action |
| [G-03 Collection omissions](../product/D03-product-scope-requirements.md#g-03) — OPEN | Preserve source-only/internal distinctions for details, recovery and statistics |
| [G-04 Authorization](../product/D03-product-scope-requirements.md#g-04) — OPEN | Hold final operation eligibility and permission journeys, not all structural IA |
| [G-05 Membership/invite visibility](../product/D03-product-scope-requirements.md#g-05) — OPEN | Hold creator membership and invite exposure rules |
| [G-06 Epic single-field conflict](../product/D03-product-scope-requirements.md#g-06) — OPEN | One field per PATCH; no atomic whole-form save |
| [G-07 Date rules](../product/D03-product-scope-requirements.md#g-07) — OPEN | Hold date validation, date-bound copy and metric boundaries |
| [G-08 Statuses/transitions](../product/D03-product-scope-requirements.md#g-08) — OPEN | No arbitrary moves/default/ordering inference; neutral unknown status display |
| [G-09 Uncertain mutations](../product/D03-product-scope-requirements.md#g-09) — OPEN | Draft/pending/uncertain states; no automatic replay or universal undo |
| [G-10 IDs/nullability](../product/D03-product-scope-requirements.md#g-10) — OPEN | Validate canonical project/entity relations before deep-link context; preserve unavailable options |
| [G-11 Pagination/search](../product/D03-product-scope-requirements.md#g-11) — OPEN | Scope search and paging; no exhaustive-list or universal infinite-loading guarantee |
| [G-12 Invitation semantics](../product/D03-product-scope-requirements.md#g-12) — OPEN | No preview/delivery/expiry/duplicate claim; optional destination fallback |
| [G-13 Auth/session/recovery](../product/D03-product-scope-requirements.md#g-13) — OPEN | Hold final recovery/restoration branches; safe authentication fallback |
| [G-14 Unevidenced additions](../product/D03-product-scope-requirements.md#g-14) — OPEN | Context-only workspace; no preference backend or new feature entity |
| [G-15 Zero-member reachability](../product/D03-product-scope-requirements.md#g-15) — OPEN | Retain valid-empty/restricted/inconsistent alternatives without choosing a cause |
| [G-16 Feedback coverage](../product/D03-product-scope-requirements.md#g-16) — OPEN | Specify explicit retry and unknown states; later runtime/state-matrix validation |
| [G-17 Statistics semantics](../product/D03-product-scope-requirements.md#g-17) — OPEN | Hold populated metrics/formulas/all-project scope; conditional navigation only |

## Deferred exclusions and acceptance boundary

Preserve F-17 deletion, F-18 invitation/role administration, F-19 separate workspaces and F-20 extended productivity as deferred. No delete/restore UI, role editor/picker, pending invitations, resend/revoke, workspace entity/administration, scheduling writes, custom workflow/statuses, persisted ordering, comments, attachments or recurrence. Also excluded: global search, cross-project task aggregation, personal-task area, realtime/offline guarantees, SSO/MFA, billing and new profile APIs. Read-only calendar counts do not authorize event CRUD.

Documentation coverage is reviewable without resolving every behavior hold. Final owner navigation/glossary acceptance, responsive prototype usability and full Figma approval remain outstanding. No Figma file, frontend, dependency, backend or Original Taskly change is authorized here. D-04 is not DONE; do not start D-05 automatically.
