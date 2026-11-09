# D19 — Feedback & Permission States

Status: REVIEW — bounded static QA PASS, pending explicit owner design acceptance. D19-v1 review candidate, 2026-11-09. This is one cross-product feedback reconciliation, not a redesign or full-product approval. D20 is not started.

## Sources and boundaries

[D06 accepted 19-surface matrix](../ux/D06-screen-state-matrix.md) governs state meaning and applicability. Reused accepted [D10 foundations](D10-design-foundation.md), [D11 library](D11-component-library.md), [D12 direction/theme rules](D12-bilingual-theme-rules.md), and design-only acceptances in [D13](D13-authentication.md), [D14](D14-projects.md), [D15](D15-members-invitations.md), [D16](D16-epics.md), [D17](D17-tasks.md) and [D18](D18-statistics.md). Their accepted responsive/state QA remains evidence; D19 does not repeat the 278-state audit.

Existing Figma file: `o5x1eCbKM7xPx7SKB0hsI9`. [D19 review page 302:2](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-2). No approved source page, screen, master, brand, token or style was modified. All new content is a bounded state specimen or compact component QA instance, not an additional product route or duplicated screen. No new component family was needed.

## Concise coverage matrix

Every cell maps to accepted handoff/state evidence indexed below, or the D19 shell specimens. **C** means conditional on separately established context/capability, never an implemented permission claim. **N/A** means genuinely outside the owning surface; qualified missing optional values are not collection-empty states. Read success means readable returned content, not a success toast or persistence guarantee. Reconciliation after another surface's uncertain write is a read, not a write on the collection surface.

