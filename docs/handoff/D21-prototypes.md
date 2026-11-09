# D21 — Interactive Prototypes / B01–B02

## Final owner acceptance — 2026-11-10

**D21 DONE:** The owner explicitly approved D21-v1 Interactive Prototypes as the final **DESIGN-ONLY** baseline, including B01 and B02 representative interactive journeys. Dated batch records below are historical; their pending-review and TODO statements are superseded by this acceptance. Preview links, tested versus wired-only coverage, simulation limitations and Reduced Motion equivalents remain applicable. Approval does not imply every control is functional, dynamic form validation, backend or data persistence, runtime accessibility certification, or complete application state. Existing DEC/G/F holds and backend-agnostic design rules remain in force; D22–D23 remain TODO. Full Figma approval remains required before frontend development.

Historical B02 status before acceptance: B02 representative coverage is REVIEW, pending owner acceptance; D21 remains TODO. See the B02 extension below for current entry points, tested versus wired-only coverage and remaining gaps. B01 records below retain their original dated evidence; the B02 brief designates B01 as its accepted source.

Historical B01 status: D21 was TODO, retained by explicit owner instruction until full prototype coverage and owner review. B01 status: REVIEW — bounded pointer-navigation QA PASS, pending owner batch acceptance. D21-B01-v1, 2026-11-09. No D22 work is started.

## Start here

Existing Figma file: `o5x1eCbKM7xPx7SKB0hsI9`. [Dedicated prototype page 316:437](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=316-437). The first configured flow is the core authentication entry below. These are real Figma connections, not static flowcharts.

| Native starting point | Exact entry / canvas link |
| --- | --- |
| RM / Instant / 01 EN Light desktop / Sign in → Projects → Tasks | [Open prototype](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=324-44&page-id=316%3A437&starting-point-node-id=324-44&scaling=scale-down) · [324:44](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-44) |
| RM / Instant / 02 EN Light desktop / Create, details and conditional status | [Open prototype](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=324-337&page-id=316%3A437&starting-point-node-id=324-337&scaling=scale-down) · [324:337](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-337) |
| RM / Instant / 03 EN Light desktop / Epics → nested Task Details | [Open prototype](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=324-427&page-id=316%3A437&starting-point-node-id=324-427&scaling=scale-down) · [324:427](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-427) |
| RM / Instant / 04 AR Dark mobile / Tasks → Details → actual return | [Open prototype](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=324-3532&page-id=316%3A437&starting-point-node-id=324-3532&scaling=scale-down) · [324:3532](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-3532) |
| RM / Instant / 05 AR Light mobile / Projects → qualified context → Tasks | [Open prototype](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=324-3681&page-id=316%3A437&starting-point-node-id=324-3681&scaling=scale-down) · [324:3681](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-3681) |
| RM / Instant / 06 EN Dark desktop / Statistics + language/theme controls | [Open prototype](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=324-3381&page-id=316%3A437&starting-point-node-id=324-3381&scaling=scale-down) · [324:3381](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-3381) |
| 07 D20 standard / EN Light Tasks dialog entrances | [Open prototype](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=363-2519&page-id=316%3A437&starting-point-node-id=363-2519&scaling=scale-down) · [363:2519](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=363-2519) |
| 08 D20 standard / EN Light nested Epic/Task entrances | [Open prototype](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=363-2607&page-id=316%3A437&starting-point-node-id=363-2607&scaling=scale-down) · [363:2607](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=363-2607) |

Entries 01–06 provide complete **Instant / Reduced Motion** paths for this bounded core sample. Entries 07–08 additionally exercise D20 standard dialog entrances; they share the same settled content and immediate outcome states. Full D20 choreography is not claimed as complete prototype coverage. Desktop viewport studies are 1200×1000 (Statistics 1472×1000); mobile studies are 390×844, with native vertical overflow for longer accepted content. These viewport crops do not redefine responsive breakpoints.

## Capability check completed first

Before constructing the core graph, copied accepted D13 ready/pending screens to evidence-only frames [316:438](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=316-438) and [316:450](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=316-450). The actual native Sign in instance `316:447` received an `ON_CLICK` → `NODE / NAVIGATE` reaction to `316:450`, with no transition. A real click in Figma's web prototype preview changed the current node from 316:438 to 316:450 and rendered “Signing in…”. Authoring, destination readback and actual playback therefore passed before flow construction.

[Capability-test entry](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=316-438&page-id=316%3A437&starting-point-node-id=316-438&scaling=scale-down) remains labeled Evidence only. Its source screens and original Sign in button were not edited. The installed official Figma tool supports `setReactionsAsync`, page `flowStartingPoints`, `NAVIGATE`, `OVERLAY`, `SWAP` and `CLOSE` in this session. Preview QA used an isolated Chrome profile with native browser debugging and existing Node built-ins; no package/dependency installation, user-profile access or credentials were required.

## Sources and simulation boundaries

