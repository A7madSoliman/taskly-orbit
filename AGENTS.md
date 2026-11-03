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

## Default Execute contract — inherited by all task briefs

These rules apply to every Codex Execute task without being repeated in its prompt. A normal task brief should specify only **objective, bounded scope, exact Figma/source references, feature branch, task-specific checks, and report path**. Explicit owner direction is required to override a gate or expand scope.

### Context and design
- Read this file first, then the exact backlog entry and only relevant approved handoffs/D02/D06/D07 evidence. Do not re-audit accepted phases or reload unrelated documents.
- Inspect the exact source Figma nodes and existing components/tokens **before** editing. Preserve approved structures and node IDs where possible; use the selected Concept C, D10 native tokens/styles, D11 reusable components, and D12 bilingual/theme rules as applicable. Figma changes are live and must have exact links recorded in a tracked handoff.
- Reuse before creating. No invented features, API contracts, permissions, status transitions, locale/date conventions, persistence, or design tokens. Preserve open DEC/G/F holds and conditional Statistics. No delegation, dependencies, frontend or backend work unless expressly authorized for that task.

### Visual and native QA
- Every meaningful design batch must check **English LTR and Arabic RTL in both Light and Dark** using actual native semantic modes, Inter/Cairo styles, editable layers, linked instances and token bindings. Review relevant desktop and mobile compositions, not an unnecessary full state-by-mode permutation.
- Validate Arabic alignment and wrapping, mixed-script IDs, original directional-icon exceptions, logical action ordering, and **centered button labels** where the approved button design specifies centering. Supporting prose and field labels follow logical start alignment.
- For compact forms, check representative **320px, 360px and 390px** widths when relevant; ensure long Arabic content, field/error/focus states, selectable controls (including checked/unchecked Remember choice where present), action text, bottom padding and borders do not clip or conflict.
- Inspect final **rendered** Figma screenshots after material edits, not only metadata; fix material defects within scope before PASS. Clearly separate static design intent from functioning keyboard, focus, screen-reader, reduced-motion, responsive-runtime or accessibility certification.
- Validate operation-specific state meaning (loading/empty/failure; pending/rejected/uncertain/qualified), actual origin/return, and guards only where evidenced. Do not replay uncertain writes automatically or claim successful persistence from acknowledgement alone.

### Git, review, and acceptance
- For authorized meaningful work: inspect the tracked working tree first; preserve uncommitted work; update local `main` via `git pull --ff-only` and use a bounded feature branch. Do not reset, force-push, recreate repositories or rewrite published history.
- Independently review the actual diff, stage only intended safe files, run `git diff --cached --check`, and check staged paths/content for secrets. Keep `.ai/reports/` local and Git-ignored; track approvals, decisions and Figma links in handoffs/backlog.
- After a bounded **PASS** and when the task authorizes it, commit and push the feature branch, then verify remote SHA. **Never merge to `main` until the owner accepts that batch.** After approval, fast-forward/merge safely, push `main`, verify SHA, then clean up merged branches. A PARTIAL is not accepted and must not be committed or merged as PASS.
- Do not start the next task automatically. Only claim tests or validations that actually ran.

### Reports and shorter prompts
- Every meaningful Execute task writes a final `.ai/reports/<task>.md` with: **Task Report, What changed, Files changed, Decisions, Validation, Issues / Risks, Next step**. State actual PASS/PARTIAL, Figma IDs, Git branch/commit/push status, evidence limits and remaining risks.
- **Mandatory completion step:** run `scripts/copy-report.ps1 <report-path>` (restore the script if missing), then independently compare final file contents to **raw Windows clipboard with exact ordinal equality**. If the report changes afterward, copy and verify again. Never ask the owner to copy it manually.
- Keep future CLI prompts brief and task-specific; reference **`AGENTS.md`** instead of restating these rules. Report only material blockers, and avoid unnecessary repeated repair loops.

## Brand Identity and RTL/LTR

- Reuse one owner-approved brand lockup consistently; never invent separate logos for individual screens.
- Preserve the Latin `Taskly Orbit` wordmark in LTR order inside Arabic layouts. Use logical icon/text placement; do not mirror a brand symbol unless its approved meaning is deliberately directional.
- Validate both languages and Light/Dark themes, desktop/mobile placement, compact sizes, baseline/spacing and long surrounding Arabic content.
- Owner approval is required before promoting an exploration to the final brand or replacing existing screen branding.