| Surface | Loading / Pending | Empty / No matches | Error / Retry | Success / Confirmation | Denied / Readonly | Unknown eligibility | Uncertain write | Recovery / Safe return |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| OR-S01 Sign in | Submit pending | N/A: form | Validation / explicit rejection | Qualified sign-in; destination unchecked | N/A: public form; destination gate S05 | C: destination gate S05 | Session may exist | Correct / recovery / safe continuation / dirty exit |
| OR-S02 Sign up | Submit pending | N/A: form | Validation / definite rejection | Request acknowledged; offer Sign in | N/A: public form | N/A: no role choice | Account may exist | Sign in / recovery; no repeated signup promise |
| OR-S03 Recovery request | Sending | N/A: form | Validation / explicit failure | Generic acknowledgement; no delivery proof | N/A: public form | N/A: no account-existence probe | Request may have completed | Sign in / supported independent recovery entry; resend held |
| OR-S04 Password reset | Bootstrap / context checking / saving | N/A: form | Check unavailable versus invalid context; update rejection | Qualified acknowledgement, not sign-in | C: context restriction, not role inference | Recovery-context eligibility | Bootstrap and update distinguished | Sign in / new independently supplied context / dirty exit |
| OR-S05 Shell / navigation | Session / refresh / project / sign-out / editor guard | No selected project; no matches N/A | Separate verifier, context and sign-out failures | Refresh acknowledgement / local sign-out only | C: established restriction / permitted read only | C: separate from denied | Refresh / sign-out / originating editor | Existing check, scoped read, Projects, Sign in; actual-origin focus |
| OR-S06 Projects | Initial / incremental / selection resolution | Valid zero; no matches N/A: no evidenced search | Initial / incremental / reconciliation read | Returned collection, not create confirmation | C: established context/session restriction | Create eligibility | N/A: read; S07 creation reconciliation retained | Retry same read / safe selection / session path |
| OR-S07 Create project | Submission / exit guard | N/A: form | Validation / explicit rejection | Message acknowledgement; no created ID promise | C: established create restriction | Conditional create eligibility | Project may exist | Keep draft / Projects read / qualified reconciliation |
| OR-S08 Project details/edit | Detail read / field saving | Optional description fallback; no matches N/A | Read / field rejection / readback failure | Qualified update acknowledgement / observed read | C: read available, editing restricted | Separate from read access | Observed and draft values retained | Explicit Save/Cancel / scoped read / actual origin or safe parent |
| OR-S09 Members | Roster read | C: valid zero under G-15; no matches N/A | Failed roster / deliberate read retry | Readable roster, not invitation success | C: established restriction | Invite eligibility separate from roster | N/A: read; invitation belongs to S10 | Retry / permitted roster / Projects |
| OR-S10 Invite member | Sending / guarded exit | N/A: form | Validation / recognized conflict / rejection | Request acknowledged; no delivery or membership proof | C: established restriction | Invite eligibility | Invitation may have been sent | Review / explicit leave to Members; no automatic resend |
| OR-S11 Invitation landing | Context recheck / acceptance pending | N/A: contextual flow | Invalid context / evidence-qualified rejection, expiry or conflict | Acknowledgement with or without destination; access unchecked | C: explicitly established restriction | Session and acceptance eligibility | Acceptance may have completed | Sign in and safe return if context survives / Projects / safe exit |
| OR-S12 Epics | Initial / incremental read | Valid zero / no title matches | Initial / incremental / reconciliation failure | Returned collection only | C: established restriction | Create eligibility | N/A: read; S13 reconciliation retained | Clear search / retry same scope / actual collection origin |
| OR-S13 Create epic | Submission / member-option read | C: qualified option empty; collection no-match N/A | Validation / options failure / rejection | Qualified acknowledgement; no ID or visibility guarantee | C: established create restriction | Separate from option-read access | Epic may exist | Retain draft / explicit unassigned choice / scoped collection read |
| OR-S14 Epic details | Detail / independent tasks / field / options | Absent optional data / zero associated tasks / qualified options | Independent detail/tasks/options/update/readback failures | Acknowledgement / observed value | C: restricted editing, permitted reads retained | Edit and Create Task eligibility separate | Preserve observed value and draft | Single-field Save/Cancel / scoped read / actual nested parent |
| OR-S15 Tasks / Kanban | Initial / incremental / status pending | Zero tasks / no search-filter matches | Read failure / transition rejection / failed readback | Qualified status confirmation only | C: readonly; no status action | Edit/create/transition rights independent | Keep last confirmed group and status | Clear filters / scoped readback / non-drag action / safe return |
| OR-S16 Create task | Submission / independent member-epic options | Qualified option empties; collection no-match N/A | Validation / independent options failures / rejection | Checked qualified acknowledgement, not durability | C: established create restriction | Create/status/relation eligibility | Task may exist; no automatic repeat | Actual Tasks or Epic origin / qualified collection reconciliation |
| OR-S17 Task details | Read / field saving / independent options | Nullable value fallback / qualified option empties | Read missing/failure / field rejection / readback failure | Checked confirmation / observed read | C: readonly, permitted read retained | Editing and status destinations separate | Draft retained; old status stays confirmed | Explicit Save/Cancel / scoped read / captured Tasks or Epic parent |
| OR-S18 Statistics/calendar | Independent section and option reads | Valid empty rows / returned zero / filter no-data | Section retry / independent partial success | Qualified returned section only; synthetic visuals labeled | C: availability restriction only when established | C: aggregate eligibility not inferred from Projects | N/A: read-only | Retry affected section / retain confirmed scope / textual chart alternative |
| OR-S19 Display controls | N/A: local selection, no request | N/A: fixed evidenced choices | N/A: no asynchronous preference operation | Applied to active interface only | N/A: no permission operation | N/A: no permission probe | N/A: no write | Close/Escape/outside / actual trigger or stable shell focus |

### Evidence index for existing coverage

All node IDs below refer to the same Figma file. Exact per-state links and full responsive matrices remain in the accepted handoffs; this index avoids duplicating those screens or audits.