[D05 approved journeys](../ux/D05-user-journeys.md), [D06 state matrix](../ux/D06-screen-state-matrix.md), accepted [D13 authentication](D13-authentication.md), [D14 projects](D14-projects.md), [D15 membership](D15-members-invitations.md), [D16 epics](D16-epics.md), [D17 tasks](D17-tasks.md), [D18 Statistics](D18-statistics.md), [D19 feedback](D19-feedback-states.md), and [D20 motion](D20-motion.md) remain authoritative. Exact supplied source pages: D17 Tasks `243:1381`, Create Task `249:403`, Task Details `257:2`; D18 Dashboard `295:443`; D19 feedback `302:2`; D20 motion `311:2`. Base commit verified: `276b14abc5029d567861e580a42e094bd715e51e`.

Reused native D11 references: [Buttons 138:161](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=138-161) · [Text Field 138:212](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=138-212) · [Dialog Shell 152:578](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=152-578) · [Decision Patterns 152:697](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=152-697) · [Option Row 151:449](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=151-449) · [Display Controls 159:1331](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=159-1331).

Approved product layers are copied into prototype-only viewport wrappers. Linked D11 instances, Concept C, approved Orbit Atelier lockup, Inter/Cairo, semantic Light/Dark, original directional exceptions and existing geometry remain in use. No original approved page/master was intentionally changed, no new Figma file/component family/token/style was created, and no app or backend was implemented.

The clearly separated **PROTOTYPE SIMULATION / No backend** bar is test apparatus, not product UI. It chooses synthetic response scenarios, qualified context assumptions and fixture restarts. It is never presented as an API response, permission grant, product preference setting or automatic action. Actual product buttons/cards/options carry the normal journey connections.

Fields are fixed design fixtures, not live text inputs or validation engines. Sign in/Create task submission branches explicitly assume locally valid synthetic input and separately established eligibility; the placeholder rendering is not proof that blank input is accepted by the product. All response choices are deliberate simulation clicks. Pending does not time out to success, uncertainty never automatically retries a write, and collection fixtures do not prove persistence, creation identity or successful reconciliation. The Tasks header explicitly identifies its fixed baseline on return.

## Core interaction coverage and actual preview results

| Core journey | Connected path / actual click targets | Preview-tested result |
| --- | --- | --- |
| 1 Authentication / J-01, J-05 | Native Sign in → pending; simulation rejection / uncertainty / qualified response; native Continue → Projects; first Project Card → context check → simulated qualified Tasks destination with shell | PASS: actual submit and Continue controls clicked; node IDs changed to the expected destinations. Rejection and uncertainty remained distinct; no automatic replay |
| 2 Project navigation / J-05, J-11 | First project → context checking; labeled qualified Tasks or Epics choice; first Open epic → Epic Details | PASS: both qualified destinations traversed; context assumptions remain explicit rather than a verified authorization claim |
| 3 Create task / J-13 | Tasks Create task → native overlay; form Create task → pending; simulated rejection → Correct draft; uncertainty → Read back / explicit Leave; qualified acknowledgement → Return → originating collection-read specimen → explicit observed-origin return | PASS: dirty Cancel → Keep editing, rejection/correction, uncertainty/readback/return, and qualified acknowledgement/read/return exercised. Return closes to the captured Tasks parent, not a guessed created task |
| 4 Task details / J-12, J-14 | Tasks Open task → Details; Edit description → description editor; Cancel → prior Details; explicit title Save → pending → qualified result; description Save → operation-specific pending/result. Epic Details Open task → nested Details → Back to epic → Back to epics | PASS: actual edit/save/cancel controls and both parent-return paths exercised; nested layering inspected in rendered preview. Description fixtures retain description draft/observed value rather than mislabeling it as a title update |
| 5 Status / J-15 | Change status → unselected conditional option; choose In progress → selected proposal → Confirm → pending → simulated rejection / uncertainty / qualified result; deliberate Read current status and safe fixture return | PASS: all three outcome branches traversed; disabled Confirm before selection did not advance. Pending/rejection/uncertainty retain last-confirmed To do; only qualified result displays In progress |
| 6 Statistics / display / J-16, J-17 | Statistics entry / labeled fixture launcher; native Language / appearance → overlay; English/Arabic and Light/Dark option rows swap matching complete fixtures; native Close → matching Statistics variant | PASS: EN Dark → AR Dark → AR Light → EN Light → EN Dark → Close exercised. Selected checks, panel, direction and underlying dashboard changed together; existing synthetic/conditional labels remained |
| Mobile sample / J-05, J-14 | AR Dark Tasks native Open task → Details → native return; labeled Projects fixture → AR Light Projects; first native project action → qualified-context AR Light Tasks | PASS: real navigation node IDs and final mobile renders checked, including vertical overflow to the task action and actual-parent return |
| Standard D20 entrance sample | Standard Tasks → Create Task / Task Details; Standard Epics → Epic Details → nested Task Details; dirty discard and actual-parent returns | PASS: native 8 px → 0 / 180 ms ease-out entrance stages traversed in preview. Screencast captured 19 frames / 11 unique images; sampled surface top moved 268 → 265 → 263 → 262 → 261 → 260 with opaque readable content. Standard nested returns and the instant counterparts were also exercised |

