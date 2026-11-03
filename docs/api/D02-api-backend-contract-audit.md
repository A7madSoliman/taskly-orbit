# D-02 — API & Backend Contract Audit

Status: REVIEW — owner acceptance required. Date: 2026-10-27.
Product: independent Taskly Orbit. Direction: Hybrid — Calm & Premium + Professional Workspace.

## Evidence baseline and boundaries

- Reference repository commit verified through read-only GitHub metadata: `06e216366f57b80e7db0890efdc0e605eab68be1`. All source links are pinned to this revision.
- Collection: [taskly-orbit-postman-sanitized.json](../../references/api/taskly-orbit-postman-sanitized.json), Postman collection v2.1, supplied display name “Taskly Orbit — API Reference (Sanitized)”.
- Collection SHA-256: `AFE905BA6BE61740E63CCDF9C5C82970F5F52EA4E34F29B40137E075656C3D1B`. Successful parse; exactly **23 requests**, all with **zero saved response examples**.
- Complete pinned tree: **19 handler files / 26 exported method-path pairs**. This audit registers **29 operations**: 20 direct collection-to-handler matches, six handler-only operations, one collection request used internally for session verification, and two collection-only delete requests.
- Collection pointers below are zero-based JSON pointers. Empty collection variables, placeholder credential headers/passwords and reserved-domain synthetic samples were inspected without printing their values. Synthetic account strings are not reproduced. The supplied collection is preserved unchanged.
- No collection scripts, application tests, live backend requests, Supabase changes, dependencies, Figma designs or application implementation were executed. GitHub source reads are the only network evidence retrieval in this resume.
- [Accepted D-01 architecture audit](../product/D01-architecture-ux-audit.md), [D-01 screen inventory](../ux/D01-screen-interaction-inventory.md), and [D-01 acceptance](../../.ai/reports/D01-acceptance.md) provide the screen baseline.
- [UI action mapping](../ux/D02-ui-action-api-mapping.md) links operations and gaps to screens/states. The prior [BLOCKED report](../../.ai/reports/D02-api-backend-contract-audit.md) remains unchanged; this audit supersedes only its missing-input disposition.

## Evidence classification

| Label | What it establishes | What it does not establish |
|---|---|---|
| DOC-REQUEST | A request example explicitly present in the supplied collection; request/header/body field names and example method/path | Requiredness, exhaustive capabilities, deployed success, response/error contract or authorization |
| H | Behavior observed in Next.js handlers/server helpers at the pinned commit | Database/RPC implementation or live enforcement |
| F | Frontend caller, schema, mapper and screen expectations | Backend acceptance, visibility or correctness |
| T | Mocked test expectations/fixtures | Executed test results, production behavior or live data |
| U | Missing, contradictory or unverified evidence | Permission to invent a capability |

No standalone authoritative OpenAPI or database DDL/migration contract was found in the enumerated reference tree. Supplied request examples and README documentation are limited evidence, not a complete backend specification. Conflicts remain explicit rather than being resolved by assuming the old frontend is correct.

## API Capability Matrix

“Browser” is the same-origin Next.js interface. “Upstream” uses a redacted backend origin; paths below are templates, not live destinations. Every operation needs the detailed input/output and permission qualifications that follow.