| Surface | Existing native evidence retained |
| --- | --- |
| S01 | D13: 166:209 pending, 166:235 rejected, 166:266 uncertain, 166:297 confirmed, 168:346 dirty return, 168:371 local signed-out |
| S02 | D13 B02 on page 176:253; rejection 176:973, acknowledgement 176:1029; remaining state and compact links in D13 |
| S03 | D13: 181:620 pending, 181:647 rejection, 181:679 uncertain, 181:711 acknowledged, 181:743 return |
| S04 | D13: 188:466/493 checks, 188:520 invalid, 188:560 unavailable, 188:597 bootstrap uncertain, 188:697 pending, 188:734 rejection, 188:767 uncertain, 188:802 acknowledgement, 188:835 return |
| S05 | D07 notes 4:184; D11 navigation/drawer/decisions; D14 selection 193:621; D13 signed-out 168:371; new D19 state map below |
| S06 | D14: 192:468/490/512 initial states, 192:536/571 incremental, 192:865 unknown, 193:621 selection, 193:651/679 reconciliation |
| S07 | D14: 198:365 pending, 198:416 dirty, 198:465 rejected, 198:514 uncertain, 198:563 acknowledged, 198:612 eligibility, 198:662 reconciliation |
| S08 | D14: 201:254/286/320 reads, 201:352 eligibility, 201:418 pending, 201:457 rejected, 201:504 uncertain, 201:546 acknowledged, 201:606/816 readback |
| S09 | D15: 203:464/484/504 reads, 203:527 unknown, 204:280 restriction |
| S10 | D15: 206:1787 eligibility, 206:1849 pending, 206:1916 dirty, 206:1985/2052 rejection/conflict, 206:2119 uncertain, 206:2188 acknowledged |
| S11 | D15: 209:725 checking, 209:747 eligibility, 209:769 pending, 209:796/818 rejection/restriction, 209:862 uncertain, 209:891/920 acknowledgement, 209:703 safe-return hold |
| S12 | D16: 216:1869/1900/1931 initial/empty/no matches, 216:1962 failure, 216:1995/2030 incremental, 216:2067/2101 access, 220:548/586 reconciliation |
| S13 | D16: 225:639/723/807 options, 225:894 unknown, 225:982 pending, 225:1081 dirty, 225:1183 rejected, 225:1282 uncertain, 225:1384 acknowledged |
| S14 | D16: 233:487/545/603 reads, 233:661/238:1599 access, 233:835/893/951/1009 write outcomes, 233:1125/1183/1241 tasks, 238:1675 safe fallback |
| S15 | D17: 243:2513–2798 read specimens indexed individually in D17, 243:2855/2912 access, 243:2969 conditional choice, 243:3030/3087/3144/3201 status outcomes, 243:3258/3315 readback |
| S16 | D17: 249:3031/3120/3209/3300 outcomes, 249:3389–3865 separate member/epic option specimens indexed in D17, 249:4003/4073 and 253:2011 actual-origin reconciliation |
| S17 | D17: 257:1435/1513/1593 reads, 257:1673/1751 access, 257:1989/2069/2147/2229 outcomes, 257:2307/2385/2467 readback, 260:2337 safe fallback |
| S18 | D18: 288:392/397 calendar read, 290:387/288:404 projects read, 288:411 empty, 288:416 zero, 288:421 retained scope, 290:402/466 partial, 296:1520 text fallback |
| S19 | D11 Display Controls 159:1331 and four-mode verification 159:1332; D12 theme/direction specimens; D19 compact instances below |

## Actual gaps and bounded reconciliation

1. **Shell feedback maturity gap:** session/refresh/sign-out distinctions existed in D06 and D07 notes, but lacked equivalent D10/D11 native feedback specimens. D19 adds operation-specific specimens below, including separate unknown, established denied and readonly labels. They specify conditional appearance and available recovery; no generic permission probe or endpoint is introduced.
2. **Compact display evidence gap:** D11's accepted 360px baseline explicitly left narrower application for content QA. D19 adds linked 320/360/390px Arabic specimens with actual modes and local fill-width/height overrides. No new preference behavior or screen is introduced.
3. **Detached-feedback drift review:** four D11 B09 adaptations and sampled D14 descendants retain identical source semantic paint bindings, geometry bindings and text styles. D17 compact adaptation 252:1968 retains warning surface/foreground bindings, 16px padding, 8px radius and the approved three Inter/Cairo text styles. Renders 158:1233 and 252:1961 show no material drift/clipping. No repair or replacement was warranted. Detached copies still do not inherit future master updates.

No additional missing feedback family or product-specific state was identified in this bounded reconciliation. Existing accepted coverage and conditional holds are not new gaps.

## Exact new Figma nodes

The [D19 page](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-2) contains 30 shell state cards and three linked display-control QA instances. All shell cards reuse Shared Feedback and Button instances, editable copy, Inter/Cairo and native semantic modes. Desktop cards are section specimens, not viewport breakpoints.