Only the paths in this table are claimed as preview tested. Native-wired but unexercised branches (for example task-detail rejection/uncertain/readback and additional equivalent close/leave controls) remain **wired-only evidence**, not verified working paths. A destination resolving in metadata alone is not counted as playback success.

## Overlay, recovery and motion rules

- Opening Task/Epic Details and Create Task establishes a real Figma overlay parent. In-overlay state changes use SWAP; permitted CLOSE returns through the actual overlay stack. The Epic-origin nested Task Details preserves the actual still-open Epic Details parent. Mobile return is a specific fixture destination, not universal browser-history restoration.
- Pending product submit/close controls have no navigation reaction. Outside-overlay interaction is NONE. Pointer tests on the pending submit control and outside the surface retained pending; only the simulation bar selected a response. Dirty exit offers Keep editing / Discard draft. This demonstrates bounded pointer guards, not guaranteed interception of browser exit or Figma viewer keyboard/chrome controls.
- No timed outcome, automatic response, write replay, moving chart, counting value or simulated network request exists. The only four AFTER_TIMEOUT triggers are presentation-only entrance stages described below; none leads to an operation response. Uncertain recovery goes to deliberate read/leave; no title match or absence proves identity/outcome. Qualified confirmation is a synthetic checked-result scenario, not durability proof.
- Entries 01–06 use immediate transitions (`transition: null`), matching D20's complete Reduced Motion alternative. Standard sample entries 07–08 add only the approved 8 px / 180 ms dialog entrance. Information/actions remain visible from the initial pose; no animation is needed to understand or choose an action. No new motion token or preference setting is introduced.
- Local language/theme choices swap fixed existing semantic variants and close to their corresponding view. Already selected choices are deliberate no-ops. This is not saved preference state or synchronization across every journey. The prototype does not add a Save action, default, system-following behavior or persistence promise.
- Fixed collection data and lab restarts are not a stateful backend. A return to a baseline collection does not certify a fresh read or overwrite the earlier qualified/uncertain meaning. Future implementation must perform accepted scoped reconciliation and actual authorization separately.

## Standard and Reduced Motion mapping

The standard samples use four transient presentation frames: [Create entrance 363:2761](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=363-2761) → ready Create 324:593; [Task Details entrance 363:2886](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=363-2886) → Details 324:1565; [Epic entrance 363:3011](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=363-3011) → standard Epic 363:2664; [nested Task entrance 363:3108](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=363-3108) → Epic-origin Details 324:1690. They are presentation phases, not new product routes, eligibility states or outcomes.

Each initial pose keeps the accepted foreground shell/content opaque at Y +8 px. A 1 ms presentation start trigger swaps to the identical settled context with native SMART_ANIMATE, 180 ms, cubic-bezier(0,0,0.2,1). The backdrop and other content remain fixed; text/style signatures match for all four pairs. There is no timed submission, success, retry or permission decision. Entry 01–06 reduced-motion paths skip these stages and go directly to the same settled content/actions.

Actual browser screencast frames were sampled and inspected across start/mid/settle, in addition to normal click/return testing. Measured foreground top positions 268/265/263/262/261/260 demonstrate the monotonic 8 px settle at the sampled 1× view; native metadata supplies the 180 ms duration and easing. This is bounded preview evidence, not a runtime/performance certification.

Permitted exits remain immediate in this B01 fixture. Complete 120 ms exit, 220 ms responsive-drawer and hover choreography, other standard-mode variants, and runtime interruption/focus behavior remain future D21 coverage; D20 remains authoritative.

## Exact fixture/source index

All listed fixtures are on the new page; no source root is repurposed as a prototype destination. Two additional evidence-only capability frames are linked above.

