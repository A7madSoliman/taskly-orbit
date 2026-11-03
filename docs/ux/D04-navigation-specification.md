# D-04 — Navigation Specification

## Owner acceptance — D04-v1

Status: DONE — bounded owner acceptance recorded in the conversation.

D04-v1 is accepted by the project owner as the bounded Information Architecture and Navigation baseline. Global: Projects and conditional Statistics. Current Project: Tasks (default), Epics, Members, Project details. Utilities: language/appearance controls and Sign out. Desktop uses a labeled sidebar; tablet/mobile use a unified drawer with consistent LTR/RTL hierarchy. This is not final Figma or backend behavior approval.

Validate frequent mobile navigation in D-07/D-21. Exact bilingual terminology remains reviewable; language/theme placement remains unresolved. Deep-link restoration is a design intent, not a verified router/backend guarantee. DEC-05, DEC-06, DEC-07, DEC-08, DEC-11 and DEC-12 remain unresolved; all 17 backend gaps remain OPEN; F-17 through F-20 remain deferred. Earlier pending-acceptance wording below is superseded only within this bounded acceptance. D-05 through D-23 remain TODO. No Figma or frontend work has started.

Status: REVIEW — D04-v1 documentation proposal, 2026-10-28; owner navigation acceptance pending.

## Baseline and invariant hierarchy

Use the [D-04 IA](D04-information-architecture.md) for all 19 surface dispositions, bilingual terminology proposals, alternatives, six unresolved owner decisions and all 17 OPEN backend gaps. [D03-v1 scope](../product/D03-product-scope-requirements.md) and [surface matrix](D03-screen-scope-matrix.md) govern scope; [D-01 audit](../product/D01-architecture-ux-audit.md), [inventory](D01-screen-interaction-inventory.md) and [D-02 mapping](D02-ui-action-api-mapping.md) provide static evidence, not runtime guarantees. The owner confirmed the execution request as the complete approved planning baseline. All rules below are design requirements/proposals, not implemented behavior.

| Group | Ordered contents | Invariant |
|---|---|---|
| GLOBAL | Projects; Statistics (conditional) | Available independently of selected project; Statistics inclusion remains held |
| CURRENT PROJECT | Tasks; Epics; Members; Project details | Explicit validated context; Tasks is default project landing |
| UTILITIES | Language and appearance controls; Sign out | Not content destinations; sign out authenticated-only |

