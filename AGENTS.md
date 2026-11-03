# Taskly Orbit agent instructions

Taskly Orbit is a brand-new, independent, bilingual task management product. Direction: Hybrid — Calm & Premium + Professional Workspace. Discovery must confirm the preliminary backlog.

## Codex-first workflow: Plan → Execute
- Codex owns architectural and final decisions, subject to project-owner requirements and design approval.

### PLAN MODE
- Analyze requirements and available evidence.
- Inspect API contracts and existing references.
- Identify UX issues, risks, and unknowns.
- Propose architecture and design alternatives.
- Prepare task breakdowns and acceptance criteria.
- Read-only: no file modifications during planning. Present planning results in the conversation.

### EXECUTE MODE
- Execute only the selected, clearly scoped task.
- Follow the approved plan when one exists.
- Review changes independently against requirements and the plan before finalizing.
- Run appropriate validation.
- Record results in a final report.

### USER CONTROL
- The project owner chooses Plan or Execute mode. Do not switch from planning to execution without owner direction.
- Significant tasks should be planned before execution.
- Small, clearly scoped changes may execute directly when requested by the owner.
- Do not automatically advance to the next task.
- Do not commit or push without authorization.
- All meaningful changes require diff review and appropriate validation. Without Git, review complete new files or preserved before/after comparisons. Record evidence and limitations.
- Inspect before editing and preserve existing files. Do not initialize an application, install dependencies, create a remote repository, commit, or push without explicit authorization.
- Historical task reports are evidence, not current workflow instructions. This file governs current work; the original D-00 report is preserved unchanged and its workflow statements are superseded by the D-00-FIX correction report.

## Design gates
1. No invented product or backend behavior. Unknown capabilities remain questions until supported by verified evidence.
2. API-to-screen traceability: map data-dependent screens, states, and actions to verified API evidence and permission constraints. Record unsupported behavior and gaps before approval.
3. Figma is the design source of truth. Record exact approved file/node links and approval versions in documentation.
4. Use reusable editable Figma components and tokens, including variants and states.
5. Design mobile and desktop deliberately and specify responsive behavior.
6. Cover Arabic RTL, English LTR, light and dark modes, including directional exceptions.
7. Specify motion accessibility and reduced-motion alternatives. Essential information must not depend on animation.
8. No frontend development until the full Figma design is approved by the project owner and approval evidence is recorded in `docs/handoff/`.

## Backend-Aware, Frontend-Focused

Taskly Orbit is a frontend-focused training and portfolio project.
- Reuse the existing Supabase backend contract; prioritize frontend architecture and UX quality.
- Do not propose new backend endpoints, tables, migrations or RPCs by default.
- Treat missing backend evidence as a documented design constraint, not an automatic new project.
- Continue independent design wherever safe; hold only behavior affected by unresolved backend evidence.
- If verification becomes necessary, propose the smallest safe read-only check.
- Explain manual backend steps plainly without assuming backend expertise.
- Never expose, log or commit secrets. Do not claim production authorization is verified without appropriate evidence.

## Reference isolation
Original Taskly: https://github.com/A7madSoliman/rafiq-tasks-management-system . Preserve it as a separate read-only reference. Do not modify it, merge its history, or import its implementation. The existing Supabase API contract is intended for later use, subject to audit. D-00 does not perform an API audit or validate Figma connectivity.

## Security
No credentials, tokens, email addresses, or API secrets in agent reports or committed reference files. Sanitize uploaded API samples before storing or sharing: remove authorization headers, cookies, keys, personal data, email addresses, secrets in URLs, and sensitive request/response values. Inspect nested fields and metadata; use synthetic placeholders. Keep unsanitized samples outside tracked references and reports. Never print sensitive content during validation.

## Reporting
Use TODO, IN_PROGRESS, BLOCKED, REVIEW, or DONE. During Execute mode, keep dependencies current. Reports in `.ai/reports/` require: Task Report, What changed, Files changed, Decisions, Validation, Issues / Risks, Next step. After finalizing an Execute-mode report, run `scripts/copy-report.ps1 <report-path>` and verify clipboard equality without printing its content. Plan mode remains read-only: present findings and proposed tasks in the conversation without writing reports or updating files.