| Fixture | Prototype frame | Accepted source root |
| --- | --- | --- |
| signIn | [324:44](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-44) | [165:1362](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=165-1362) |
| signPending | [324:79](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-79) | [166:209](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=166-209) |
| signRejected | [324:121](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-121) | [166:235](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=166-235) |
| signUncertain | [324:165](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-165) | [166:266](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=166-266) |
| signConfirmed | [324:209](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-209) | [166:297](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=166-297) |
| projects | [324:236](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-236) | [192:176](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=192-176) |
| projectChecking | [324:283](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-283) | [193:621](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=193-621) |
| tasks | [324:337](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-337) | [243:1382](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=243-1382) |
| epics | [324:427](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-427) | [216:1445](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=216-1445) |
| epic | [324:485](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-485) | [232:20](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=232-20) |
| create | [324:593](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-593) | [249:404](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=249-404) |
| createDirty | [324:718](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-718) | [249:2940](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=249-2940) |
| createPending | [324:861](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-861) | [249:3031](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=249-3031) |
| createRejected | [324:1008](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-1008) | [249:3120](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=249-3120) |
| createUncertain | [324:1148](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-1148) | [249:3209](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=249-3209) |
| createAck | [324:1291](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-1291) | [249:3300](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=249-3300) |
| createRead | [324:1431](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-1431) | [249:4003](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=249-4003) |
| details | [324:1565](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-1565) | [257:3](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=257-3) |
| detailsEpic | [324:1690](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-1690) | [257:3334](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=257-3334) |
| detailsEdit | [324:1832](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-1832) | [260:2183](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=260-2183) |
| detailsPending | [324:1959](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-1959) | [257:1989](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=257-1989) |
| detailsRejected | [324:2078](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-2078) | [257:2069](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=257-2069) |
| detailsUncertain | [324:2196](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-2196) | [257:2147](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=257-2147) |
| detailsQualified | [324:2313](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-2313) | [257:2229](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=257-2229) |
| detailsRead | [324:2428](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-2428) | [257:2467](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=257-2467) |
| statusChoice | [324:2543](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-2543) | [243:2969](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=243-2969) |
| statusSelected | [324:2649](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-2649) | [243:2969](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=243-2969) |
| statusPending | [324:2751](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-2751) | [243:3030](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=243-3030) |
| statusRejected | [324:2850](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-2850) | [243:3087](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=243-3087) |
| statusUncertain | [324:2945](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-2945) | [243:3144](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=243-3144) |
| statusQualified | [324:3041](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-3041) | [243:3201](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=243-3201) |
| statusRead | [324:3136](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-3136) | [243:3258](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=243-3258) |
| stats | [324:3230](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-3230) | [295:443](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=295-443) |
| statsDark | [324:3381](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-3381) | [295:713](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=295-713) |
| mobileTasks | [324:3532](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-3532) | [243:2116](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=243-2116) |
| mobileDetails | [324:3624](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-3624) | [257:890](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=257-890) |
| mobileProjects | [324:3681](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-3681) | [192:369](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=192-369) |
| mobileTasksLight | [324:3721](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-3721) | [243:1978](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=243-1978) |
| statsAR | [325:1956](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=325-1956) | [295:578](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=295-578) |
| statsARDark | [325:2107](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=325-2107) | [295:848](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=295-848) |
| displayENLight | [325:2258](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=325-2258) | [295:443](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=295-443) |
| displayENDark | [325:2409](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=325-2409) | [295:713](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=295-713) |
| displayARLight | [325:2560](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=325-2560) | [295:578](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=295-578) |
| displayARDark | [325:2711](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=325-2711) | [295:848](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=295-848) |
| descriptionPending | [345:2406](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=345-2406) | [257:1989](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=257-1989) |
| descriptionQualified | [345:2521](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=345-2521) | [257:2229](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=257-2229) |
| standardTasks | [363:2519](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=363-2519) | [243:1382](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=243-1382) |
| standardEpics | [363:2607](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=363-2607) | [216:1445](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=216-1445) |
| standardEpic | [363:2664](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=363-2664) | [232:20](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=232-20) |
| enterCreate | [363:2761](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=363-2761) | [249:404](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=249-404) |
| enterDetails | [363:2886](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=363-2886) | [257:3](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=257-3) |
| enterEpic | [363:3011](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=363-3011) | [232:20](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=232-20) |
| enterEpicTask | [363:3108](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=363-3108) | [257:3334](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=257-3334) |

Description pending/result use existing D17 pending/result compositions with local, editable synthetic description labels/data. The unselected status choice reuses D11 Unselected Option Row and Disabled Button variants; selecting the evidenced option leads to the accepted selected proposal before Confirm. Local copies received centered button labels and simulation-label sizing/RTL-order repairs; source masters retain their IDs.

## Bounded QA evidence and limitations

Native final readback: **55 top-level frames, 5,919 descendant nodes, 1,478 linked instances, 113 actions (109 ON_CLICK including the capability test, four presentation-only AFTER_TIMEOUT), zero missing masters and zero missing destinations**. Eight core starting points plus one evidence entry are configured. No timed outcome exists. No simulation-header text extends outside its header. Collections remain 61 primitives / 43 semantic colors / 15 geometry variables, with 20 text styles and two effect styles. Inter/Cairo remain the only sampled text font families.

Original selected source controls/roots still resolve with their recorded geometry and no reactions added: Sign in `165:1381`, Tasks Create `243:1389`, Open task `I243:4093;148:97`, D11 Dirty exit `152:579`, Display Controls EN Light `159:1255`, D18 Dashboard `295:443`, D20 overview `311:3`. All D21 writes were confined to page 316:437 and its descendants. This is targeted preservation evidence, not a whole-file fingerprint certification; prior source-evidence limits remain.

QA used actual Figma prototype preview pointer events in isolated Chrome, checked navigation destinations, and inspected rendered states/overlay returns. Representative desktop EN Light, desktop EN Dark and Arabic Light/Dark display states, plus mobile AR Light/Dark 390 px frames were reviewed. Short canvas-render delays required waiting for settled renders; an early black/transient capture was not accepted as PASS. Material simulation-label clipping and ambiguous heading/button targeting were fixed before final retests. Final description-pending wording was additionally rendered after the operation-specific copy repair. Existing D13–D20 full visual QA was reused rather than repeated.

Remaining coverage before full D21 acceptance:

- Full approved-journey/state coverage beyond this core sample; every locale/theme/viewport permutation; mobile creation/status editing and all parent variants; 320/360 prototype playback (390 sampled here), tablet and dynamic resizing.
- Additional auth/recovery/invitation flows, unknown/denied eligibility routes, other project cards, field/options/validation engines, search/filter/pagination, remaining field edits, mobile drawers and Statistics range/filter/read controls. Visible accepted controls outside the coverage table are not promised to be interactive.
- Stateful form data, dynamic origin/history restoration, dirty-state detection, collection reconciliation, saved preferences and context survival. Fixtures show selected branches and intentional returns, not a complete application state machine.
- Full standard-motion coverage beyond the sampled entrances (including exits/drawers/hover), keyboard/focus traps and focus return, screen readers, touch/real-device testing, text resizing, scroll/keyboard clearance and runtime Reduced Motion preference detection. Pointer success is not accessibility or WCAG certification. Native viewer next/previous/restart/Escape controls are outside production guard enforcement.
- All native-wired branches not exercised in preview remain labeled as such; full semantic/state coverage and owner review are still required.

DEC-05/06/07/08/11/12 remain unresolved; G-01–G-17 OPEN; F-17–F-20 deferred; Statistics conditional under G-17. Design is backend-agnostic; audited legacy Supabase remains optional. No permission, transition policy, API compatibility, RLS, persistence, security or production readiness is verified. Frontend remains gated on full owner Figma approval. D21 stays TODO, B01 awaits owner batch review, D22–D23 stay TODO. Stop after B01; no D23 cleanup is performed.

## B02 — Prototype Coverage Completion / 2026-11-10

B02 status: **REVIEW — bounded representative pointer/navigation QA PASS**, pending owner review. D21 remains **TODO**. The owner designated B01 page 316:437 as the accepted source for this extension. B01's dated evidence and limitations above remain historical; the coverage below supersedes only the gaps explicitly exercised here. No D22 or D23 work is performed.

Safely fast-forwarded main to verified B01 commit `66e28fb79bf801418e51258443777331ec5844c0`; verified B01 ancestry before deleting its merged local/remote feature branch. B02 uses `design/d21-b02-prototypes`. All Figma edits are within the existing prototype page; approved product source pages, masters and tokens are preserved.

### B02 entry points

All B02 paths are Instant / Reduced Motion equivalents. Start Epic create/edit from the accepted B01 Epics collection, so overlays capture a real parent; do not start an isolated overlay and expect CLOSE to reconstruct an origin.