| D06 OR-S05 suffix | EN Light desktop 560px |
| --- | --- |
| SESSION-CHECKING | [302:3](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-3) |
| RESTORING | [302:11](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-11) |
| REFRESH-ACKNOWLEDGED | [302:19](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-19) |
| SESSION-REJECTED | [302:29](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-29) |
| SESSION-ERROR | [302:39](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-39) |
| UNCERTAIN (refresh) | [302:53](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-53) |
| NO-PROJECT | [302:65](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-65) |
| PROJECT-LOADING | [302:75](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-75) |
| CONTEXT-MISSING | [302:85](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-85) |
| CONTEXT-ERROR | [302:95](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-95) |
| ACCESS — unknown | [302:109](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-109) |
| ACCESS — readonly conditional | [302:119](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-119) |
| ACCESS — established denied conditional | [302:129](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-129) |
| PENDING (sign out) | [302:139](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-139) |
| SIGNOUT-REJECTED | [302:147](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-147) |
| SIGNOUT-UNCERTAIN | [302:159](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-159) |
| EDITOR-PENDING | [302:171](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-171) |
| EDITOR-UNCERTAIN | [302:179](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-179) |

ACCESS-UNKNOWN/READONLY/DENIED are specimen labels refining the existing conditional OR-S05-ACCESS state, not new D06 state IDs. READY, DRAWER and HISTORY reuse accepted shell/navigation evidence; RETURN reuses D11 Dirty exit and originating editor guards; SIGNOUT-ACKNOWLEDGED reuses D13 168:371. FOCUS-RETURN is specified below, not a separate invented route.

| Representative responsive specimen | Exact nodes |
| --- | --- |
| AR Light 320px: session error / unknown / sign-out uncertain | [302:191](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-191), [302:205](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-205), [302:215](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-215) |
| EN Dark 390px: sign-out pending / rejected / context error | [302:227](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-227), [302:235](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-235), [302:247](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-247) |
| AR Dark 360px: restoring / denied / editor uncertain | [302:261](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-261), [302:269](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-269), [302:279](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-279) |
| AR Light 390px: refresh uncertain | [302:291](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-291) |
| AR Dark desktop 560px: readonly / sign-out rejected | [302:303](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-303), [302:313](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-313) |
| AR Display Controls: 320 Light / 360 Dark / 390 Light | [302:325](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-325), [302:353](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-353), [302:381](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=302-381) |

### Reused native assets

- [Shared Feedback 149:151](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=149-151): operation-specific messages with linked instances; local text columns fill and hug wrapped height. Fixed headings/symbols preserve non-color meaning.
- [Decision Patterns 152:697](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=152-697): accepted dirty/pending/rejected/uncertain/acknowledged states retained in originating journeys; no duplicate decision family.
- [Collection Read State 153:1085](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=153-1085): accepted loading/empty/no-match/failure/incremental specimens retained at their existing surfaces.
- [Button 138:161](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=138-161), Text Field 138:212 and Dialog Shell 152:578 remain authoritative. New cards use existing secondary/focus buttons with local centered full-width content. Only the first recovery action has focus in focused specimens.
- [Display Controls 159:1331](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=159-1331), linked Option Rows and Close buttons; D10 Semantic Colors `118:108` Light `118:1` / Dark `118:2`, existing geometry and EN/AR styles.

## Recovery and safe-operation rules

