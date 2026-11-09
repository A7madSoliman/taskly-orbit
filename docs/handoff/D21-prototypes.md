# D21 — Interactive Prototypes / B01 Core Journeys

D21 status: TODO, retained by explicit owner instruction until full prototype coverage and owner review. B01 status: REVIEW — bounded pointer-navigation QA PASS, pending owner batch acceptance. D21-B01-v1, 2026-11-09. No D22 work is started.

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