| Journey entry | Actual Preview link | Exact root |
| --- | --- | --- |
| signup | [Open Preview](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=377-2892&page-id=316%3A437&starting-point-node-id=377-2892&scaling=scale-down) | [377:2892](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-2892) |
| recovery | [Open Preview](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=377-3145&page-id=316%3A437&starting-point-node-id=377-3145&scaling=scale-down) | [377:3145](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3145) |
| resetEntry | [Open Preview](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=377-3272&page-id=316%3A437&starting-point-node-id=377-3272&scaling=scale-down) | [377:3272](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3272) |
| members | [Open Preview](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=377-3557&page-id=316%3A437&starting-point-node-id=377-3557&scaling=scale-down) | [377:3557](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3557) |
| landing | [Open Preview](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=377-4093&page-id=316%3A437&starting-point-node-id=377-4093&scaling=scale-down) | [377:4093](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4093) |
| projectView | [Open Preview](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=377-4725&page-id=316%3A437&starting-point-node-id=377-4725&scaling=scale-down) | [377:4725](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4725) |
| mobileEN | [Open Preview](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=377-6385&page-id=316%3A437&starting-point-node-id=377-6385&scaling=scale-down) | [377:6385](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6385) |
| statsScope | [Open Preview](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=377-6832&page-id=316%3A437&starting-point-node-id=377-6832&scaling=scale-down) | [377:6832](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6832) |
| permissionUnknown | [Open Preview](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=377-6371&page-id=316%3A437&starting-point-node-id=377-6371&scaling=scale-down) | [377:6371](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6371) |
| Epics create/edit, extending B01 | [Open Preview](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=324-427&page-id=316%3A437&starting-point-node-id=324-427&scaling=scale-down) | [324:427](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-427) |
| AR Dark mobile create/drawer, extending B01 | [Open Preview](https://www.figma.com/proto/o5x1eCbKM7xPx7SKB0hsI9/Taskly-Orbit?node-id=324-3532&page-id=316%3A437&starting-point-node-id=324-3532&scaling=scale-down) | [324:3532](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=324-3532) |

The page now has 18 configured native starting points, including B01 evidence/standard entries. B02 adds 90 bounded fixed-state frames, not a new component family or new product-screen design. Existing B01 connections are reused; new entry actions/lab links extend B01 roots `324:44`, `324:236`, `324:427`, `324:485`, `324:3532` and `324:3381`. Their lab headers are allowed to grow; original accepted product roots are not prototype destinations. Reused D11 references include [Responsive Drawer 150:349](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=150-349), [Shared Feedback 149:151](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=149-151), plus the Button, Dialog Shell and Decision references recorded above.

### Journey coverage and evidence

“Tested” means real pointer playback in Figma Preview plus relevant settled render inspection. “Wired-only” means native reaction/destination readback without a claim that that branch was played. The native graph resolves all destinations; that alone is not playback verification.

| Priority / traceability | Representative tested navigation | Wired-only / remaining coverage |
| --- | --- | --- |
| Authentication / J-01, J-02, OR-S02–S04 | Sign in → Sign up → pending → rejection → explicit resubmit → uncertainty → Recovery; recovery request → qualified generic acknowledgement → Sign in. Supplied reset-entry lab → context check → unavailable → deliberate check → separately qualified context → Reset → pending → uncertain → Sign in; reset dirty Keep editing; qualified reset → Sign in. Qualified Sign up → Sign in also exercised | Recovery rejection/uncertainty, invalid reset context and reset rejection remain wired-only. No recovery email/link delivery, session or reset-context provenance is proven |
| Members / Invite / J-08, OR-S09–S10 | Members → Invite overlay → dirty Cancel → Keep editing; send → rejection → Review draft; send → uncertainty → actual Members return; qualified acknowledgement → Close to captured Members. Unknown eligibility and established restriction fixtures each → Safe return | Stay/review is a deliberate no-op; dirty Discard is wired-only. No roster read or displayed role grants invitation rights; acknowledgement proves neither delivery nor membership |
| Invitation landing / J-09, OR-S11 | Explicit Accept → simulated denied → safe Projects; separately qualified acknowledgement with reference → B01 context-check gate; acknowledgement without reference → Projects | Unknown eligibility and uncertain acceptance remain wired-only. Auth continuation/context survival are unsupported simulations; no automatic acceptance or project-access guarantee |
| Projects / J-06, J-07, OR-S07–S08 | Projects → Create overlay → dirty Cancel/Keep; pending → definite rejection → deliberate resubmit; uncertain → Review Projects → explicit observed-origin CLOSE. Qualified acknowledgement → same read specimen/origin. Project view → Edit name → Cancel; Back → dirty Keep; Save → uncertainty → Read current values → Back to originating Projects fixture | Detail rejection/acknowledgement, dirty Discard and further field edits are wired-only or unwired. Baseline return/read fixtures cannot establish creation identity, durable persistence or causation |
| Epics / J-10, J-11, OR-S13–S14 | Epics → Create → dirty Discard → actual collection; create → uncertain → collection-read specimen → actual origin; qualified acknowledgement → read/origin. Preserved B01 Open epic → edit-title lab → Cancel → parent; Back → dirty Keep; Save → uncertainty → deliberate Read current value → actual Epics CLOSE | Create rejection, edit rejection/acknowledgement and equivalent exits remain wired-only. Edit-title lab explicitly selects an already qualified fixed draft; it is not an invented product edit permission |
| Mobile Tasks / J-13–J-15, OR-S15–S17 | EN Light 390 Tasks → actual drawer / Close; Task Details / Back; Create → pending → rejection → Correct draft; uncertain → explicit actual-parent review/return; qualified acknowledgement / Return. Conditional status option → Confirm → pending → uncertain → deliberate parent review; qualified result / Return. AR Dark 390 Create → explicit pending lab → 320px Arabic uncertain content → review/actual Tasks; AR drawer / Close | Status policy, live selectors/typing, mobile field edits, other parent variants and remaining status outcomes are not a full mobile application. Read actions expose a fixed parent snapshot, not executed reconciliation |
| Statistics / J-16, OR-S18 | Independent Calendar View results → loading → simulated failure/partial → Retry section → Calendar loading → qualified fixed result. Independent Per-project View results → its loading → its failure/partial → its Retry → qualified result. Error text and final scrolled project error render inspected | Cancel-to-fixed-scope controls are wired-only; already-current Cancel is a no-op. Date typing, options, dynamic filters and result computation are unwired. Fixed Calendar range 2026-11-01–07 and independent Per-project range 2026-11-03–05 are synthetic examples, not defaults or policy |
| Permission / recovery | Members unknown and established restriction, plus invitation denied, were played as distinct states. Denial safely returns; invitation reference still enters the existing separate context check | Standalone D19 unknown/denied entry routes are wired-only. No prototype performs permission checks or infers a role policy |

### Native behavior, motion and simulation limits

- Product controls carry the normal actions; the separate **PROTOTYPE SIMULATION / No backend** bar names fixed fixtures and says other controls are unwired. Lab controls select synthetic rejection, uncertainty, acknowledgement or qualified context. They are not API calls, checks, live responses, real grants or product settings.
- Text fields, date inputs and options are fixed display fixtures. Submission represents a separately assumed valid synthetic draft and applicable eligibility; placeholder appearance does not authorize blank input or bypass validation. No credentials/context material is captured. No working typing/validation, durable state, network or persistence engine is implemented.
- Desktop create/invite and Epic editing use actual OVERLAY → SWAP → CLOSE stacks. Project details uses an explicit Projects-origin fixture. Mobile Create/Details/status/drawers use captured native overlay parents. Pending product submit/exit controls are unwired; there is no timed outcome, duplicate mutation or automatic uncertain-write replay. Figma viewer chrome/Escape/browser exit are outside these pointer guards.
- Dirty fixtures represent an explicitly selected dirty case, not dirty-state detection. Cancel field edit discards only the unsubmitted fixed field draft. Acknowledgement never implies independently verified persistence; uncertainty is not silently converted to success on return.
- Mobile “Read back” / “Read current status” / Arabic origin review deliberately return to the fixed captured Tasks snapshot. They do not perform a read or establish reconciliation, current status, creation identity or outcome. Collection snapshots and lab restarts remain fixed examples. This limitation must remain visible in implementation handoff.
- Loading/error/partial Statistics frames replace only the affected result block. Native text signatures confirmed the other section is identical to its fixed baseline in all four loading/error fixtures. Retry is section-specific. Date scopes stay separate; no Calendar filter is inherited by Per-project. Aggregate semantics remain conditional under G-17.
- Every B02 action is immediate with no required animation, preserving D20 information/action equivalence. Reuse B01 entries 07–08 and their already-tested 180 ms/8px standard dialog entrance evidence above; no repeated motion audit is claimed. B02 does not add standard drawer/exit/hover choreography. The four existing B01 presentation-only timers remain the only timers.
- Drawer specimens reuse D11 responsive drawer instances over the actual Tasks backdrop; Close restores the captured Tasks parent. Other drawer items, search, pagination, unlisted navigation, secondary field edits and fixed option controls are explicitly unwired under the banner. Stay/review and selected/current-scope no-ops do not fabricate a result. These are review specimens, not a complete application.
- AR Dark uncertainty reuses accepted 320px long-Arabic content centered in an opaque 390px prototype overlay; its content width is 320px, not a claim of a tested 320px browser viewport. This prevents unrelated parent content bleeding around it. Inter/Cairo, native semantic modes, logical actions, Latin brand direction and non-color feedback meaning are retained.

### Bounded final QA

Used the installed isolated Chrome Preview/debugging setup and existing Node built-ins; no dependencies or user-profile credentials were needed. Pointer suites: authentication, Members/invitations, Projects, Epic create, Epic edit, mobile, Statistics, final compact RTL retest, and qualified outcomes. Click logs and temporary screenshots remain outside the tracked repository. Navigating frames is checked against expected native IDs; Figma keeps the parent URL during overlays, so overlay/SWAP claims additionally rely on captured renders and native reaction readback.

Final representative renders include authentication uncertainty/acknowledgement, invitation uncertainty and restriction, project/Epic uncertainty/readback, EN mobile pending/uncertainty/status, AR Dark drawer and long Arabic uncertainty, Calendar partial error and scrolled Per-project error. Initial scroll-restoration test-coordinate errors were corrected and mobile navigation rerun; they are not counted as passes. Corrected material defects before PASS: compact decision feedback overflow, clipped stacked lab buttons, wrong Calendar error wording, and 320/390 overlay-edge bleed. Only final passing renders are acceptance evidence.

Native audit found 1,168 linked instances in the B02 fixture set, no missing masters, Inter/Cairo fonts and 4,472 nodes with variable bindings. Final targeted checks found no lab-header overflow or missing prototype destination. Sampled accepted source roots retained their names/geometry and zero prototype reactions: 176:254, 188:103, 203:100, 205:243, 209:133, 194:204, 199:1376, 224:3, 232:20, 249:808, 243:1909, 295:443 and 311:3. This is targeted preservation evidence plus mutation scope, not a whole-file historical fingerprint proof.

Remaining D21 gaps: wired-only branches above; session restoration/sign-out and other approved journeys beyond B01/B02; full per-field/option/search/filter/pagination interactions; stateful data/context/history; full standard motion; complete 320/360/tablet viewport playback and real devices; keyboard/focus return/trapping, screen readers, touch, keyboard clearance and runtime Reduced Motion detection. These pointer/native samples do not certify runtime accessibility or WCAG. No previous full visual audit is repeated.

DEC-05/06/07/08/11/12 remain unresolved; G-01–G-17 OPEN; F-17–F-20 deferred; Statistics conditional under G-17. Backend-independent requirements and optional legacy Supabase integration remain unchanged. No backend authorization/RLS, transition, API, security or persistence validation is claimed. Full owner approval remains required before frontend work. D21 stays TODO pending owner review; D22–D23 stay TODO. Stop after B02.

### B02 exact fixture/source index

All new roots below are on page 316:437. Accepted product/B01 sources are reused in prototype-only fixtures; mobileARPending derives from the new B02 mobile fixture as listed. No approved product root is edited or used as a prototype destination.

| Fixture | B02 root | Reused source |
| --- | --- | --- |
| signup | [377:2892](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-2892) | 176:254 |
| suPending | [377:2938](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-2938) | 176:867 |
| suReject | [377:2984](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-2984) | 176:931 |
| suUnknown | [377:3036](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3036) | 176:979 |
| suAck | [377:3062](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3062) | 176:1029 |
| suDirty | [377:3086](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3086) | 176:1077 |
| recovery | [377:3145](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3145) | 181:233 |
| recPending | [377:3170](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3170) | 181:620 |
| recReject | [377:3195](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3195) | 181:647 |
| recUnknown | [377:3224](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3224) | 181:679 |
| recAck | [377:3248](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3248) | 181:711 |
| resetEntry | [377:3272](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3272) | 188:439 |
| resetCheck | [377:3290](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3290) | 188:493 |
| resetUnavailable | [377:3308](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3308) | 188:560 |
| resetInvalid | [377:3336](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3336) | 188:520 |
| reset | [377:3362](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3362) | 188:103 |
| resetPending | [377:3393](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3393) | 188:697 |
| resetReject | [377:3424](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3424) | 188:734 |
| resetUnknown | [377:3463](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3463) | 188:767 |
| resetAck | [377:3489](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3489) | 188:802 |
| resetDirty | [377:3513](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3513) | 188:835 |
| members | [377:3557](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3557) | 203:100 |
| memberUnknown | [377:3599](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3599) | 203:527 |
| memberReadonly | [377:3643](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3643) | 204:280 |
| invite | [377:3687](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3687) | 205:243 |
| invPending | [377:3749](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3749) | 206:1849 |
| invDirty | [377:3817](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3817) | 206:1916 |
| invReject | [377:3887](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3887) | 206:1985 |
| invUnknown | [377:3955](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-3955) | 206:2119 |
| invAck | [377:4025](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4025) | 206:2188 |
| landing | [377:4093](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4093) | 209:133 |
| landUnknown | [377:4113](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4113) | 209:747 |
| landDenied | [377:4137](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4137) | 209:818 |
| landPending | [377:4161](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4161) | 209:769 |
| landUncertain | [377:4188](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4188) | 209:862 |
| landAck | [377:4217](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4217) | 209:891 |
| landNoId | [377:4246](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4246) | 209:920 |
| projectCreate | [377:4273](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4273) | 194:204 |
| pcDirty | [377:4341](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4341) | 198:416 |
| pcPending | [377:4410](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4410) | 198:365 |
| pcReject | [377:4479](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4479) | 198:465 |
| pcUnknown | [377:4548](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4548) | 198:514 |
| pcAck | [377:4617](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4617) | 198:563 |
| pcRead | [377:4677](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4677) | 193:651 |
| projectView | [377:4725](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4725) | 201:1079 |
| projectEdit | [377:4763](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4763) | 199:1376 |
| peDirty | [377:4809](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4809) | 201:384 |
| pePending | [377:4854](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4854) | 201:418 |
| peReject | [377:4902](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4902) | 201:457 |
| peUnknown | [377:4959](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-4959) | 201:504 |
| peAck | [377:5011](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-5011) | 201:546 |
| peRead | [377:5054](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-5054) | 201:606 |
| epicCreate | [377:5095](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-5095) | 224:3 |
| ecDirty | [377:5183](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-5183) | 225:1081 |
| ecPending | [377:5279](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-5279) | 225:982 |
| ecReject | [377:5373](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-5373) | 225:1183 |
| ecUnknown | [377:5467](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-5467) | 225:1282 |
| ecAck | [377:5563](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-5563) | 225:1384 |
| ecRead | [377:5657](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-5657) | 220:548 |
| epicEdit | [377:5716](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-5716) | 239:1797 |
| eeDirty | [377:5813](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-5813) | 233:777 |
| eePending | [377:5905](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-5905) | 233:835 |
| eeReject | [377:5995](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-5995) | 233:893 |
| eeUnknown | [377:6084](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6084) | 233:951 |
| eeAck | [377:6176](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6176) | 233:1009 |
| eeRead | [377:6267](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6267) | 238:1513 |
| permissionDenied | [377:6357](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6357) | 302:129 |
| permissionUnknown | [377:6371](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6371) | 302:205 |
| mobileEN | [377:6385](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6385) | 243:1909 |
| mobileCreate | [377:6466](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6466) | 249:808 |
| mobileDetails | [377:6517](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6517) | 257:737 |
| mobileARCreate | [377:6568](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6568) | 249:967 |
| mobileARUncertain | [377:6619](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6619) | 252:1961 |
| drawerEN | [377:6678](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6678) | 192:895 |
| drawerAR | [377:6755](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6755) | 192:941 |
| statsScope | [377:6832](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6832) | 295:443 |
| statsCalendarLoading | [377:6983](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-6983) | 295:443 |
| statsCalendarError | [377:7134](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-7134) | 295:443 |
| statsProjectsLoading | [377:7285](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-7285) | 295:443 |
| statsProjectsError | [377:7436](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=377-7436) | 295:443 |
| mtPending | [378:5605](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=378-5605) | 324:861 |
| mtUnknown | [378:5665](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=378-5665) | 324:1148 |
| mtAck | [378:5727](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=378-5727) | 324:1291 |
| mtReject | [378:5787](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=378-5787) | 324:1008 |
| msChoice | [378:5847](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=378-5847) | 324:2557, 324:2558, 324:2559, 324:2560 |
| msSelected | [378:5904](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=378-5904) | 324:2663, 324:2664, 324:2665, 324:2666 |
| msPending | [378:5961](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=378-5961) | 324:2772 |
| msUnknown | [378:6008](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=378-6008) | 324:2962, 324:2963 |
| msAck | [378:6057](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=378-6057) | 324:3058 |
| mobileARPending | [389:5587](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=389-5587) | 377:6568 |
