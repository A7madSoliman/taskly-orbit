# D15 — Members and Invitations

Status: TODO. B01 Members Collection: REVIEW (design QA PASS; owner review pending). B02 Invite Member is outside this batch.

## B01 — Members Collection

Figma source of truth: [D15 B01 page 203:99](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=203-99). Editable main compositions: desktop EN Light [203:100](https://www.figma.com/design/o5x1eCbKM7xPx7SKB0hsI9?node-id=203-100), AR Light 203:145, EN Dark 203:190, AR Dark 203:235; mobile EN Light 203:280, AR Light 203:322, EN Dark 203:364, AR Dark 203:406. Responsive specimens: 320 AR Dark 203:547, 360 AR Dark 203:567, 390 AR Dark 203:587, tablet 768 EN Light 203:607. State specimens: loading 203:464, qualified zero 203:484, failure/retry 203:504, unknown invite eligibility with readable roster 203:527, established restriction 204:280, and compact Arabic failure 204:413.

## Contract and decisions

OR-S09 maps to D02 OP-11 and D06 OR-S09/J-08: the roster is scoped to resolved project context. Loading, populated result, missing name/role fallbacks, conditional zero, failure and explicit read retry remain distinct. A mapped empty result is provisional under G-15; failure does not imply empty membership or a particular access cause. Membership-record identity and user identity remain distinct. A successful roster read or displayed role does not establish invitation permission. The visible Invite Member button illustrates an eligible condition only; unknown or established restricted eligibility has its own specimen and does not infer a role policy. No member management action, pagination or extra API field is specified. Invitation form and submission are deferred to B02.

## Reuse and QA

The eight compositions use D11 linked Member Row, navigation, buttons and Orbit Atelier lockup; roster states use the linked Collection Read State family. D10 native Light/Dark modes and variable bindings are retained; English uses Inter and Arabic uses Cairo with the Latin brand preserved in Inter. The source D11 and D14 nodes were not edited. All eight renders and tablet/320/360/390 specimens were inspected; compact Arabic long names/roles and failure feedback wrap and grow. The compact drawer trigger was corrected after inspection, and desktop Members navigation is active. Native checks found no missing instance masters and no text extending beyond its immediate parent in the checked main and responsive specimens. These are static design checks, not proof of runtime responsiveness, keyboard operation, screen-reader behavior, accessibility certification or actual access rights. Essential information does not depend on animation; reduced motion should suppress nonessential transitions.

Existing DEC/G/F holds remain open, including G-04/G-05 invitation rights and G-15 zero-member reachability. D15 remains TODO pending later batches and owner acceptance.