No separate workspace backend entity, global search, scheduling or role-management functionality. No inferred universal permission rule. Utility placement is proposed, not closure of DEC-11. All six unresolved decisions and 17 gaps in the [IA hold registers](D04-information-architecture.md#unresolved-owner-decisions--all-remain-open) remain open and apply here; hold only affected behavior.

## Responsive structural behavior

Reference widths are review samples, not finalized breakpoints. D-07 must determine content-driven thresholds; do not implement a hard 1024px switch from this document.

| Composition | Structure and hierarchy | Content/overlay adaptation |
|---|---|---|
| Desktop; review 1024 and 1440 CSS px | Persistent labeled sidebar at logical start; explicit GLOBAL, CURRENT PROJECT identity/links, UTILITIES. Main content at logical end; no icon-only default | Page heading/breadcrumb and scoped toolbar in main area. Board can scroll within content with overview/scroll cues; sidebar must not conceal columns. Details panel/dialog fits available space |
| Tablet; review 768 and 1023 CSS px | Compact header with labeled navigation trigger, current-project name or selection cue, current destination. One unified drawer with same groups/order; no split mobile/desktop menus | Deliberate touch-friendly list/board decision, not accidental breakpoint crossover. Reflow toolbar; details use bounded touch panel or full-height surface if needed; avoid competing nested scroll regions |
| Mobile; review 375 CSS px | Compact header and unified drawer; project context and destination remain discoverable outside drawer. No automatic bottom navigation | Status-oriented task list, scoped search beneath heading, stacked controls, full-height task/epic detail/form where necessary. Safe-area padding and software-keyboard clearance; close/submit remain reachable |

At all samples review both directions/themes, longest Arabic/English labels, long project names, mixed IDs, empty/failed context, text zoom and keyboard visibility. Wrap group/section labels; allow sidebar/drawer scrolling without losing close access. Never shrink type to make labels fit. A truncated user title needs an accessible full-name route, not hover-only recovery. At 1023/1024 specifically review continuity of context/focus, not a required one-pixel layout jump. On resizing an open drawer into persistent navigation, release modal containment/scroll lock and place focus on the equivalent destination or heading if its trigger disappears. Preserve the same conceptual selection and do not reopen a closed drawer automatically.

## Project context, selection and switching

Project name is a context label, not a second workspace account. Projects collection OP-08 and scoped detail OP-24 support selection/context; IDs and relation mapping remain G-10 qualified. A project selection control may route to Projects rather than introduce an unevidenced searchable switcher. Primary proposal: labeled Switch project action opens Projects; choosing a project opens its Tasks. This makes the selector scalable through existing paging without inventing a project search API.

When no project is selected, CURRENT PROJECT shows Select project guidance instead of links with empty IDs. Context loading shows a labeled loading state, not the previous project's name. Context failure provides read retry and Projects; never render an editable blank project. Project switching must clear old project entity selections, assignment options and pending stale results. Dirty/pending work follows the close policy before an in-app switch; no automatic cross-project draft transfer.

Global pages do not inherit a project filter implicitly. The active project section is absent there. Explicit Project details links go to OR-S08; project-card default selection goes to Tasks OR-S15. Switching project resets to Tasks, not a remembered peer section. A validated explicit deep link retains its section rather than being overwritten by the default. No cross-session last-project retention is guaranteed. Confirmed project creation returns to Projects because OP-09 does not guarantee a created ID; do not guess a destination from a matching name. Epic creation returns to Epics; task creation returns to its actual Tasks/epic origin after operation-qualified confirmation, without guaranteeing visibility under current filters.

## Active navigation and breadcrumbs

Only the actual destination is current; separate current-project identity from active-link styling. GLOBAL Projects is current on its collection/create flow; in project context it may be an ancestor cue but not a second `aria-current="page"`. CURRENT PROJECT Tasks is current for board/list and task details/create from Tasks; Epics is current for epic collection/create/detail and task overlays entered from that epic. A direct task detail without epic-origin history uses Tasks as parent; an epic relationship alone does not fabricate navigation history. Members remains current while invite is open; Project details remains current during field edits. Statistics is current only when its conditional surface is open. Utilities show selected language/theme values, not current-page styling.

Breadcrumb examples are conceptual, not URL contracts:

- Projects → project name → Tasks; Projects → project name → Members; Projects → project name → Project details.
- Projects → project name → Epics → epic title.
- Task from Tasks/direct entry: Projects → project name → Tasks → task label.
- Task entered from epic: Projects → project name → Epics → epic title → task label, only while verified epic-origin context exists.
- Global Statistics: Statistics, without a false current-project ancestor.

Project-name breadcrumb targets the proposed Tasks landing; use an accessible name clarifying that destination. Ancestors are links, current item is text with current-page semantics, separators are decorative. On narrow screens retain an explicit nearest-parent action and current title; collapse distant ancestors into an accessible disclosure if necessary, never remove Projects access. Unavailable entity names use a neutral details label without inventing a title or exposing raw sensitive values.

## Search placement and preserved context

Search is inside the current collection toolbar, not the shell header. Tasks: title search and evidenced status filtering via OP-19. Epics: scoped title search via OP-14, no invented task-style filters. Label scope explicitly (Search tasks / Search epics); no global, project-wide, member or switcher search API is assumed. Clear query and filters explicitly; distinguish no matches from a genuinely empty collection. Query semantics, totals, paging and wildcard behavior remain G-11 holds.

Within the active navigation interaction, preserve origin project, collection query, evidenced filters, loaded page/range, list/board presentation, scroll anchor and trigger identity when opening/closing details or contextual creation. Store only non-sensitive navigation state if later implementation supports it; this is a UX requirement, not a promise of reload/offline/cross-device restoration. Changing query/filter starts the relevant result range anew; incremental failure retains loaded results and exposes explicit read retry without clearing scope. Returning after a change revalidates the affected content; if an item no longer matches, explain its absence rather than clear the user's filter. When original anchor is gone, focus the collection heading/nearest stable item and preserve query. A fresh direct entry without valid origin state uses its safe parent defaults, not fabricated prior filters. Switching project must not leak the previous project's results or silently apply its query; no durable per-project history is committed.

Statistics controls belong to their independently labeled sections: OP-27 dates plus supported project/status filters; OP-28 dates only. Keep section-level retry and no invented synchronized filter behavior. Source inclusive 1–7-day range remains qualified by unresolved date/metric decisions.

## Overlay lifecycle and pending close

| Surface | Open/focus ownership | Close and return |
|---|---|---|
| Unified drawer | Header button with expanded/controls state; focus current link or first useful control; background inert, body scroll locked, drawer scrollable | Explicit close, Escape or backdrop dismisses; choosing destination closes after accepted navigation. Ordinary dismissal returns trigger focus; successful navigation focuses destination heading. Drawer itself adds no history entry |
| Display controls OR-S19 | Labeled utility button; selected language/theme announced | Escape/outside/close returns trigger; selection retains meaningful focus after direction/theme change; default/retention policy remains open |
| Invite OR-S10 | Eligible Members action → named dialog; focus input or introductory context | Pristine close/Escape/backdrop returns invite trigger; dirty/pending policy below. No role picker or delivery confirmation |
| Epic/task details OR-S14/OR-S17 | Card/link → named panel/dialog; focus title/loading context, not an arbitrary editable field | Close returns exact origin and trigger if available. Direct entry uses explicit safe parent action. Preserve origin query/scroll |
| Create task OR-S16 | Tasks or epic action → named form; focus introductory field/context | Cancel draft returns actual origin; pending/uncertain rules apply. Epic origin is not lost |
| Date-range/assignment popup | Labeled trigger; documented keyboard selection; only top popup owns keys | Escape cancels uncommitted popup selection and returns trigger; range Apply commits the range, while assignment selection remains a field draft until explicit Save. No date convention finalized here |
| Dirty-close confirmation | Requested in-app navigation/close with unsaved draft → topmost confirmation | Keep editing is safe default; Discard changes discards local draft only. Explicit field Save remains in editor; no bulk-save/atomic promise |

Create project/epic forms follow the same dirty/pending navigation protection even when presented as pages. Explicit field Save/Cancel applies to project/epic/task editing. One epic field per browser PATCH; project update can require current companion field. Close never triggers blur autosave.

For pending submissions/saves, temporarily prevent duplicate submission and in-app dismissal/switching, announce Saving/Submitting and why close is unavailable. This is a bounded request-state proposal, not permanent trapping: if result becomes unavailable/uncertain, expose uncertain feedback and explicit leave/keep-reviewing options; do not auto-retry or claim cancellation of a server write. A failed save keeps the draft; an uncertain result requires operation-specific read reconciliation before any deliberate repeat. Read reconciliation can fail or be insufficient to identify a created item; do not guarantee recovery or infer absence. Submitted-write cancellation is not undo. DEC-14 safety principles are accepted, but final operation-specific outcomes remain G-09 holds.

For epic → task nesting, only the top task surface is interactive and modal; suspend parent focus handling. Closing the task restores epic task trigger and parent scroll/context. Do not accidentally close both on one Escape. A dirty confirmation becomes the top owner and returns focus to the requesting surface. Close/backdrop/Escape never bypass pending/dirty rules. The same ownership applies in full-height mobile compositions; do not stack competing focus traps.

## Direct-entry, deep-link and safe parent intents

Deep-link support is a design intent, not an existing frontend route guarantee. No Orbit URL/query syntax or new endpoint is prescribed. Static source supports project-scoped reads OP-24, OP-16 and OP-29, not universal resolution of an arbitrary bare task/epic ID. Later route design must carry or safely establish the required canonical project/entity context; never scan all projects or infer identity from a display code/title. Reload/serialization of overlay selection must be verified later.

| Direct intent | Resolution boundary | Safe parent when no valid origin |
|---|---|---|
| Project landing | Validate session/project context; Tasks default | Projects if project cannot be established |
| Project details | OP-24 with known project context; OP-10 eligibility separate | Project Tasks if readable context exists, otherwise Projects |
| Epic details | Known project and epic IDs; OP-16; associated tasks OP-20 independently | Same project's Epics; otherwise Projects |
| Task details | Known project and task IDs; OP-29, independent canEdit | Same project's Tasks; do not assume linked epic was entry origin; otherwise Projects |
| Invitation | Validate available input; OP-13 after authentication; no preview guarantee | Confirmed supplied/readable project → Tasks; otherwise Projects |
| Recovery/reset | OP-25/OP-26 context first; no ordinary protected deep-link treatment | Recovery request or Sign in as supported; final outcomes held |
| Conditional Statistics | Only cleared conditional capability; independent scope labels | Explain unavailable module and offer Projects |

Render direct-entry details as a self-contained titled surface with parent navigation, not an empty/dimmed nonexistent background. If a verified collection background exists, overlay presentation can reuse it. Missing/mismatched context blocks affected data/actions and offers safe navigation; do not expose another project's labels or substitute a guessed entity. An unreachable parent falls back to Projects; if Projects also fails, retain shell/global retry and Sign out rather than loop. Do not fetch privileged parent information simply to fill breadcrumbs.

## Browser Back versus in-app Back

Browser Back follows real history and may leave Orbit; do not replace it with guessed parent navigation or manufacture a false origin. In-app Back/Close uses captured valid origin; without it, label the actual safe parent (Back to Tasks/Epics/Projects). Ordinary drawer/utility popup dismissal is not a browser history step.

Proposed entity-selection history intent: opening a detail from a collection should permit Back to restore that origin and Forward to reopen the detail if valid. Nested epic → task Back should close task first, then epic, retaining each context. This depends on later route/history support and is not a verified restoration guarantee. Direct-entry Back must not assume an internal previous page; use the explicit parent action for predictable in-app recovery. Final canonical paths/history serialization are later implementation decisions, not backend changes.

In-app navigations honor dirty/pending protection. Browser navigation/reload/tab close cannot be guaranteed interceptable or draft-preserving; a native unsaved warning may be considered where supported, without promising custom dialogs, blocked exit or persistent drafts. Never replay a pending mutation after Back/Forward. On history reentry revalidate session, project/entity access and conditional availability before exposing content. Internal auth/alias redirects should avoid loops/redundant history entries; no infinite refresh retry.

## Session restoration and destination precedence

1. Check session before exposing protected data. Refreshable → explicit restoring feedback via existing OP-05 path; OP-03 remains internal verification, not a user-profile API.
2. After confirmed restoration, prefer the safe requested destination if context and access remain valid. General entity deep-link continuation across authentication is a design intent requiring verification; do not promise arbitrary return support from invitation-only source evidence.
3. Valid invitation return stays in OR-S11 until explicit acceptance; never auto-accept on login. Recovery context is separate from ordinary session continuation.
4. Without a safe requested destination, authenticated entry goes to Projects; no automatic last-project or last-overlay restoration. A specifically selected project goes to Tasks.
5. Rejected/expired session returns to Sign in with non-sensitive guidance. Unavailable restoration gives retry/Sign in without an infinite refresh loop or asserting expiry solely from a transport error. Any return target must be internal/allowlisted and context-validated; reject unsafe external redirects.

Do not guarantee session duration, cross-device continuity, confirmation, delivery, durable drafts, preference persistence or remote logout revocation. DEC-08/G-13 hold final branch copy and outcomes; unaffected shell design continues. On confirmed local logout remove protected interaction context from the visible UI; Back must recheck access, not reveal cached protected content as authorized.

## Missing, denied and unavailable states

| Condition | Navigation/recovery requirement | Evidence caution |
|---|---|---|
| Project context loading/error | Keep global navigation and a contextual loading/retry explanation; Projects remains reachable | No stale previous-project identity |
| Missing entity | Explain only what the scoped contract establishes; offer safe parent and Projects | OP-24/OP-16/OP-29 missing evidence does not prove deletion |
| Confirmed denied/readonly | Explain restriction where justified; retain permitted read/parent navigation; no edit controls as active capability | Roles alone do not establish rights; no request-access workflow invented |
| Permission unknown | Neutral checking/unavailable state; retry evidenced read; do not treat absence of canEdit as true | Unknown is not false/denied; G-04 applies |
| Missing versus denied indistinguishable | Neutral unavailable-details explanation with safe parent | No existence disclosure or unsupported cause |
| Network/service unavailable | Retain safe loaded content with clear unavailable/stale scope where appropriate; explicit read retry | No automatic mutation replay or false session-expiry claim |
| Empty/no-match | Collection-specific guidance; clear search/filter for no-match | Zero members remains valid-empty/restricted/inconsistent alternatives under G-15 |
| Partial/incremental failure | Keep useful content, scope and scroll; local retry | G-11/G-16; no fake totals or universal paging capability |
| Optional relation unavailable | Preserve current value/neutral unavailable label; retry options | No silent clearing of assignee/epic or ID substitution |

## Keyboard accessibility and focus

WCAG 2.2 AA is the accepted design review target (DEC-10), not a certification. Use header/navigation/main landmarks, separately labeled global/project navigation, and a skip-to-main link. Real destinations use links; toggles/actions use buttons; ordinary navigation is not an application menu with forced arrow-key behavior. Tab/Shift+Tab follows logical reading order; Enter activates links, Enter/Space buttons. No hover-only actions or required drag gestures. Maintain visible focus and ensure sticky headers/keyboard do not obscure it. Target touch controls at least 24×24 CSS px or meet WCAG spacing exceptions; prefer comfortably larger primary navigation targets.

Use current-page semantics for the actual destination, expanded/controls for disclosures, selected-value semantics for display choices. Modal surfaces have accessible names, contained Tab order, inert background and topmost Escape ownership. Nonmodal popovers use their appropriate pattern without unnecessary modal traps. Closed overlays must not remain focusable. On route navigation focus the main heading and announce destination/context; ordinary read retries/result additions announce updates without stealing focus. Error summaries/field errors have associated labels/help and meaningful first-error focus. If an origin trigger disappeared, focus a stable parent heading/action. Preserve focus meaning after locale/theme switch and viewport change, not just a stale DOM position.

Tasks require a keyboard/non-drag status action with text/announcements for pending, confirmed and uncertain states; eligibility/destinations remain conditional on DEC-07/G-08. Scrolling has priority over accidental touch dragging. Navigation success, authorization and saved status cannot depend solely on color, movement or a toast.

## Arabic RTL and English LTR

Use document language/direction and logical inline-start/inline-end rules for sidebar/drawer placement, padding, borders, alignment, breadcrumb flow and focus order. LTR sidebar/drawer begins at left; RTL begins at right as a consequence of logical start, not separate physical positioning. Keep semantic DOM/reading order consistent; do not double-reverse with CSS and reversed content arrays. Directional Back/forward chevrons reflect navigation direction; keyboard expectations follow the actual control pattern, not blanket reversal of all keys.

Do not automatically mirror non-directional icons (search, appearance, member/task symbols), identifiers, brand elements, logos or user content. Mixed Arabic/English project names, task codes, numerals and punctuation need bidirectional isolation such as `bdi`/explicit fragment direction. Canonical IDs and API status keys remain unchanged; translate display labels separately. Account/password inputs and code fragments retain appropriate intrinsic direction while surrounding labels follow UI direction. Do not translate user-authored titles automatically.

Allow Arabic label expansion, multiline navigation labels and appropriate line height without clipping diacritics or forcing small text. Test long Arabic labels alongside Latin task codes and numbers at every reference width. Truncation must retain accessible full names and distinguish similarly named projects. Keep language choice recognizable as العربية / English. Date/timezone/week-start/calendar/numeral conventions remain DEC-12; switching language must not silently choose a new date policy.

## Light/dark semantic navigation states

Specify editable semantic roles later, not fixed palette values here. Both light and dark must independently cover navigation surface, elevated drawer/popover, scrim, primary/secondary text, border/divider, hover, pressed, current destination, focus-visible, disabled, readonly, pending and error/unavailable. Current destination uses a shape/indicator plus label treatment and semantic current state, not color alone. Focus must remain distinct from current/hover and visible over every surface. Disabled/unknown/readonly states must remain distinguishable, with explanatory text where needed; never encode permission as a status color.

Review normal text contrast at least 4.5:1, qualifying large text 3:1, and meaningful UI boundaries/focus indicators 3:1 against adjacent colors where WCAG requires it. Review focus-not-obscured and contrast in both themes, not inferred from token names. No actual palette/contrast measurement or rendered QA is claimed in D-04. Do not invent numeric badges/counts while loading. Language/theme changes preserve navigation identity, selection and readable focus; defaults, system-following and retention remain DEC-11.

## Motion and reduced-motion requirements

Drawer/panel transitions may orient users but must not delay access, closing or focus. No essential information depends on travel, animation, count-up or pulsing. Respect reduced-motion preference across drawer, overlays, loading, hover, success/error and board feedback: use immediate/static transitions, static loading labels/placeholders and textual announcements; remove sliding, scaling, parallax and animated reorder effects. Preserve identical destinations, ownership and pending/error information. Do not wait for animation completion before releasing focus/scroll locks. No indefinite decorative motion, flashing or automatic focus movement. D-20 will set durations/easing; none are finalized here.

## Required prototype review scenarios — not yet executed

| Scenario | Review method / acceptance evidence to record later |
|---|---|
| Frequent mobile peer switching | At 375 CSS px, Tasks → Epics → Members → Tasks, repeat while checking a task/epic and roster; include project switch mid-sequence in Arabic/English. Record taps, time, errors, context recognition and perceived effort; establish acceptance thresholds with owner before testing. Primary drawer must remain discoverable and preserve correct project. Do not automatically add bottom navigation; bring alternatives back only if evidence justifies review |
| Direct entry and Back | Open project/task/epic intents with no internal history, then with valid origin; test nested task Back/Forward, missing parent, wrong project, expired session, unsafe return target and no invitation destination. Record actual supported restoration versus fallback; do not simulate backend success without labeling it |
| Responsive continuity | Review 375, 768, 1023, 1024, 1440 CSS px, zoom, keyboard and orientation/resizing; verify no hidden destinations, clipped labels, lost focus or competing drawers |
| Bilingual/theme/input | Both themes and directions with long Arabic/Latin mixed names/IDs; keyboard-only and screen-reader traversal, nested focus return, readonly/unknown, reduced-motion static loading and pending close |
| Scoped collection return | Search/filter → detail/create → return; item stops matching, incremental retry, origin disappears, project switch and fresh reload; verify only supported context is retained |

These are later D-07/D-21/D-22 validation inputs, not authorization to start those tasks or D-05. Owner must accept the navigation/glossary proposal; unresolved holds remain visible. No Figma file, frontend implementation or backend change was performed.
