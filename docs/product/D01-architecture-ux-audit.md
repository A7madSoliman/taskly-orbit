# D-01 — Original Taskly Architecture & UX Audit

Status: REVIEW — owner acceptance required.
Date: 2026-10-27.
Product: independent Taskly Orbit.
Direction: Hybrid — Calm & Premium + Professional Workspace.

## Evidence baseline and method

- Reference: https://github.com/A7madSoliman/rafiq-tasks-management-system
- Full commit SHA: `06e216366f57b80e7db0890efdc0e605eab68be1`. Execution rechecked GitHub's read-only main-branch endpoint and confirmed it matches the approved planning revision.
- [Pinned tree](https://github.com/A7madSoliman/rafiq-tasks-management-system/tree/06e216366f57b80e7db0890efdc0e605eab68be1); recursive enumeration was not truncated.
- Approved D-01 planning output in the conversation is the execution baseline.
- Method: remote read-only source inspection; complete page/layout route enumeration; component/hook review; representative test-source review; revision-pinned line evidence.
- No clone, original repository modification, backend requests, dependencies, app execution, test execution or Figma access. Source behavior is not runtime proof.
- [Companion inventory](../ux/D01-screen-interaction-inventory.md) enumerates routes, navigation, major overlays/interactions, state coverage and API-handler paths. Reference capabilities are not approved Orbit scope.

## Architecture assessment

### App Router and route boundaries

There are 15 page modules and three layout modules. Four auth pages use an auth route group. Protected routes cover projects, project-specific epics/tasks/members/editing, and statistics. Root redirects to projects; the older statistics path redirects to My Statistics. Invitation acceptance has its own frame and authentication gate outside both route groups.

Protected layout distinguishes unauthenticated, refreshable and authenticated states; a refreshable session renders client-side session restoration. Root layout defines fonts, language and toast host; auth layout provides branding; protected shell composes navigation and content.

Evidence: [src/app/(protected)/layout.tsx:L1–L24](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/%28protected%29/layout.tsx#L1-L24); [src/app/invite/page.tsx:L66–L100](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/invite/page.tsx#L66-L100); [src/app/layout.tsx:L1–L31](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/layout.tsx#L1-L31); [src/app/(auth)/layout.tsx:L1–L36](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/%28auth%29/layout.tsx#L1-L36); [src/components/shared/authenticated-layout/session-restore.tsx:L1–L50](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/components/shared/authenticated-layout/session-restore.tsx#L1-L50).

No dedicated loading/error/not-found/template modules appear in the enumerated App Router paths. Feature-level feedback exists, so this is not a claim that error handling is absent.

### Feature ownership and shared components

Six features own auth, projects, epics, tasks, invitations and statistics, using components, hooks, schemas and utilities. Shared Button/Input/FieldLabel/Textarea primitives and a shared authenticated shell separate foundational UI from feature concerns. Current-project context derives its ID from the pathname and remounts a keyed provider per project; navigation definitions centralize destination structure.

Retain these boundaries conceptually, without importing implementation. Repeated overlay mechanics and component-specific styling warrant a more deliberate shared interaction/design system.

Evidence: [src/components/shared/authenticated-layout/authenticated-shell.tsx:L1–L45](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/components/shared/authenticated-layout/authenticated-shell.tsx#L1-L45); [src/config/navigation.ts:L1–L70](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/config/navigation.ts#L1-L70); [src/features/projects/context/current-project-context.tsx:L1–L83](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/context/current-project-context.tsx#L1-L83); [src/components/ui/button.tsx:L1–L30](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/components/ui/button.tsx#L1-L30); [src/components/ui/input.tsx:L1–L26](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/components/ui/input.tsx#L1-L26).

### Server/API boundaries

Observed flow: browser requests → same-origin Next.js handlers → Supabase. Layout/session helpers run on the server. The sampled projects handler reads cookies and server configuration; cookie utilities set HTTP-only sessions. This architecture observation does not establish handler-wide or database authorization correctness.

The inventory records 19 handler paths as structure only. Supported methods, schemas, permissions, response guarantees and backend security are not audited in D-01.

Evidence: [src/features/projects/hooks/use-projects.ts:L65–L105](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/hooks/use-projects.ts#L65-L105); [src/app/api/projects/route.ts:L1–L78](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/projects/route.ts#L1-L78); [src/lib/auth/auth-cookies.ts:L1–L56](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/lib/auth/auth-cookies.ts#L1-L56); [src/lib/auth/session.ts:L19–L43](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/lib/auth/session.ts#L19-L43).

### Forms and validation

Sampled auth/project/epic/task forms use React Hook Form and Zod. Shared project fields supply labels, inline feedback and a description counter. Reference project-name constraints are 3–100 characters and description maximum is 500; these are observed reference rules, not approved Orbit requirements. Task creation warns about an uncertain validated response rather than assuming a safe failure. Task and epic persistence/close rules differ (UX-05).

Evidence: [src/features/projects/schemas/project-fields-schema.ts:L1–L13](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/schemas/project-fields-schema.ts#L1-L13); [src/features/projects/components/project-form-fields.tsx:L1–L113](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/components/project-form-fields.tsx#L1-L113); [src/features/tasks/components/create-task-form.tsx:L121–L170](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/components/create-task-form.tsx#L121-L170).

### State management

React state, custom hooks and current-project context manage loading/error/success, pagination and mutation feedback. Inspected hooks protect against cancellation/stale data. Projects keep page state in the URL; epics synchronize search/page. Task search waits 400ms. Board moves project optimistic changes and reconcile definite or uncertain outcomes; local additions are project-scoped.

Retain explicit states and reconciliation. Reconsider distributed request orchestration only during later implementation planning; no library choice is made here.

Evidence: [src/features/projects/hooks/use-projects.ts:L1–L306](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/hooks/use-projects.ts#L1-L306); [src/features/epics/components/project-epics-screen.tsx:L34–L151](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/epics/components/project-epics-screen.tsx#L34-L151); [src/features/tasks/components/project-tasks-board-screen.tsx:L214–L296](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/components/project-tasks-board-screen.tsx#L214-L296); [src/features/tasks/hooks/use-board-task-move.ts:L1–L221](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/hooks/use-board-task-move.ts#L1-L221).

### Responsive architecture and design foundations

Shell/board use lg/1024px behavior; project pagination/task dialogs also use md changes. Desktop board adapts to mobile list/status tray; member table adapts to mobile cards. Native select/date controls coexist with a custom statistics range popup. Semantic tokens cover color, typography, spacing and radius, while consumers add many arbitrary sizes and overrides.

Retain deliberate adaptation and semantic roles. Orbit requires independent tablet composition, Arabic typography/direction and both light/dark modes; sampled source does not demonstrate those complete requirements.

Evidence: [src/styles/tokens.css:L1–L83](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/styles/tokens.css#L1-L83); [src/features/tasks/hooks/use-is-desktop.ts:L1–L27](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/hooks/use-is-desktop.ts#L1-L27); [src/features/tasks/components/create-task-modal.tsx:L112–L137](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/components/create-task-modal.tsx#L112-L137); [src/features/projects/components/project-members-list.tsx:L38–L125](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/components/project-members-list.tsx#L38-L125).

### Testing strategy

The complete tree contains 54 test files, including 9 under tests/api. Package scripts expose lint, typecheck, test and build; Vitest uses Node. Representative hook tests mock React/fetch, selected component tests render static markup, and sampled API tests mock auth/upstream requests. A custom Chromium fixture exercises focus on real drawer/nested-dialog components and skips without a supported browser.

This provides unit/component/boundary regression intent, not full-app end-to-end, visual, real-device or accessibility certification. No original-project tests, builds or checks were run; no pass rate or coverage percentage is asserted.

Evidence: [package.json:L5–L14](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/package.json#L5-L14); [vitest.config.mts:L1–L14](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/vitest.config.mts#L1-L14); [src/features/projects/hooks/use-projects.test.ts:L1–L39](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/hooks/use-projects.test.ts#L1-L39); [src/features/statistics/components/statistics-content.test.tsx:L1–L26](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/statistics/components/statistics-content.test.tsx#L1-L26); [tests/api/tasks/create-task.test.ts:L1–L18](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/tests/api/tasks/create-task.test.ts#L1-L18); [tests/ui/focus.browser.test.ts:L1–L35](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/tests/ui/focus.browser.test.ts#L1-L35); [tests/ui/browser-support.ts:L1–L25](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/tests/ui/browser-support.ts#L1-L25).

## Evidence-based UX findings register

Potential impacts are hypotheses unless explicitly confined to source branches. Validation below is future work. Source review is not a reproduced usability defect or accessibility certification.

### UX-01 — Destination naming

- **Finding ID:** UX-01
- **Classification:** Verified source behavior; usability hypothesis.
- **Source path and line reference:** [src/config/navigation.ts:L8–L40](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/config/navigation.ts#L8-L40); [src/features/statistics/components/my-statistics-screen.tsx:L100–L125](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/statistics/components/my-statistics-screen.tsx#L100-L125).
- **Observed behavior:** Navigation says My Statistics, while its desktop heading says Weekly Planner; Details points to project editing.
- **Potential UX impact:** Users may need to reinterpret names and whether Details is read-only.
- **Recommended improvement:** Approve consistent terminology and distinguish viewing/editing.
- **Required validation:** D-04/D-21 navigation comprehension and prototype testing; no runtime confusion was observed.

### UX-02 — Project-dependent mobile navigation

- **Finding ID:** UX-02
- **Classification:** Verified source behavior; usability hypothesis.
- **Source path and line reference:** [src/components/shared/authenticated-layout/mobile-bottom-navigation.tsx:L12–L59](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/components/shared/authenticated-layout/mobile-bottom-navigation.tsx#L12-L59).
- **Observed behavior:** The bottom bar has Projects only outside project context and five destinations inside it. Statistics is in main navigation.
- **Potential UX impact:** Global destinations and project context may be less discoverable.
- **Recommended improvement:** Specify global/project navigation, switching and context cues.
- **Required validation:** D-04/D-05/D-21 mobile navigation journeys.

### UX-03 — English-specific foundations

- **Finding ID:** UX-03
- **Classification:** Verified source behavior; design coverage gap.
- **Source path and line reference:** [src/app/layout.tsx:L1–L31](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/layout.tsx#L1-L31); [src/config/navigation.ts:L1–L70](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/config/navigation.ts#L1-L70); [src/features/statistics/utils/statistics-display.ts:L1–L69](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/statistics/utils/statistics-display.ts#L1-L69); [src/components/shared/authenticated-layout/mobile-drawer.tsx:L117–L155](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/components/shared/authenticated-layout/mobile-drawer.tsx#L117-L155).
- **Observed behavior:** Root language is English; fonts use Latin subsets; sampled labels/date locales are English; drawer placement uses physical left positioning.
- **Potential UX impact:** Arabic needs different typography, directional handling and mixed-content rules.
- **Recommended improvement:** Create Arabic typography, RTL/LTR layouts, icon exceptions and localized formatting rules.
- **Required validation:** D-10/D-12/D-22 review long Arabic text, mixed identifiers/numbers and dates.

### UX-04 — One inspected token palette

- **Finding ID:** UX-04
- **Classification:** Verified source behavior; design coverage gap.
- **Source path and line reference:** [src/styles/tokens.css:L1–L83](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/styles/tokens.css#L1-L83); [src/app/globals.css:L1–L8](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/globals.css#L1-L8).
- **Observed behavior:** Inspected global tokens define one palette, without light/dark mappings.
- **Potential UX impact:** Dark-mode contrast and state differentiation are unestablished.
- **Recommended improvement:** Retain semantic roles; design both theme modes independently.
- **Required validation:** D-10/D-12/D-22 contrast, focus and state checks; no contrast failure is claimed.

### UX-05 — Different editing persistence

- **Finding ID:** UX-05
- **Classification:** Verified source behavior; usability hypothesis.
- **Source path and line reference:** [src/features/tasks/components/task-details-dialog.tsx:L343–L399](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/components/task-details-dialog.tsx#L343-L399); [src/features/tasks/hooks/use-task-updates.ts:L164–L181](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/hooks/use-task-updates.ts#L164-L181); [src/features/epics/components/epic-details-modal.tsx:L176–L208](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/epics/components/epic-details-modal.tsx#L176-L208); [src/features/epics/components/epic-details-modal.tsx:L408–L453](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/epics/components/epic-details-modal.tsx#L408-L453).
- **Observed behavior:** Task text saves on blur; close flushes text saves and waits for success. Epic text also saves on blur, but dirty close can show save/discard/keep-editing confirmation.
- **Potential UX impact:** Users may misunderstand persistence or delayed closing.
- **Recommended improvement:** Specify consistent dirty, saving, saved, failed and pending-close behavior.
- **Required validation:** D-16/D-17/D-21 test blur, failed saves, close during save and nested overlays; D-02 confirms persistence semantics.

### UX-06 — Incremental loading recovery

- **Finding ID:** UX-06
- **Classification:** Verified source behavior; recovery gap in inspected branches.
- **Source path and line reference:** [src/app/(protected)/project/page.tsx:L29–L50](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/%28protected%29/project/page.tsx#L29-L50); [src/app/(protected)/project/page.tsx:L79–L93](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/%28protected%29/project/page.tsx#L79-L93); [src/features/epics/components/project-epics-screen.tsx:L153–L176](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/epics/components/project-epics-screen.tsx#L153-L176); [src/features/epics/components/project-epics-screen.tsx:L289–L306](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/epics/components/project-epics-screen.tsx#L289-L306); [src/features/tasks/components/task-board-mobile-screen.tsx:L190–L201](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/components/task-board-mobile-screen.tsx#L190-L201).
- **Observed behavior:** Project/epic observers stop while loadMoreError is set; their incremental-error branches render text without a dedicated retry control. Mobile tasks provide a retry.
- **Potential UX impact:** A user may lack obvious in-place recovery while retaining existing items.
- **Recommended improvement:** Standardize incremental-error feedback and explicit retry.
- **Required validation:** Later runtime failure injection for each list before claiming a reproduced blocked journey.

### UX-07 — Members zero-result feedback

- **Finding ID:** UX-07
- **Classification:** Verified source behavior; conditional state gap.
- **Source path and line reference:** [src/features/projects/components/project-members-screen.tsx:L37–L55](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/components/project-members-screen.tsx#L37-L55); [src/features/projects/components/project-members-screen.tsx:L104–L126](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/components/project-members-screen.tsx#L104-L126).
- **Observed behavior:** The member list renders only for successful nonempty results; no explicit zero-member explanation appears.
- **Potential UX impact:** If reachable, this may leave an unexplained content area.
- **Recommended improvement:** Confirm reachability and design empty/restricted/inconsistent-data feedback accordingly.
- **Required validation:** D-02 verifies reachability; D-06/D-19 specify valid states.

### UX-08 — Input focus depends on consumers

- **Finding ID:** UX-08
- **Classification:** Verified source behavior; accessibility risk.
- **Source path and line reference:** [src/components/ui/input.tsx:L10–L24](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/components/ui/input.tsx#L10-L24).
- **Observed behavior:** Shared Input removes focus-visible outline without supplying a replacement focus ring. Consumers can add classes.
- **Potential UX impact:** Focus appearance can vary or be missing in some uses.
- **Recommended improvement:** Define visible focus as a reusable component state in both themes.
- **Required validation:** D-11/D-22 keyboard and computed-style review; source alone does not establish a runtime WCAG failure.

### UX-09 — Error associations differ

- **Finding ID:** UX-09
- **Classification:** Verified source behavior; accessibility inconsistency.
- **Source path and line reference:** [src/features/auth/components/login-form.tsx:L103–L169](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/auth/components/login-form.tsx#L103-L169); [src/features/projects/components/project-form-fields.tsx:L39–L58](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/components/project-form-fields.tsx#L39-L58).
- **Observed behavior:** Login uses aria-invalid with inline errors, without the explicit described-by association used by project fields.
- **Potential UX impact:** Error context may be less consistent for assistive technology.
- **Recommended improvement:** Standardize label/help/error association and submit announcements.
- **Required validation:** D-11/D-22 form review and later assistive-technology testing.

### UX-10 — Board density and tablet behavior

- **Finding ID:** UX-10
- **Classification:** Verified source behavior; responsive usability hypothesis.
- **Source path and line reference:** [src/features/tasks/components/project-tasks-board-screen.tsx:L400–L470](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/components/project-tasks-board-screen.tsx#L400-L470); [src/features/tasks/constants/task-statuses.ts:L1–L44](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/constants/task-statuses.ts#L1-L44); [src/features/tasks/hooks/use-is-desktop.ts:L1–L27](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/hooks/use-is-desktop.ts#L1-L27); [src/features/tasks/components/create-task-modal.tsx:L112–L137](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/components/create-task-modal.tsx#L112-L137).
- **Observed behavior:** Desktop uses eight horizontally scrollable status columns; mobile uses a list. Board switches at 1024px, while task dialog changes use md.
- **Potential UX impact:** Offscreen statuses and intermediate tablet combinations may complicate scanning.
- **Recommended improvement:** Specify board overview, scroll cues, mobile status comprehension and deliberate tablet composition.
- **Required validation:** D-07/D-17/D-21/D-22 at 375, 768, 1023, 1024 and 1440 CSS px, with zoom, long text and software keyboard.

### UX-11 — Reduced-motion treatment varies

- **Finding ID:** UX-11
- **Classification:** Verified source behavior; motion coverage inconsistency.
- **Source path and line reference:** [src/components/shared/authenticated-layout/mobile-drawer.tsx:L117–L155](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/components/shared/authenticated-layout/mobile-drawer.tsx#L117-L155); [src/features/statistics/components/statistics-loading-state.tsx:L5–L14](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/statistics/components/statistics-loading-state.tsx#L5-L14); [src/features/tasks/components/task-board-mobile-screen.tsx:L115–L125](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/components/task-board-mobile-screen.tsx#L115-L125); [src/features/epics/components/epic-tasks.tsx:L50–L65](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/epics/components/epic-tasks.tsx#L50-L65).
- **Observed behavior:** Drawer/statistics and epic-task loading patterns include preference-aware behavior; inspected mobile task skeleton uses unconditional animate-pulse.
- **Potential UX impact:** Some loading animation may remain active for reduced-motion users.
- **Recommended improvement:** Define static loading alternatives and uniform motion policy.
- **Required validation:** D-20/D-22 reduced-motion review of loading, hover, overlays and board feedback; animation was not measured.

### UX-12 — Keyboard movement and focus handling

- **Finding ID:** UX-12
- **Classification:** Verified source behavior; positive reusable pattern.
- **Source path and line reference:** [src/features/tasks/utils/task-board-sensors.ts:L1–L80](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/utils/task-board-sensors.ts#L1-L80); [src/features/tasks/components/task-board-drag-drop.tsx:L80–L108](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/components/task-board-drag-drop.tsx#L80-L108); [tests/ui/focus.browser.test.ts:L1–L35](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/tests/ui/focus.browser.test.ts#L1-L35).
- **Observed behavior:** Board implements pointer/touch and keyboard sensors with announcements; focus fixture targets drawer and nested dialogs.
- **Potential UX impact:** These support operability without establishing full accessibility.
- **Recommended improvement:** Retain keyboard alternatives, focus containment/return and announcements in handoff requirements.
- **Required validation:** D-20/D-22 screen-reader, keyboard and real-device checks; tests inspected, not run.

### UX-13 — Invitation visibility differs from helper rules

- **Finding ID:** UX-13
- **Classification:** Verified source behavior; conditional UI question.
- **Source path and line reference:** [src/features/projects/components/project-members-screen.tsx:L37–L44](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/components/project-members-screen.tsx#L37-L44); [src/features/invitations/utils/can-invite-project-member.ts:L1–L23](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/invitations/utils/can-invite-project-member.ts#L1-L23).
- **Observed behavior:** Members UI requires an owner/admin/member record to expose invite. Separate helper also permits a project creator without a membership record, except viewer.
- **Potential UX impact:** If creator-without-membership is reachable, visible actions may differ from permission expectations.
- **Recommended improvement:** Reconcile conditional UI with the approved role model, without broadening permissions based on this audit.
- **Required validation:** D-02 verifies membership guarantees; D-05/D-15 map resulting conditions.

### UX-14 — Overdue metric time scope

- **Finding ID:** UX-14
- **Classification:** Documented limitation; not independently verified.
- **Source path and line reference:** [README.md:L165–L170](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/README.md#L165-L170); [src/features/statistics/components/statistics-summary.tsx:L1–L73](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/statistics/components/statistics-summary.tsx#L1-L73).
- **Observed behavior:** README states overdue counts are independent of the selected range and may exceed that range's total. Summary displays total/completed/overdue together.
- **Potential UX impact:** Readers may compare values with different time scopes.
- **Recommended improvement:** Verify metric definitions and communicate scope near approved metrics.
- **Required validation:** D-02 contract semantics; D-03 metric approval; D-18 comprehension review.

### UX-15 — Independent section recovery

- **Finding ID:** UX-15
- **Classification:** Verified source behavior; positive reusable pattern.
- **Source path and line reference:** [src/features/statistics/components/my-statistics-screen.tsx:L48–L127](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/statistics/components/my-statistics-screen.tsx#L48-L127); [src/features/statistics/hooks/use-statistics-data.ts:L109–L125](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/statistics/hooks/use-statistics-data.ts#L109-L125).
- **Observed behavior:** Calendar and projects expose independent loading/error/success branches and retries.
- **Potential UX impact:** Partial availability can preserve useful context.
- **Recommended improvement:** Retain section-level recovery instead of replacing all content.
- **Required validation:** D-18/D-19 matrices and later independent failure injection.

### UX-16 — Touch scrolling versus dragging

- **Finding ID:** UX-16
- **Classification:** Verified source behavior; mobile interaction hypothesis.
- **Source path and line reference:** [src/features/tasks/utils/task-board-sensors.ts:L9–L15](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/utils/task-board-sensors.ts#L9-L15); [src/features/tasks/components/task-board-drag-drop.tsx:L285–L320](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/components/task-board-drag-drop.tsx#L285-L320).
- **Observed behavior:** Touch activation uses a 250ms delay and 5px tolerance; mobile status targets appear during dragging.
- **Potential UX impact:** Scroll, tap-to-open and drag gestures may compete on small touchscreens.
- **Recommended improvement:** Preserve nondrag status editing and explicit move/cancel feedback.
- **Required validation:** D-17/D-21/D-22 real-device scroll, long press, cancellation and target testing; no touch defect reproduced.

## Reusable design lessons and retain/reconsider decisions

| Topic | Retain | Redesign or specify for Orbit | Later work |
|---|---|---|---|
| Architecture | Feature ownership, shared shell, server boundary, schemas and explicit states | Shared interaction contracts; evaluate custom data synchronization after scope approval; copy no implementation | D-03–D-06, later implementation planning |
| Arabic RTL / English LTR | Central navigation and semantic content structure | Arabic font/metrics, logical directions, mixed identifiers/numbers, directional icon exceptions and localized date/week rules | D-10, D-12, D-22 |
| Light / dark | Semantic surface/text/status roles | Two modes, contrast, focus, elevation, charts and disabled/error states | D-09–D-12, D-22 |
| Desktop / tablet / mobile | Deliberate board/list, shell and modal/sheet variations | Intermediate widths, scroll cues, long text, safe areas, software keyboard and zoom | D-07, D-13–D-19, D-22 |
| Forms and feedback | Validation, error recovery, pending states, partial-error handling | Consistent associations, focus, saving/close policy and incremental recovery | D-06, D-11, D-19 |
| Accessible interactions | Keyboard alternatives, announcements, focus containment and return | Consistent overlay stacking and action visibility; nondrag operation | D-05, D-11, D-17, D-22 |
| Motion | Preference-aware transitions already present in some patterns | Static reduced-motion alternatives; documented timing/easing and feedback independent of animation | D-20–D-22 |
| Editable Figma reuse | Components based on shared behavior and semantic variants | Shell/navigation, cards, fields, badges, feedback, pagination, dialogs/sheets, range picker and calendar summaries, bound to tokens | D-10–D-12, reused in D-13–D-19 |

Create an original visual language following Calm & Premium + Professional Workspace. Figma is the source of truth; full design approval still precedes frontend development. These are design implications, not generated screens or approved feature additions.

## Known limitations and risks

- Static branches establish intended behavior, not live usability, computed styles, backend permissions or data guarantees.
- Screenshots were not visually audited; deployed app and original Figma were not inspected. Pixel/contrast/touch/RTL/theme QA remains outstanding.
- All page/layout modules and major referenced UI/hook paths were inspected; tests and API implementations were sampled. This is not exhaustive security, dependency, test or API-contract review.
- Original README documents missing reproducible backend setup, authorization limitations and unverified design-reference licensing. These are attributed statements, not independently reproduced findings: [README.md:L90–L94](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/README.md#L90-L94); [README.md:L165–L174](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/README.md#L165-L174).
- No separate workspace selector, role-management editor, pending-invitations page or task-detail page was found in the page-route tree. Do not infer missing backend capabilities from absent routes.
- Runtime reproduction, actual role guarantees, reference licensing and Orbit scope remain unresolved.

## Questions reserved for D-02 API Audit

1. Which sanitized contracts/Postman samples are authoritative, and how do they map to observed screen data/actions?
2. Which roles and project-creator membership guarantees control read/create/edit/invite? Resolve UX-13 without treating UI helpers as contract authority.
3. Which statuses/transitions, editable fields, validation limits, assignee/epic relationships and date rules are supported? Are legacy values possible?
4. What pagination totals, empty responses, partial failures and stale data can occur? What safe retry guarantees exist for uncertain writes?
5. Which recovery/invitation redirects, expired-session states and invalid-link categories require distinct feedback?
6. How are overdue, completed, calendar and per-project counts scoped and filtered?
7. Which documented authorization limitations remain in the actual backend?

These questions do not constitute D-02 execution; no backend requests or uploaded API samples were processed.

## Scope decisions reserved for D-03

- Confirm which reference capabilities/candidate backlog areas belong in Orbit and whether a separate workspace entity is required.
- Approve roles and permission flows from D-02 evidence; explicitly exclude/defer unsupported concepts.
- Approve terminology, workflow statuses, fields, editing/save policy and statistics/calendar meaning.
- Confirm Arabic typography/date/week conventions while preserving mandatory bilingual, both-theme, desktop/mobile and reduced-motion gates.
- Verify reference-asset rights; default to independent assets.
- No later task is added, removed or completed by this audit.

## Review disposition

D-01 is REVIEW, not DONE. Owner acceptance is required. Findings needing later validation are explicitly classified. Stop here; do not start D-02 automatically.