1. **Read states:** loading is not empty, denied or zero. Retry the affected read and same scope deliberately; keep confirmed collection content for incremental failure and independent successful Statistics sections. Do not advance a failed offset or substitute stale project identity. No verifier endpoint is invented: Check session means the already supported session-check path; if unavailable, use Sign in or safe exit.
2. **Write states:** pending prevents duplicate submission and temporarily guards in-app exit only where D06 requires it. Wait is the next step. It does not cancel an issued request, establish success or permit background replay. A definite rejection retains the unsubmitted correction context; a network failure is not automatically definite rejection.
3. **Uncertain outcomes:** release the pending lock, explain that the operation may have completed, and offer operation-specific deliberate review/readback or explicit safe leave. Never automatically replay refresh, logout, creation, invitation, status or field writes. A collection match/absence does not identify an uncertain creation; a readback is an observation, not causation or durability proof. Do not offer a generic Retry write action.
4. **Qualified success:** follow D13–D18 distinctions: local sign-out is not all-device revocation; signup/recovery/invite messages are not session/delivery/membership proof; create/update acknowledgements do not establish identity/persistence; task status changes move only after checked qualified confirmation. Statistics examples remain visibly synthetic under G-17.
5. **Access:** unknown, known readonly and established denied are distinct. Read access does not establish create/edit/invite/status/aggregate rights. Retain only independently permitted content. All denied/readonly examples require the stated evidence; generic transport errors never infer a role or denial. The D17 nested 257:3334 Change status example remains conditional on separate status eligibility and available destinations, as documented in D17; D19 does not approve a transition policy or alter that accepted composition.
6. **Return:** capture actual origin and trigger. Tasks/Epic nesting returns to the still-valid actual parent, not a related entity inferred afterward. Missing origin uses an evidenced same-project parent when readable, then Projects; if Projects is unavailable, use supported shell/session recovery or safe exit. Browser Back follows actual history. Do not promise universal restoration.
7. **Focus and language:** focus first invalid field; topmost overlay owns focus and one-layer Escape; dirty exit defaults to Keep editing. Close/utility dismissal returns to the actual trigger or an equivalent stable heading/control if it disappeared after resize. Logical reading/action order is preserved; stacked actions read top to bottom in both languages. Supporting text aligns left/right for EN/AR, button labels center. Preserve original icon exceptions, LTR brand and isolated raw IDs; no date/numeral/calendar convention is inferred.
8. **Motion and announcements:** all essential meaning, pending text, errors and recovery actions remain visible statically. Reduced motion uses immediate replacement/opening and the same focus target and textual feedback. Runtime must announce the changed region/selected value without moving focus indiscriminately; no spinner, color or animation is the only signal. D19 establishes no new timing or motion specification.
9. **Display controls:** local selection affects the active interface; no API, Save, default, system-following, retention or synchronization promise. Dismissal without a selection changes nothing; after a selection, return focus without a dirty-save dialog or added history step.

## Bounded QA and limitations

Final rendered samples cover EN LTR/AR RTL, actual native Light/Dark, desktop section composition, mobile 320/360/390px, long Arabic feedback, unknown versus conditional denial, pending, uncertainty, recovery, centered action labels and one visual focus target. Compact display controls retain selected checkmarks plus labels; no clipped content was seen. Initial full-width focus/control alignment was repaired locally before final inspection. No accepted source was edited.

Native readback: 33 specimen roots, 85 linked instances including nested display-control descendants, no missing masters, Inter/Cairo only, no raster fills and no text extending outside its immediate parent. Collections retain 61 primitive colors, 43 semantic colors, 15 geometry variables and 20 text styles. Roots use real semantic modes; local overrides preserve accepted source bindings. These counts establish targeted preservation, not a complete historical file fingerprint.

Accepted D13–D18 QA supplies complete-screen, field/error/focus, Remember checked/unchecked, mixed-script, tablet, responsive-origin and source-dialog evidence. D19 adds only representative feedback/component renders; it does not certify every state-by-mode permutation or functioning responsive behavior. Static auto-layout specimens do not demonstrate keyboard execution, focus traps, screen readers, runtime scrolling/keyboard clearance, reduced-motion operation, live permission enforcement or WCAG certification.

DEC-05/06/07/08/11/12 remain unresolved; G-01–G-17 remain open and F-17–F-20 deferred. Statistics populated semantics remain conditional under G-17. Detached feedback requires future drift review; shared feedback variant switches can restore fixed-width internals and require rechecking local fill/hug overrides. Arabic copy remains subject to owner editorial review. No API/backend policy, authorization/RLS, persistence, transition enforcement, runtime or production readiness is verified. The audited backend remains an optional integration reference.

Owner acceptance required: explicitly approve this D19-v1 matrix, shell feedback specimens, compact controls and conditional recovery rules. Until then D19 stays REVIEW, not DONE. No full-product Figma approval, frontend work, merge to main or D20 is authorized by this handoff.