| Operation | Capability | Postman evidence | Browser-facing interface | Upstream interface |
|---|---|---|---|---|
| [OP-01](#op-01) | Sign up | PM-01 | POST /api/auth/signup | POST /auth/v1/signup |
| [OP-02](#op-02) | Log in | PM-02 | POST /api/auth/login | POST /auth/v1/token?grant_type=password |
| [OP-03](#op-03) | Read authenticated user | PM-03 — internal helper only or collection-only | None exported | GET /auth/v1/user |
| [OP-04](#op-04) | Reset password | PM-04 | POST /api/auth/reset-password | PUT /auth/v1/user |
| [OP-05](#op-05) | Refresh session | PM-05 | POST /api/auth/refresh | POST /auth/v1/token?grant_type=refresh_token |
| [OP-06](#op-06) | Request recovery link | PM-06 | POST /api/auth/forgot-password | POST /auth/v1/recover?redirect_to={appResetUrl} |
| [OP-07](#op-07) | Log out | PM-07 | POST /api/auth/logout | POST /auth/v1/logout (best effort) |
| [OP-08](#op-08) | List projects | PM-08 | GET /api/projects | GET /rest/v1/rpc/get_projects |
| [OP-09](#op-09) | Create project | PM-09 | POST /api/projects | POST /rest/v1/projects |
| [OP-10](#op-10) | Update project | PM-10 | PATCH /api/projects/[projectId] | PATCH /rest/v1/projects?id=eq.{projectId} |
| [OP-11](#op-11) | Read members | PM-11 | GET /api/projects/[projectId]/members | GET /rest/v1/get_project_members?project_id=eq.{projectId} |
| [OP-12](#op-12) | Invite member | PM-12 | POST /api/projects/[projectId]/invitations | POST /rest/v1/rpc/invite_member |
| [OP-13](#op-13) | Accept invitation | PM-13 | POST /api/invitations/accept | POST /rest/v1/rpc/accept_invitation |
| [OP-14](#op-14) | List/search epics | PM-14 | GET /api/projects/[projectId]/epics | GET /rest/v1/project_epics |
| [OP-15](#op-15) | Create epic | PM-15 | POST /api/projects/[projectId]/epics | POST /rest/v1/epics |
| [OP-16](#op-16) | Read epic details | PM-16 | GET /api/projects/[projectId]/epics/[epicId] | GET /rest/v1/project_epics?project_id=eq.{projectId}&id=eq.{epicId} |
| [OP-17](#op-17) | Update epic field | PM-17 | PATCH /api/projects/[projectId]/epics/[epicId] | PATCH /rest/v1/epics?id=eq.{epicId}&project_id=eq.{projectId} |
| [OP-18](#op-18) | Delete epic | PM-18 — internal helper only or collection-only | None exported | DELETE /rest/v1/epics?id=eq.{epicId} |
| [OP-19](#op-19) | List/search tasks | PM-19 | GET /api/projects/[projectId]/tasks | GET /rest/v1/project_tasks |
| [OP-20](#op-20) | Read all epic tasks | PM-20 | GET /api/projects/[projectId]/epics/[epicId]/tasks | GET /rest/v1/project_tasks?epic_id=eq.{epicId}&project_id=eq.{projectId} |
| [OP-21](#op-21) | Create task | PM-21 | POST /api/projects/[projectId]/tasks | POST /rest/v1/tasks |
| [OP-22](#op-22) | Update task / move status | PM-22 | PATCH /api/projects/[projectId]/tasks/[taskId] | PATCH /rest/v1/tasks?id=eq.{taskId}&project_id=eq.{projectId} |
| [OP-23](#op-23) | Delete task | PM-23 — internal helper only or collection-only | None exported | DELETE /rest/v1/tasks?id=eq.{taskId} |
| [OP-24](#op-24) | Read project details | Not in collection | GET /api/projects/[projectId] | GET /rest/v1/projects?id=eq.{projectId}&select=id,name,description&limit=1 |
| [OP-25](#op-25) | Bootstrap recovery context | Not in collection | POST /api/auth/reset-password/bootstrap | GET /auth/v1/user (verification) |
| [OP-26](#op-26) | Check recovery context | Not in collection | GET /api/auth/reset-password/bootstrap | GET /auth/v1/user (verification) |
| [OP-27](#op-27) | Calendar statistics | Not in collection | POST /api/statistics/calendar | POST /rest/v1/rpc/get_tasks_calendar_stats |
| [OP-28](#op-28) | Per-project statistics | Not in collection | POST /api/statistics/projects | POST /rest/v1/rpc/get_tasks_count_per_project |
| [OP-29](#op-29) | Read task details | Not in collection | GET /api/projects/[projectId]/tasks/[taskId] | GET /rest/v1/project_tasks?project_id=eq.{projectId}&id=eq.{taskId} |

### Complete Postman request reconciliation

All rows are DOC-REQUEST. Body examples show fields and example types, not a schema. Unless noted, requiredness and success/error responses are unspecified. All 23 saved-response arrays are empty. API-key and bearer values remain placeholders; request-level noauth does not make an operation public.

| Request | JSON pointer | Method and upstream path (base variable retained) | Query keys | Example body fields/types | Matched operation and disposition |
|---|---|---|---|---|---|
| PM-01 | `/item/0/request` | POST {{base_url}}/auth/v1/signup | None shown | {email:string, password:string, data:{name:string, department:string}} | OP-01: Direct conceptual match; browser payload/response may differ |
| PM-02 | `/item/1/request` | POST {{base_url}}/auth/v1/token | grant_type | {email:string, password:string} | OP-02: Direct conceptual match; browser payload/response may differ |
| PM-03 | `/item/2/request` | GET {{base_url}}/auth/v1/user | None shown | None | OP-03: Internal verification helper; no exported get-user route |
| PM-04 | `/item/3/request` | PUT {{base_url}}/auth/v1/user | None shown | {password:string} | OP-04: Direct conceptual match; browser payload/response may differ |
| PM-05 | `/item/4/request` | POST {{base_url}}/auth/v1/token | grant_type | {refresh_token:string} | OP-05: Direct conceptual match; browser payload/response may differ |
| PM-06 | `/item/5/request` | POST {{base_url}}/auth/v1/recover | None shown | {email:string} | OP-06: Direct conceptual match; browser payload/response may differ |
| PM-07 | `/item/6/request` | POST {{base_url}}/auth/v1/logout | None shown | None | OP-07: Direct conceptual match; browser payload/response may differ |
| PM-08 | `/item/7/request` | GET {{base_url}}/rest/v1/rpc/get_projects | None shown | None | OP-08: Direct conceptual match; browser payload/response may differ |
| PM-09 | `/item/8/request` | POST {{base_url}}/rest/v1/projects | None shown | {name:string, description:string} | OP-09: Direct conceptual match; browser payload/response may differ |
| PM-10 | `/item/9/request` | PATCH {{base_url}}/rest/v1/projects | id | {name:string, description:string} | OP-10: Direct conceptual match; browser payload/response may differ |
| PM-11 | `/item/10/request` | GET {{base_url}}/rest/v1/get_project_members | project_id | None | OP-11: Direct conceptual match; browser payload/response may differ |
| PM-12 | `/item/11/request` | POST {{base_url}}/rest/v1/rpc/invite_member | None shown | {p_email:string, p_project_id:string, p_app_url:string, p_base_url:string} | OP-12: Direct conceptual match; browser payload/response may differ |
| PM-13 | `/item/12/request` | POST {{base_url}}/rest/v1/rpc/accept_invitation | None shown | {p_token:string} | OP-13: Direct conceptual match; browser payload/response may differ |
| PM-14 | `/item/13/request` | GET {{base_url}}/rest/v1/project_epics | project_id, limit, offset | None | OP-14: Direct conceptual match; browser payload/response may differ |
| PM-15 | `/item/14/request` | POST {{base_url}}/rest/v1/epics | None shown | {title:string, description:string, assignee_id:string, project_id:string, deadline:string} | OP-15: Direct conceptual match; browser payload/response may differ |
| PM-16 | `/item/15/request` | GET {{base_url}}/rest/v1/project_epics | project_id, id | None | OP-16: Direct conceptual match; browser payload/response may differ |
| PM-17 | `/item/16/request` | PATCH {{base_url}}/rest/v1/epics | id | {title:string, description:string} | OP-17: Direct conceptual match; browser payload/response may differ |
| PM-18 | `/item/17/request` | DELETE {{base_url}}/rest/v1/epics | id | None | OP-18: Collection-only; no matching browser handler/caller |
| PM-19 | `/item/18/request` | GET {{base_url}}/rest/v1/project_tasks | project_id | None | OP-19: Direct conceptual match; browser payload/response may differ |
| PM-20 | `/item/19/request` | GET {{base_url}}/rest/v1/project_tasks | epic_id | None | OP-20: Direct conceptual match; browser payload/response may differ |
| PM-21 | `/item/20/request` | POST {{base_url}}/rest/v1/tasks | None shown | {project_id:string, epic_id:string, title:string, description:string, assignee_id:string, due_date:string, status:string} | OP-21: Direct conceptual match; browser payload/response may differ |
| PM-22 | `/item/21/request` | PATCH {{base_url}}/rest/v1/tasks | id | {status:string} | OP-22: Direct conceptual match; browser payload/response may differ |
| PM-23 | `/item/22/request` | DELETE {{base_url}}/rest/v1/tasks | id | None | OP-23: Collection-only; no matching browser handler/caller |

Collection preferences: PM-09/PM-15/PM-21 request return=representation; PM-14/PM-19 request count=exact. Login and refresh distinguish grant_type=password versus grant_type=refresh_token. PM-02 and PM-05 contain response-variable extraction scripts (three/two variable writes respectively), not pm.test assertions; they were inspected statically, never executed. There is no evidence of actual token values or test execution in this audit.

## Operation details and source evidence

All input/output descriptions below are H/F unless attributed to DOC-REQUEST. Upstream response shapes remain U where no independent documentation/examples exist. Primary handler spans cover each exported method; additional server reads for identity, project, membership or relation verification are included in those spans and are not separate UI capabilities.

### OP-01

**Sign up** — DOC-REQUEST PM-01 at `/item/0/request`.

- **Input and transformation:** Browser name,email,jobTitle,password,confirmPassword; upstream email,password,data{name,department}; jobTitle maps to department.
- **Response and confirmation:** Browser 201 {message}; upstream body not exposed or schema-confirmed.
- **Permission/session conditions:** Unauthenticated form; no pre-existing session required.
- **Error behavior:** 400 validation; 409 recognized duplicate account; 500 configuration; other upstream status.
- **Open gaps:** G-01, G-13.
- **H evidence:** [src/app/api/auth/signup/route.ts:L14–L89](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/auth/signup/route.ts#L14-L89).
- **F/caller evidence:** [src/features/auth/components/signup-form.tsx:L1–L331](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/auth/components/signup-form.tsx#L1-L331).
- **Schema evidence:** [src/features/auth/schemas/signup-schema.ts:L1–L42](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/auth/schemas/signup-schema.ts#L1-L42).

### OP-02

**Log in** — DOC-REQUEST PM-02 at `/item/1/request`.

- **Input and transformation:** Browser email,password,rememberMe(boolean required); upstream email,password.
- **Response and confirmation:** Browser 200 {message} plus HTTP-only session cookies; upstream must contain string access_token and refresh_token.
- **Permission/session conditions:** Credentials establish session; remember choice controls persistence, not token validity.
- **Error behavior:** 400; recognized bad credentials 401; 500; malformed upstream 502; other upstream status.
- **Open gaps:** G-01, G-13.
- **H evidence:** [src/app/api/auth/login/route.ts:L10–L105](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/auth/login/route.ts#L10-L105).
- **F/caller evidence:** [src/features/auth/components/login-form.tsx:L1–L216](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/auth/components/login-form.tsx#L1-L216).
- **Schema evidence:** [src/features/auth/schemas/login-schema.ts:L1–L15](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/auth/schemas/login-schema.ts#L1-L15).

### OP-03

**Read authenticated user** — DOC-REQUEST PM-03 at `/item/2/request`.

- **Input and transformation:** Internal access-session credential; collection sends API-key and bearer placeholders.
- **Response and confirmation:** Internal verifier requires object with string id then maps user metadata; no exported browser get-user handler.
- **Permission/session conditions:** Internal session verification; collection noauth setting does not remove explicit bearer header.
- **Error behavior:** Verifier returns null for unsuccessful response/invalid shape; caller decides session behavior; transport errors not uniformly handled by all consumers.
- **Open gaps:** G-01, G-04, G-13.
- **H evidence:** [src/lib/auth/session.ts:L19–L48](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/lib/auth/session.ts#L19-L48). This is an internal verifier, not a browser endpoint.
- **F/caller evidence:** [src/lib/auth/session.ts:L1–L78](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/lib/auth/session.ts#L1-L78).

### OP-04

**Reset password** — DOC-REQUEST PM-04 at `/item/3/request`.

- **Input and transformation:** Browser password,confirmPassword; recovery cookie verified; upstream password only.
- **Response and confirmation:** 200 {message}; recovery cookie cleared after success.
- **Permission/session conditions:** Verified recovery context, not an arbitrary profile-password-change screen.
- **Error behavior:** 400 validation; 401 missing/invalid recovery context; 500 config; upstream statuses.
- **Open gaps:** G-01, G-13.
- **H evidence:** [src/app/api/auth/reset-password/route.ts:L6–L112](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/auth/reset-password/route.ts#L6-L112).
- **F/caller evidence:** [src/features/auth/components/reset-password-form.tsx:L1–L270](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/auth/components/reset-password-form.tsx#L1-L270).
- **Schema evidence:** [src/features/auth/schemas/reset-password-schema.ts:L1–L24](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/auth/schemas/reset-password-schema.ts#L1-L24).

### OP-05

**Refresh session** — DOC-REQUEST PM-05 at `/item/4/request`.

- **Input and transformation:** Browser cookie-based, no request JSON; upstream refresh_token.
- **Response and confirmation:** 200 {message} and renewed cookies; unsuccessful upstream clears auth cookies.
- **Permission/session conditions:** Refresh cookie required; remember choice reused.
- **Error behavior:** 401 missing/rejected refresh; 500 config; malformed token response 502.
- **Open gaps:** G-01, G-13.
- **H evidence:** [src/app/api/auth/refresh/route.ts:L5–L94](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/auth/refresh/route.ts#L5-L94).
- **F/caller evidence:** [src/components/shared/authenticated-layout/session-restore.tsx:L1–L50](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/components/shared/authenticated-layout/session-restore.tsx#L1-L50).

### OP-06

**Request recovery link** — DOC-REQUEST PM-06 at `/item/5/request`.

- **Input and transformation:** Browser/upstream email; handler supplies reset redirect URL.
- **Response and confirmation:** 200 generic {message}; no delivery proof.
- **Permission/session conditions:** No existing session; generic success avoids asserting account existence.
- **Error behavior:** 400 invalid identifier; 500 config; upstream failure status.
- **Open gaps:** G-01, G-13.
- **H evidence:** [src/app/api/auth/forgot-password/route.ts:L8–L68](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/auth/forgot-password/route.ts#L8-L68).
- **F/caller evidence:** [src/features/auth/hooks/use-forgot-password.ts:L1–L209](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/auth/hooks/use-forgot-password.ts#L1-L209).
- **Schema evidence:** [src/features/auth/schemas/forgot-password-schema.ts:L1–L11](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/auth/schemas/forgot-password-schema.ts#L1-L11).

### OP-07

**Log out** — DOC-REQUEST PM-07 at `/item/6/request`.

- **Input and transformation:** No browser body; optional existing session used upstream.
- **Response and confirmation:** Browser 204 after local cookie clearing, even when remote logout fails.
- **Permission/session conditions:** Local logout allowed without a current credential.
- **Error behavior:** Remote failures do not prevent local logout; cookie/runtime failures not certified.
- **Open gaps:** G-01, G-13.
- **H evidence:** [src/app/api/auth/logout/route.ts:L5–L31](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/auth/logout/route.ts#L5-L31).
- **F/caller evidence:** [src/features/auth/hooks/use-logout.ts:L1–L48](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/auth/hooks/use-logout.ts#L1-L48).

### OP-08

**List projects** — DOC-REQUEST PM-08 at `/item/7/request`.

- **Input and transformation:** Browser optional positive integer limit/nonnegative offset; upstream same query and count=exact.
- **Response and confirmation:** Browser forwards JSON/status and Content-Range; frontend maps project list and requires usable totals.
- **Permission/session conditions:** Session-cookie presence; no explicit handler-level role/identity verification.
- **Error behavior:** 400 pagination; 401 missing session; 500 config; upstream statuses including possible 416.
- **Open gaps:** G-01, G-04, G-10, G-11.
- **H evidence:** [src/app/api/projects/route.ts:L6–L86](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/projects/route.ts#L6-L86).
- **F/caller evidence:** [src/features/projects/hooks/use-projects.ts:L1–L306](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/hooks/use-projects.ts#L1-L306).

### OP-09

**Create project** — DOC-REQUEST PM-09 at `/item/8/request`.

- **Input and transformation:** Browser title, optional description; upstream name=title, description trimmed or null.
- **Response and confirmation:** Browser 201 {message}, not a created entity; collection requests representation unlike handler.
- **Permission/session conditions:** Cookie presence only; actual creation authorization unverified.
- **Error behavior:** 400 field errors; 401; 500; upstream status.
- **Open gaps:** G-01, G-04, G-09.
- **H evidence:** [src/app/api/projects/route.ts:L87–L146](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/projects/route.ts#L87-L146).
- **F/caller evidence:** [src/features/projects/components/create-project-form.tsx:L1–L189](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/components/create-project-form.tsx#L1-L189).
- **Schema evidence:** [src/features/projects/schemas/create-project-schema.ts:L1–L10](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/schemas/create-project-schema.ts#L1-L10); [src/features/projects/schemas/project-fields-schema.ts:L1–L13](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/schemas/project-fields-schema.ts#L1-L13).

### OP-10

**Update project** — DOC-REQUEST PM-10 at `/item/9/request`.

- **Input and transformation:** Browser name, optional description; upstream name and trimmed description/null.
- **Response and confirmation:** 200 {message}; success does not verify affected-row count or persisted values.
- **Permission/session conditions:** Cookie presence only; no explicit creator/member edit policy.
- **Error behavior:** 400 field errors; 401; 500; upstream status/message.
- **Open gaps:** G-01, G-04, G-09.
- **H evidence:** [src/app/api/projects/[projectId]/route.ts:L80–L144](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/projects/%5BprojectId%5D/route.ts#L80-L144).
- **F/caller evidence:** [src/features/projects/components/edit-project-form.tsx:L1–L170](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/components/edit-project-form.tsx#L1-L170).
- **Schema evidence:** [src/features/projects/schemas/edit-project-schema.ts:L1–L10](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/schemas/edit-project-schema.ts#L1-L10).

### OP-11

**Read members** — DOC-REQUEST PM-11 at `/item/10/request`.

- **Input and transformation:** Project path ID; collection same upstream filter.
- **Response and confirmation:** Browser mapped array {id,userId,name,email,role}; invalid raw shape becomes 502.
- **Permission/session conditions:** Cookie presence only; no explicit local read-role check.
- **Error behavior:** 401; 500; upstream statuses; malformed members 502.
- **Open gaps:** G-01, G-04, G-05, G-10, G-15.
- **H evidence:** [src/app/api/projects/[projectId]/members/route.ts:L11–L59](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/projects/%5BprojectId%5D/members/route.ts#L11-L59).
- **F/caller evidence:** [src/features/projects/hooks/use-project-members.ts:L1–L82](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/hooks/use-project-members.ts#L1-L82).

### OP-12

**Invite member** — DOC-REQUEST PM-12 at `/item/11/request`.

- **Input and transformation:** Browser email; upstream p_email,p_project_id plus server-trusted p_app_url,p_base_url.
- **Response and confirmation:** 200 {message} on upstream HTTP success; no invitation entity or delivery confirmation returned.
- **Permission/session conditions:** Verified user; owner/admin/member or creator without membership; explicit viewer denied; same-origin JSON; validated configuration.
- **Error behavior:** 400; 401; 403; missing project 404; 415; 500; upstream 400/401/403/409/422/429 retained, others 502.
- **Open gaps:** G-01, G-04, G-05, G-09, G-12.
- **H evidence:** [src/app/api/projects/[projectId]/invitations/route.ts:L24–L229](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/projects/%5BprojectId%5D/invitations/route.ts#L24-L229).
- **F/caller evidence:** [src/features/invitations/components/invite-member-dialog.tsx:L1–L287](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/invitations/components/invite-member-dialog.tsx#L1-L287).
- **Schema evidence:** [src/features/invitations/schemas/invite-member-schema.ts:L1–L11](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/invitations/schemas/invite-member-schema.ts#L1-L11).

### OP-13

**Accept invitation** — DOC-REQUEST PM-13 at `/item/12/request`.

- **Input and transformation:** Browser token (nonempty, no whitespace, max2048); upstream p_token.
- **Response and confirmation:** 200 {message,projectId:null|UUID}; accepts bodyless upstream 204 and several possible response forms; explicit false/success:false becomes 400.
- **Permission/session conditions:** Verified session, same-origin JSON; valid invite eligibility is upstream-dependent.
- **Error behavior:** 400/401/403/404/409/410/415/422/429 and 500; unexpected/network upstream 502.
- **Open gaps:** G-01, G-09, G-12.
- **H evidence:** [src/app/api/invitations/accept/route.ts:L34–L133](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/invitations/accept/route.ts#L34-L133).
- **F/caller evidence:** [src/features/invitations/components/accept-invitation-view.tsx:L1–L152](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/invitations/components/accept-invitation-view.tsx#L1-L152).
- **Schema evidence:** [src/features/invitations/schemas/accept-invitation-schema.ts:L1–L11](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/invitations/schemas/accept-invitation-schema.ts#L1-L11).

### OP-14

**List/search epics** — DOC-REQUEST PM-14 at `/item/13/request`.

- **Input and transformation:** Browser limit,offset,search; upstream project_id eq, title ilike substring, created_at.desc,id.desc and exact count.
- **Response and confirmation:** Mapped Epic[] plus forwarded Content-Range/status; frontend validates mapped shape and totals.
- **Permission/session conditions:** Cookie presence; no explicit local read-role verification.
- **Error behavior:** 400 invalid pagination; 401; 500; invalid mapper output 502; upstream status including 416.
- **Open gaps:** G-01, G-04, G-10, G-11, G-16.
- **H evidence:** [src/app/api/projects/[projectId]/epics/route.ts:L13–L105](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/projects/%5BprojectId%5D/epics/route.ts#L13-L105).
- **F/caller evidence:** [src/features/epics/hooks/use-project-epics.ts:L1–L380](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/epics/hooks/use-project-epics.ts#L1-L380).

### OP-15

**Create epic** — DOC-REQUEST PM-15 at `/item/14/request`.

- **Input and transformation:** Browser title, optional description,assigneeId,deadline; path adds project_id; empties map to null; provided assignee checked against members.
- **Response and confirmation:** 201 raw parsed upstream body; return=representation requested; no created-epic response schema.
- **Permission/session conditions:** Cookie presence and optional assignee validation; no explicit acting-user edit-role check.
- **Error behavior:** 400 schema/assignee; 401; 500; invalid member shape 502; upstream status.
- **Open gaps:** G-01, G-04, G-07, G-09.
- **H evidence:** [src/app/api/projects/[projectId]/epics/route.ts:L106–L207](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/projects/%5BprojectId%5D/epics/route.ts#L106-L207).
- **F/caller evidence:** [src/features/epics/hooks/use-create-epic.ts:L1–L49](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/epics/hooks/use-create-epic.ts#L1-L49).
- **Schema evidence:** [src/features/epics/schemas/create-epic-schema.ts:L1–L32](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/epics/schemas/create-epic-schema.ts#L1-L32).

### OP-16

**Read epic details** — DOC-REQUEST PM-16 at `/item/15/request`.

- **Input and transformation:** Project/epic IDs scoped upstream.
- **Response and confirmation:** 200 one mapped Epic; empty 404; non-single/invalid response 502.
- **Permission/session conditions:** Cookie presence; no explicit handler-level role check.
- **Error behavior:** 401/404/500/502; upstream status.
- **Open gaps:** G-01, G-04, G-10.
- **H evidence:** [src/app/api/projects/[projectId]/epics/[epicId]/route.ts:L18–L90](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/projects/%5BprojectId%5D/epics/%5BepicId%5D/route.ts#L18-L90).
- **F/caller evidence:** [src/features/epics/hooks/use-epic-details.ts:L1–L164](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/epics/hooks/use-epic-details.ts#L1-L164).

### OP-17

**Update epic field** — DOC-REQUEST PM-17 at `/item/16/request`.

- **Input and transformation:** Exactly one of title,description,assignee_id,deadline; strict union; collection example contains title AND description and is not a compatible browser payload.
- **Response and confirmation:** 200 {message} even for bodyless upstream success; no persisted read-back.
- **Permission/session conditions:** UUIDs, verified user, same-origin JSON, creator/member edit helper (viewer denied); member assignee and scoped epic validated.
- **Error behavior:** 400/401/403/404/415/500/502; upstream non-5xx status retained.
- **Open gaps:** G-01, G-04, G-06, G-07, G-09.
- **H evidence:** [src/app/api/projects/[projectId]/epics/[epicId]/route.ts:L91–L285](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/projects/%5BprojectId%5D/epics/%5BepicId%5D/route.ts#L91-L285).
- **F/caller evidence:** [src/features/epics/components/epic-details-modal.tsx:L1–L457](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/epics/components/epic-details-modal.tsx#L1-L457).
- **Schema evidence:** [src/features/epics/schemas/edit-epic-field-schema.ts:L1–L26](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/epics/schemas/edit-epic-field-schema.ts#L1-L26).

### OP-18

**Delete epic** — DOC-REQUEST PM-18 at `/item/17/request`.

- **Input and transformation:** Collection filter only; no browser interface found.
- **Response and confirmation:** No saved response, handler, caller or cascade semantics evidenced.
- **Permission/session conditions:** Collection explicit authentication placeholders; backend delete policy unknown.
- **Error behavior:** No saved success/error examples; no runtime results.
- **Open gaps:** G-01, G-02.
- **Evidence limitation:** Collection request only; no exported handler, frontend caller, response example or delete-specific regression test found in the inspected source set.

### OP-19

**List/search tasks** — DOC-REQUEST PM-19 at `/item/18/request`.

- **Input and transformation:** Browser limit1..100(default100),offset>=0(default0),optional known status,search; upstream project/status eq, escaped title ilike, created_at.desc,id.desc.
- **Response and confirmation:** Mapped CreatedTask[] plus required Content-Range and X-Taskly-Can-Edit; empty list allowed; preserves valid-total 416.
- **Permission/session conditions:** Verified creator or any project member can read; edit permission calculated separately; viewer read-only.
- **Error behavior:** 400/401/403/404/416/500/502; invalid pagination metadata or mismatched data 502.
- **Open gaps:** G-01, G-04, G-08, G-10, G-11, G-16.
- **H evidence:** [src/app/api/projects/[projectId]/tasks/route.ts:L292–L513](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/projects/%5BprojectId%5D/tasks/route.ts#L292-L513).
- **F/caller evidence:** [src/features/tasks/hooks/use-paginated-project-tasks.ts:L1–L383](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/hooks/use-paginated-project-tasks.ts#L1-L383).
- **Schema evidence:** [src/features/tasks/schemas/created-task-schema.ts:L1–L21](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/schemas/created-task-schema.ts#L1-L21).

### OP-20

**Read all epic tasks** — DOC-REQUEST PM-20 at `/item/19/request`.

- **Input and transformation:** Scoped IDs; handler internally requests pages of100 ordered created_at.asc,id.asc with exact count.
- **Response and confirmation:** 200 full mapped array {id,title,assigneeName,dueDate}; all pages assembled; malformed/nonprogress pagination fails.
- **Permission/session conditions:** Verified creator or any member (including viewer); validates epic belongs to project.
- **Error behavior:** 400/401/403/404/500/502.
- **Open gaps:** G-01, G-04, G-10, G-11.
- **H evidence:** [src/app/api/projects/[projectId]/epics/[epicId]/tasks/route.ts:L25–L171](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/projects/%5BprojectId%5D/epics/%5BepicId%5D/tasks/route.ts#L25-L171).
- **F/caller evidence:** [src/features/epics/hooks/use-epic-tasks.ts:L1–L68](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/epics/hooks/use-epic-tasks.ts#L1-L68).
- **Schema evidence:** [src/features/epics/schemas/epic-task-schema.ts:L1–L10](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/epics/schemas/epic-task-schema.ts#L1-L10).

### OP-21

**Create task** — DOC-REQUEST PM-21 at `/item/20/request`.

- **Input and transformation:** Browser title,description,epicId,assigneeId,status,dueDate (all keys required; empty strings allowed for optional content); path project; camelCase maps to snake_case/null; date to UTC midnight.
- **Response and confirmation:** 201 {task:rawCreatedRow}; handler checks basic identity/project, frontend applies stricter CreatedTask schema; malformed success may be uncertain.
- **Permission/session conditions:** Verified user, same-origin JSON; creator/member editor except viewer; assignee member and epic in project.
- **Error behavior:** 400/401/403/404/409/415/422/500/502.
- **Open gaps:** G-01, G-04, G-07, G-08, G-09, G-10.
- **H evidence:** [src/app/api/projects/[projectId]/tasks/route.ts:L36–L291](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/projects/%5BprojectId%5D/tasks/route.ts#L36-L291).
- **F/caller evidence:** [src/features/tasks/components/create-task-form.tsx:L1–L436](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/components/create-task-form.tsx#L1-L436).
- **Schema evidence:** [src/features/tasks/schemas/create-task-schema.ts:L1–L33](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/schemas/create-task-schema.ts#L1-L33); [src/features/tasks/schemas/created-task-schema.ts:L1–L21](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/schemas/created-task-schema.ts#L1-L21).

### OP-22

**Update task / move status** — DOC-REQUEST PM-22 at `/item/21/request`.

- **Input and transformation:** Nonempty strict subset of title,description,assignee_id,due_date,epic_id,status; nullable clearing; changed due_date cannot be before UTC today; unchanged date omitted.
- **Response and confirmation:** 200 {task:persistedRow}; no-op returns current; bodyless204 triggers scoped read-back; changed fields checked before success.
- **Permission/session conditions:** Verified editor, same-origin JSON, UUID scope; viewer denied even if creator; validates member assignee and epic scope.
- **Error behavior:** 400/401/403/404/409/415/422/500/502.
- **Open gaps:** G-01, G-04, G-07, G-08, G-09.
- **H evidence:** [src/app/api/projects/[projectId]/tasks/[taskId]/route.ts:L246–L465](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/projects/%5BprojectId%5D/tasks/%5BtaskId%5D/route.ts#L246-L465).
- **F/caller evidence:** [src/features/tasks/hooks/use-task-updates.ts:L1–L198](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/hooks/use-task-updates.ts#L1-L198).
- **Schema evidence:** [src/features/tasks/schemas/update-task-schema.ts:L1–L39](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/schemas/update-task-schema.ts#L1-L39).
- **Additional F evidence:** [src/features/tasks/hooks/use-board-task-move.ts:L1–L221](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/hooks/use-board-task-move.ts#L1-L221). Board movement is optimistic with reconciliation; general field editing is confirmed per save. Neither proves idempotency or atomic writes.

### OP-23

**Delete task** — DOC-REQUEST PM-23 at `/item/22/request`.

- **Input and transformation:** Collection ID filter only; no browser interface found.
- **Response and confirmation:** No saved response or frontend deletion flow; recovery/cascade unknown.
- **Permission/session conditions:** Backend deletion policy unknown.
- **Error behavior:** Unspecified by collection.
- **Open gaps:** G-01, G-02.
- **Evidence limitation:** Collection request only; no exported handler, frontend caller, response example or delete-specific regression test found in the inspected source set.

### OP-24

**Read project details** — H-only; no dedicated collection request.

- **Input and transformation:** Project path ID; no matching standalone Postman request.
- **Response and confirmation:** 200 {id,name,description:null|string}; absent/invalid array treated404; invalid row502.
- **Permission/session conditions:** Cookie presence; no explicit local role check.
- **Error behavior:** 401/404/500/502; upstream status.
- **Open gaps:** G-01, G-04, G-10.
- **H evidence:** [src/app/api/projects/[projectId]/route.ts:L30–L79](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/projects/%5BprojectId%5D/route.ts#L30-L79).
- **F/caller evidence:** [src/features/projects/hooks/use-project.ts:L1–L104](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/hooks/use-project.ts#L1-L104).

### OP-25

**Bootstrap recovery context** — H-only; no dedicated collection request.

- **Input and transformation:** Browser accessToken and type:'recovery'; no corresponding collection request.
- **Response and confirmation:** 200 {message}; sets scoped HTTP-only recovery cookie.
- **Permission/session conditions:** Verifies credential is a user session; independently proving recovery-only provenance is not established.
- **Error behavior:** 400 invalid payload;401 verification;500 config.
- **Open gaps:** G-01, G-13.
- **H evidence:** [src/app/api/auth/reset-password/bootstrap/route.ts:L10–L68](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/auth/reset-password/bootstrap/route.ts#L10-L68).
- **F/caller evidence:** [src/features/auth/components/reset-password-bootstrap.tsx:L1–L96](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/auth/components/reset-password-bootstrap.tsx#L1-L96).
- **Schema evidence:** [src/features/auth/schemas/recovery-bootstrap-schema.ts:L1–L6](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/auth/schemas/recovery-bootstrap-schema.ts#L1-L6).

### OP-26

**Check recovery context** — H-only; no dedicated collection request.

- **Input and transformation:** Scoped recovery cookie; no browser body.
- **Response and confirmation:** 200 {message}; invalid context cleared/rejected.
- **Permission/session conditions:** Recovery cookie required and verified.
- **Error behavior:** 401 missing/invalid context; other runtime behavior unverified.
- **Open gaps:** G-01, G-13.
- **H evidence:** [src/app/api/auth/reset-password/bootstrap/route.ts:L69–L106](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/auth/reset-password/bootstrap/route.ts#L69-L106).
- **F/caller evidence:** [src/features/auth/components/reset-password-bootstrap.tsx:L1–L96](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/auth/components/reset-password-bootstrap.tsx#L1-L96).

### OP-27

**Calendar statistics** — H-only; no dedicated collection request.

- **Input and transformation:** p_start_date,p_end_date (inclusive1..7 days); optional/default-null p_project_id,p_status; strict schema.
- **Response and confirmation:** 200 {daily:[{day,statuses}],totals,total_tasks,done_tasks,overdue_tasks}; nonnegative safe-integer counts; daily days must match requested range.
- **Permission/session conditions:** Verified session/same-origin JSON; selected project checked for creator/member access; all-project scope relies on upstream authorization.
- **Error behavior:** 400/401/403/404/415/422/429/500/502.
- **Open gaps:** G-01, G-03, G-04, G-07, G-17.
- **H evidence:** [src/app/api/statistics/calendar/route.ts:L3–L5](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/statistics/calendar/route.ts#L3-L5).
- **F/caller evidence:** [src/features/statistics/hooks/use-statistics-data.ts:L1–L125](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/statistics/hooks/use-statistics-data.ts#L1-L125).
- **Schema evidence:** [src/features/statistics/schemas/statistics-schema.ts:L1–L77](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/statistics/schemas/statistics-schema.ts#L1-L77).
- **Shared H implementation:** [src/features/statistics/server/statistics-api.ts:L1–L126](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/statistics/server/statistics-api.ts#L1-L126).

### OP-28

**Per-project statistics** — H-only; no dedicated collection request.

- **Input and transformation:** Strict p_start_date,p_end_date only; project/status filter keys rejected.
- **Response and confirmation:** 200 [{project_id,project_name,tasks_count}]; counts nonnegative safe integers.
- **Permission/session conditions:** Verified session/same-origin JSON; all-project RPC scope depends on backend.
- **Error behavior:** 400/401/403/415/422/429/500/502.
- **Open gaps:** G-01, G-03, G-04, G-17.
- **H evidence:** [src/app/api/statistics/projects/route.ts:L3–L5](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/statistics/projects/route.ts#L3-L5).
- **F/caller evidence:** [src/features/statistics/hooks/use-statistics-data.ts:L1–L125](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/statistics/hooks/use-statistics-data.ts#L1-L125).
- **Schema evidence:** [src/features/statistics/schemas/statistics-schema.ts:L1–L77](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/statistics/schemas/statistics-schema.ts#L1-L77).
- **Shared H implementation:** [src/features/statistics/server/statistics-api.ts:L1–L126](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/statistics/server/statistics-api.ts#L1-L126).

### OP-29

**Read task details** — H-only; no dedicated collection request.

- **Input and transformation:** UUID project/task IDs; selects details with related user/epic objects.
- **Response and confirmation:** 200 normalized {id,projectId,taskCode,title,description,status,epic,assigneeName,assigneeId,canEdit,createdByName,dueDate,createdAt}; unknown nonempty status retained.
- **Permission/session conditions:** Verified creator/member reader; canEdit separately calculated.
- **Error behavior:** 400/401/403/404/500/502; wrong-scope or multirow data502.
- **Open gaps:** G-01, G-04, G-08, G-10.
- **H evidence:** [src/app/api/projects/[projectId]/tasks/[taskId]/route.ts:L55–L245](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/app/api/projects/%5BprojectId%5D/tasks/%5BtaskId%5D/route.ts#L55-L245).
- **F/caller evidence:** [src/features/tasks/hooks/use-task-details.ts:L1–L110](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/hooks/use-task-details.ts#L1-L110).
- **Schema evidence:** [src/features/tasks/schemas/task-details-schema.ts:L1–L25](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/schemas/task-details-schema.ts#L1-L25).

## Validation, representations, pagination and search

| Area | Observed source rule or transformation | Confidence and design implication |
|---|---|---|
| Signup/reset | Password 8–64 with uppercase/lowercase/digit/special; matching confirmation. Signup Unicode letters/space name 3–50; jobTitle key accepts a string including empty. Login password only requires nonempty; rememberMe boolean required. | H/F, not independent Supabase policy. Explain errors without exposing credentials. |
| Projects | Create browser title versus edit name; shared trimmed name 3–100; optional description max 500; handler turns blank description into null. | H/F. Do not send Postman create name directly to browser create route. |
| Epics | Create title min 3, description max 500, optional empty-or-UUID assignee and date-pattern/local-today deadline. Edit exactly one field: nonempty title, nullable trimmed description <=500, nullable UUID assignee, or nullable ISO date. | H/F. PM-17's two-field example is not accepted by browser union; edit min title and date checks differ from create. |
| Tasks | Create requires all six form keys; optional content represented as empty strings then null. Update strict nonempty subset of six fields; nullable relation/date/description clearing. Title nonempty, no maximum evidenced; description has no maximum in task schemas. | H/F. No invented task length limit; preserve nullable/clear behavior. |
| Due dates | Task create validates real calendar date but not “today or later”; stored as UTC midnight. Update rejects a changed past date against UTC today, skips unchanged dates, compares persisted timestamp instants. Epic create and edit differ. | H/F. G-07 requires a product/timezone policy. |
| Identifiers and user projections | List projects normalize numeric/string IDs; scoped task/invite/statistics paths require UUID. Membership ID differs from userId. Epics expect sub-based user metadata; tasks normalize id-based nested users; task_id/epic_id display codes differ from UUID keys. | F/H. Canonical backend relation model remains U. |
| Project paging | Optional integer limit>0 / offset>=0; exact count requested; Content-Range forwarded even on upstream failure. Frontend uses totals/416 and deduplicates IDs. No explicit upper bound in handler. | H/F; collection PM-08 omits these examples. Server caps/count guarantees U. |
| Epic paging/search | Same optional bounds, exact count; project scope; title ilike substring; order created_at.desc,id.desc. Search does not share the task wildcard-escaping helper. | H/F; PM-14 shows project/paging keys, not search. Literal-versus-wildcard product expectation unresolved. |
| Task paging/search | Limit 1..100 default 100, offset >=0 default 0, enum status and trimmed/escaped title substring applied before pagination; stable created_at.desc,id.desc; requires exact totals; X-Taskly-Can-Edit. | H/F, with T expectations. Empty/malformed totals and 416 need distinct feedback. |
| Epic task read | Server loops 100-sized pages, count required, order ascending created_at/id; scope and progress checked; returns all mapped tasks. | H; browser has no incremental control for this operation; performance/caps U. |
| Statistics | Strict inclusive 1–7 date-only days, valid dates/no year zero; calendar accepts nullable/default project/status; per-project only accepts dates. Response count integers >=0 and <=MAX_SAFE_INTEGER; daily days must match range. | H/F; absent from Postman. Overdue-outside-range is documented source/README semantics, not independently verified RPC SQL. |

Supporting schemas and mappers: [src/features/auth/validation/password-rules.ts:L1–L24](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/auth/validation/password-rules.ts#L1-L24); [src/features/projects/utils/map-projects.ts:L1–L45](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/utils/map-projects.ts#L1-L45); [src/features/projects/utils/map-project-members.ts:L1–L73](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/projects/utils/map-project-members.ts#L1-L73); [src/features/epics/utils/map-project-epics.ts:L1–L143](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/epics/utils/map-project-epics.ts#L1-L143); [src/features/tasks/utils/map-project-tasks.ts:L1–L28](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/utils/map-project-tasks.ts#L1-L28); [src/features/tasks/utils/build-task-title-filter.ts:L1–L28](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/utils/build-task-title-filter.ts#L1-L28); [src/features/statistics/schemas/statistics-schema.ts:L1–L77](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/statistics/schemas/statistics-schema.ts#L1-L77).

### Task status vocabulary and transition limits

The reference UI/schema vocabulary is TO_DO, IN_PROGRESS, BLOCKED, IN_REVIEW, READY_FOR_QA, REOPENED, READY_FOR_PRODUCTION and DONE. Creation, list parsing and status filters use this enum; detail/persisted-row schemas tolerate unknown nonempty status strings. Browser PATCH validates a requested enum value but does not establish a backend transition graph, workflow configurability, within-column ordering or concurrent-edit policy.

Evidence: [src/features/tasks/constants/task-statuses.ts:L1–L44](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/constants/task-statuses.ts#L1-L44). PM-21/PM-22 supply individual status examples only, not an exhaustive transition contract. See G-08.

## Entity Relationship Inventory

These are observed projections/associations, not a database ERD. A repeated field or successful mock does not prove a foreign key, cardinality, cascade or uniqueness constraint.

| Entity ID | Entity / identifying fields | Observed relationships and nullable data | Evidence and unresolved guarantees |
|---|---|---|---|
| EN-01 | Auth user/session: user ID and metadata; session/recovery credentials are never report data | User participates in projects/membership/assignment; jobTitle maps to metadata department; session is distinct from recovery context | OP-01–OP-07, OP-25/OP-26; actual expiry/confirmation/recovery-only provenance U |
| EN-02 | Project: id, name, description, created_at; created_by used in access checks | Creator is a user ID; project scopes member, epic and task queries | OP-08–OP-10/OP-24; list accepts looser IDs than scoped handlers; creator membership and database constraints U |
| EN-03 | Membership projection: member_id, user_id, role, email, metadata.name | User-to-project association; four roles owner/admin/member/viewer expected; assigning uses user_id, not member_id | OP-11 and member mapper; zero members accepted by parser; uniqueness/cardinality/owner guarantees U |
| EN-04 | Invitation: opaque token input, destination project optionally returned | Invite request names target/project; acceptance can yield no project ID | OP-12/OP-13; record schema, default role, expiry, recipient binding, duplicate behavior and cascade U |
| EN-05 | Epic: UUID-like id/project_id, epic_id display code, title, description, created_at, deadline, creator/assignee projections | Project-scoped; optional assignee; task epic association checked within project for task writes | OP-14–OP-18; views/empty-assignee object and database constraints distinct |
| EN-06 | Task: id, task_id code, project_id, optional epic_id/assignee_id/due_date/description, status | Project required by handlers; epic/assignee nullable and scoped during writes; nested user/epic display projections | OP-19–OP-23/OP-29; view representation differs from storage; transition graph/cascades/ordering U |
| EN-07 | Aggregate projections: daily status counts, totals, project task counts | Derived date/project/status views rather than new editable entities | OP-27/OP-28; denominator, overdue scope, counting logic and all-project visibility U |

Session implementation evidence: [src/lib/auth/auth-cookies.ts:L1–L56](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/lib/auth/auth-cookies.ts#L1-L56); [src/lib/auth/recovery-cookie.ts:L1–L36](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/lib/auth/recovery-cookie.ts#L1-L36); [src/lib/auth/session.ts:L1–L78](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/lib/auth/session.ts#L1-L78). Access cookie is session-scoped; remember-me extends refresh/remember cookies 30 days; recovery cookie is HTTP-only, strict same-site, scoped to reset API and 10 minutes. These are code settings, not proof of live session lifetime.

## Permission and Error Matrix

All rows describe source checks. H-cookie means cookie presence only, not independently verified identity; H-verified means the handler calls verification and then relevant local access checks. PM headers are example configuration, not a permission model. Error lists include explicit and propagated branches, not guaranteed exhaustive runtime outcomes.

| Operation | Source-level permission/session rule | Source error/status handling | Design obligation |
|---|---|---|---|
| OP-01 | Unauthenticated form; no pre-existing session required. | 400 validation; 409 recognized duplicate account; 500 configuration; other upstream status. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-02 | Credentials establish session; remember choice controls persistence, not token validity. | 400; recognized bad credentials 401; 500; malformed upstream 502; other upstream status. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-03 | Internal session verification; collection noauth setting does not remove explicit bearer header. | Verifier returns null for unsuccessful response/invalid shape; caller decides session behavior; transport errors not uniformly handled by all consumers. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-04 | Verified recovery context, not an arbitrary profile-password-change screen. | 400 validation; 401 missing/invalid recovery context; 500 config; upstream statuses. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-05 | Refresh cookie required; remember choice reused. | 401 missing/rejected refresh; 500 config; malformed token response 502. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-06 | No existing session; generic success avoids asserting account existence. | 400 invalid identifier; 500 config; upstream failure status. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-07 | Local logout allowed without a current credential. | Remote failures do not prevent local logout; cookie/runtime failures not certified. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-08 | Session-cookie presence; no explicit handler-level role/identity verification. | 400 pagination; 401 missing session; 500 config; upstream statuses including possible 416. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-09 | Cookie presence only; actual creation authorization unverified. | 400 field errors; 401; 500; upstream status. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-10 | Cookie presence only; no explicit creator/member edit policy. | 400 field errors; 401; 500; upstream status/message. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-11 | Cookie presence only; no explicit local read-role check. | 401; 500; upstream statuses; malformed members 502. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-12 | Verified user; owner/admin/member or creator without membership; explicit viewer denied; same-origin JSON; validated configuration. | 400; 401; 403; missing project 404; 415; 500; upstream 400/401/403/409/422/429 retained, others 502. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-13 | Verified session, same-origin JSON; valid invite eligibility is upstream-dependent. | 400/401/403/404/409/410/415/422/429 and 500; unexpected/network upstream 502. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-14 | Cookie presence; no explicit local read-role verification. | 400 invalid pagination; 401; 500; invalid mapper output 502; upstream status including 416. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-15 | Cookie presence and optional assignee validation; no explicit acting-user edit-role check. | 400 schema/assignee; 401; 500; invalid member shape 502; upstream status. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-16 | Cookie presence; no explicit handler-level role check. | 401/404/500/502; upstream status. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-17 | UUIDs, verified user, same-origin JSON, creator/member edit helper (viewer denied); member assignee and scoped epic validated. | 400/401/403/404/415/500/502; upstream non-5xx status retained. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-18 | Collection explicit authentication placeholders; backend delete policy unknown. | No saved success/error examples; no runtime results. | No production action commitment; proposed denial/error/success states require contract and D-03 approval. |
| OP-19 | Verified creator or any project member can read; edit permission calculated separately; viewer read-only. | 400/401/403/404/416/500/502; invalid pagination metadata or mismatched data 502. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-20 | Verified creator or any member (including viewer); validates epic belongs to project. | 400/401/403/404/500/502. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-21 | Verified user, same-origin JSON; creator/member editor except viewer; assignee member and epic in project. | 400/401/403/404/409/415/422/500/502. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-22 | Verified editor, same-origin JSON, UUID scope; viewer denied even if creator; validates member assignee and epic scope. | 400/401/403/404/409/415/422/500/502. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-23 | Backend deletion policy unknown. | Unspecified by collection. | No production action commitment; proposed denial/error/success states require contract and D-03 approval. |
| OP-24 | Cookie presence; no explicit local role check. | 401/404/500/502; upstream status. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-25 | Verifies credential is a user session; independently proving recovery-only provenance is not established. | 400 invalid payload;401 verification;500 config. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-26 | Recovery cookie required and verified. | 401 missing/invalid context; other runtime behavior unverified. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-27 | Verified session/same-origin JSON; selected project checked for creator/member access; all-project scope relies on upstream authorization. | 400/401/403/404/415/422/429/500/502. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-28 | Verified session/same-origin JSON; all-project RPC scope depends on backend. | 400/401/403/415/422/429/500/502. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |
| OP-29 | Verified creator/member reader; canEdit separately calculated. | 400/401/403/404/500/502; wrong-scope or multirow data502. | Separate invalid input, session expiry, denial, missing resource and temporary failure where evidenced; do not show secrets or assert backend cause from status alone. |

For task/epic edit, task create and invitation helper rules, explicit viewer denial precedes creator privileges. Read-task and selected-project statistics checks allow creator or any member, including viewer. Several older collection/project/member/epic paths do not apply the same explicit checks. No universal role policy is inferred. Evidence: [src/features/tasks/utils/can-create-task.ts:L1–L23](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/utils/can-create-task.ts#L1-L23); [src/features/tasks/utils/can-edit-task.ts:L1–L18](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/utils/can-edit-task.ts#L1-L18); [src/features/epics/utils/can-edit-epic.ts:L1–L16](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/epics/utils/can-edit-epic.ts#L1-L16); [src/features/invitations/utils/can-invite-project-member.ts:L1–L23](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/invitations/utils/can-invite-project-member.ts#L1-L23); [src/features/statistics/server/statistics-api.ts:L26–L60](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/statistics/server/statistics-api.ts#L26-L60).

403 can mean role denial or origin rejection; 415 means an app-boundary content-type failure. 502 can mean upstream/network/schema/reconciliation failure and does not prove that no write occurred. Project/epic/auth legacy handlers do not uniformly wrap transport/JSON failures into the same error envelope. Do not invent universal retries or detailed user-facing backend explanations.

## Mocked test expectations and documented limitations

All tests were read as source only; none were executed. Test metadata and fixtures are not documented deployed contracts. The pinned tree contains 54 test files; all 54 were retrieved for coverage discovery, with relevant API/schema/hook cases reviewed below.

| T evidence | Expected behavior encoded in mocks |
|---|---|
| [tests/api/invitations/invite-member.test.ts:L119–L250](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/tests/api/invitations/invite-member.test.ts#L119-L250) | Origin/content/session guards; owner/admin/member and creator-without-membership allowed; viewer/outsider denied; conflict retained |
| [tests/api/invitations/accept-invitation.test.ts:L58–L222](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/tests/api/invitations/accept-invitation.test.ts#L58-L222) | Guard failures, bodyless204 acceptance, validated optional project ID, explicit backend failure and expiry/error mapping |
| [tests/api/tasks/create-task.test.ts:L59–L113](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/tests/api/tasks/create-task.test.ts#L59-L113) | Boundary guards; later cases exercise scope/assignee/epic restrictions and creation output |
| [tests/api/tasks/get-tasks.test.ts:L121–L211](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/tests/api/tasks/get-tasks.test.ts#L121-L211) | Validated IDs/paging/status, outsiders denied, viewer allowed; later cases cover scoped data, empty/416 and missing totals |
| [tests/api/tasks/search-tasks.test.ts:L116–L220](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/tests/api/tasks/search-tasks.test.ts#L116-L220) | Search before pagination; encoded special characters; no-match totals and access checks |
| [tests/api/tasks/get-epic-tasks.test.ts:L58–L142](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/tests/api/tasks/get-epic-tasks.test.ts#L58-L142) | Viewer/creator reads; all pages assembled despite upstream page cap; empty response |
| [tests/api/tasks/get-task-details.test.ts:L191–L309](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/tests/api/tasks/get-task-details.test.ts#L191-L309) | Restricted output, readonly viewer/creator precedence, null display fallbacks and unknown status preservation |
| [tests/api/tasks/update-task.test.ts:L244–L342](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/tests/api/tasks/update-task.test.ts#L244-L342) | User-ID assignment, nullable clears, changed/unchanged past dates, no-op writes, legacy values |
| [tests/api/tasks/update-task.test.ts:L372–L503](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/tests/api/tasks/update-task.test.ts#L372-L503) | Read-back for204, persisted-field verification and safe failure behavior |
| [tests/api/statistics/statistics.test.ts:L148–L210](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/tests/api/statistics/statistics.test.ts#L148-L210) | Schema/filter expectations, empty aggregates, mapped upstream errors and malformed success handling |
| [src/features/tasks/hooks/use-board-task-move.test.ts:L89–L199](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/tasks/hooks/use-board-task-move.test.ts#L89-L199) | Optimistic projection, duplicate-move blocking, definite rollback and uncertain read-back/reload |
| [src/features/statistics/components/statistics-content.test.tsx:L28–L106](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/src/features/statistics/components/statistics-content.test.tsx#L28-L106) | Partial section success/error, loading without fabricated KPI values and empty success behavior |

README attribution: backend setup is not fully bundled; RLS/SECURITY DEFINER limitations are documented; overdue counts may exceed selected-range totals; design reuse rights unverified. No current policy SQL, migrations, live responses or independent confirmation is supplied. [README.md:L90–L94](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/README.md#L90-L94); [README.md:L165–L174](https://github.com/A7madSoliman/rafiq-tasks-management-system/blob/06e216366f57b80e7db0890efdc0e605eab68be1/README.md#L165-L174).

## Backend Gaps and Open Questions

All gaps remain OPEN for evidence or owner decision; they do not block documenting a static audit, and none is silently considered resolved by setting D-02 REVIEW.

### G-01

**Saved response contracts and runtime evidence absent**

- **Evidence/observation:** All 23 collection requests have empty response examples. Handler schemas and tests supply expectations, not deployed guarantees.
- **Required evidence or decision:** Obtain sanitized success/error/header samples or authoritative schema; reconcile response evidence before treating unknown shapes as design commitments.
- **Affected scope:** OP-01–OP-29; D-03 scope confidence.

### G-02

**Deletion is collection-only**

- **Evidence/observation:** PM-18 and PM-23 declare DELETE requests, but no browser handler/caller or UI flow was found. Permission, affected-row confirmation, cascades, restoration and linked-record behavior are unspecified.
- **Required evidence or decision:** Do not include deletion as committed Orbit scope. Request contract evidence and explicit D-03 approval; design confirmation/recovery only if approved.
- **Affected scope:** OP-18, OP-23.

### G-03

**Collection omits statistics and several app-boundary operations**

- **Evidence/observation:** Project/task detail reads, recovery bootstrap/check and both statistics handlers have no dedicated collection counterpart; current-user read is internal rather than an exported route.
- **Required evidence or decision:** Treat source-only capabilities separately; ask backend owner for authoritative RPC and response definitions. Do not infer collection completeness.
- **Affected scope:** OP-03, OP-24–OP-29.

### G-04

**Authorization is heterogeneous and backend enforcement remains unverified**

- **Evidence/observation:** Task/invitation/epic-update/statistics paths include explicit user/access checks; several older project/member/epic handlers mainly check cookie presence. README documents authorization limitations.
- **Required evidence or decision:** Require database/RPC policy evidence for each operation. UI visibility and server checks do not establish RLS protection; no exploit or live defect is claimed.
- **Affected scope:** All project-scoped operations; security release prerequisite.

### G-05

**Membership invariants and invitation affordances unresolved**

- **Evidence/observation:** Members UI requires a qualifying membership record; invite helper additionally allows creator-without-membership except viewer. Member IDs and user IDs are distinct.
- **Required evidence or decision:** Confirm creator membership invariants and approved role model; reconcile action visibility in D-05/D-15. Do not silently broaden permissions.
- **Affected scope:** OP-11, OP-12; D-01 UX-13.

### G-06

**Epic update example conflicts with browser payload policy**

- **Evidence/observation:** PM-17 sends title and description together. Browser schema accepts exactly one strict field update and also supports assignee/deadline absent from that example.
- **Required evidence or decision:** Document translation incompatibility; preserve one-field sequencing as reference behavior until D-03 selects save policy. Backend batch/atomic guarantees remain unknown.
- **Affected scope:** OP-17; D-01 UX-05.

### G-07

**Date rules differ between create, edit and statistics**

- **Evidence/observation:** Task creation accepts valid past dates; task edit rejects newly changed past UTC dates. Epic creation uses pattern/lexical comparison against local today; edit accepts ISO date without equivalent handler past-date check. Statistics uses bounded date-only ranges.
- **Required evidence or decision:** Approve product date policy and timezone/week conventions; specify overdue edits and localized date display. Do not present component-only checks as backend rules.
- **Affected scope:** OP-15, OP-17, OP-21, OP-22, OP-27; D-12/D-18.

### G-08

**Status enumeration is not a transition contract**

- **Evidence/observation:** Creation/search/list parsing uses eight status constants. Detail/persisted-row schemas allow unknown nonempty strings. No current-to-next transition graph or ordering persistence contract is demonstrated.
- **Required evidence or decision:** Seek allowed transitions and legacy-value policy. Do not assume arbitrary transitions, configurable statuses, within-column ordering, or live synchronization.
- **Affected scope:** OP-19, OP-21, OP-22, OP-29.

### G-09

**Mutation confirmation and retry guarantees vary**

- **Evidence/observation:** Task edit verifies persisted changes; project/epic edits generally accept upstream HTTP success without persisted-value confirmation. Task creation can fail validation after a possible write. No idempotency key contract is evidenced.
- **Required evidence or decision:** Preserve drafts and show uncertain outcomes; reconcile reads before repeat writes where supported. Do not infer retry safety, uniqueness or transactional atomicity.
- **Affected scope:** OP-09, OP-10, OP-12, OP-13, OP-15, OP-17, OP-21, OP-22.

### G-10

**Identifier/nullability representations are inconsistent**

- **Evidence/observation:** Project list mapper accepts string or numeric IDs, while task/invitation/statistics paths require UUIDs. User identity fields differ between member/epic/task views; list and detail normalization differ.
- **Required evidence or decision:** Require canonical IDs, relation keys and nullable-field samples. Distinguish membership IDs, user IDs and human-readable task/epic codes.
- **Affected scope:** OP-08, OP-11, OP-14, OP-16, OP-19–OP-21, OP-24, OP-29.

### G-11

**Pagination/search semantics exceed collection examples**

- **Evidence/observation:** Only some collection requests show count preference/paging. Handlers add exact totals, filters and stable ordering; epic-task handler assembles all pages internally. Server caps, count consistency and large-dataset cost remain unverified.
- **Required evidence or decision:** Obtain range/empty/416 examples and cap behavior; specify partial loading and explicit retry. Task search escapes wildcard syntax; epic search does not use that same helper.
- **Affected scope:** OP-08, OP-14, OP-19, OP-20.

### G-12

**Invitation response and management contract incomplete**

- **Evidence/observation:** Accept handler tolerates bodyless or several response forms and nullable project ID; code explicitly notes undocumented response. No list/revoke/resend/role-selection operation is evidenced by supplied collection/handlers.
- **Required evidence or decision:** Confirm result, eligibility, expiry, duplicate acceptance, delivery and role assignment. Do not invent pending-invitation management or configurable invite roles.
- **Affected scope:** OP-12, OP-13; D-15 scope.

### G-13

**Authentication examples differ from app/session contract**

- **Evidence/observation:** Postman request-level noauth coexists with explicit bearer/API-key headers. Browser uses HTTP-only cookies, signup metadata mapping and recovery bootstrap. Verification establishes a user session but does not independently prove recovery-only credential provenance.
- **Required evidence or decision:** Specify user-facing session/recovery outcomes from authoritative settings; no token displays. Confirm redirects, expiry, confirmation requirements and recovery origin assumptions.
- **Affected scope:** OP-01–OP-07, OP-25, OP-26.

### G-14

**Candidate product features lack supplied evidence**

- **Evidence/observation:** No dedicated workspace entity, calendar scheduling writes, role-management editor, comments, attachments, recurring tasks or invitation-management endpoints are established by this source set.
- **Required evidence or decision:** Mark each as unverified rather than unsupported across the entire backend; exclude or defer unless D-03 receives additional evidence and owner approval.
- **Affected scope:** D-03 boundaries; D-14/D-15/D-17/D-18.

### G-15

**Successful zero-member state reachability unknown**

- **Evidence/observation:** Member mapper accepts an empty array, while member screen lacks dedicated successful zero-member guidance. Database invariants are unavailable.
- **Required evidence or decision:** Confirm whether zero members is valid, restricted or inconsistent data, then select the correct D-06/D-19 feedback state.
- **Affected scope:** OP-11; D-01 UX-07.

### G-16

**Source recovery/permission feedback is not full design coverage**

- **Evidence/observation:** D-01 identified incremental-list retry gaps and differing edit/readonly controls. Some create/edit affordances remain visible without a complete frontend role-denial design.
- **Required evidence or decision:** Use explicit API-to-screen feedback contracts in D-06/D-19 and validate runtime hypotheses later; do not reproduce missing states as design standards.
- **Affected scope:** OP-08, OP-14, OP-19; D-01 UX-06.

### G-17

**Statistics sections use different scopes and metric definitions**

- **Evidence/observation:** Calendar request supports project/status filters; per-project request accepts dates only. README/schema comments say overdue is outside selected-range scope. Aggregate calculations, all-project authorization and RPC SQL are unavailable.
- **Required evidence or decision:** Label scopes independently; verify overdue definition, filter effect, date boundaries and all-project access. Do not claim a weekly planner includes scheduling or velocity metrics.
- **Affected scope:** OP-27, OP-28; D-01 UX-14/UX-15.

## D-03 Product Scope Recommendations

These are proposals only. D-03 is not executed, and no candidate becomes approved product scope here.

| Recommendation | Evidence basis | Decision for owner |
|---|---|---|
| Candidate core | OP-01–OP-17, OP-19–OP-22, OP-24–OP-29 have app/source paths, with partial collection alignment | Consider auth, project/member/invite, epic, task and read-only statistics/calendar capabilities, subject to gaps and security evidence |
| Delete actions | OP-18/OP-23 are request examples only | Defer from committed Figma flows until permissions, cascade, confirmation and recovery are evidenced |
| Workspace concept | G-14: no distinct workspace entity established | Clarify whether workspace is a navigation concept or a separately supported entity; do not invent API behavior |
| Role and membership policy | G-04/G-05/G-12/G-15 | Approve rights using authoritative backend evidence, then map visible/disabled/denied actions in D-05/D-15 |
| Editing and statuses | G-06/G-08/G-09 | Choose save/close conventions and transition policy; no implied drag ordering, configurable workflow or transactional guarantee |
| Dates and analytics | G-03/G-07/G-17 | Approve date/timezone/week conventions and metric scope labels; distinguish calendar summaries from editable scheduling |
| Extra feature requests | G-14 | Treat comments, files, recurring tasks, role administration and invitation management as unverified additions requiring evidence |
| Design completeness | UI mapping plus D-01 states | Retain Arabic RTL/English LTR, light/dark, deliberate tablet/mobile/desktop and reduced-motion/accessibility requirements |
| Production authorization | G-04 | Require security evidence/remediation outside this design audit; no production-readiness claim |

## Validation and disposition

Collection parse/count, complete handler-method coverage, evidence-link ranges, identifier cross-links, security review and preservation checks are recorded in the separate resume report. All operations have a UI-action mapping or an explicitly unimplemented/internal disposition. No live contract behavior was tested.

D-02 is REVIEW, not DONE. The missing-file blocker is resolved; backend evidence gaps remain explicit. Await owner review and do not start D-03.
