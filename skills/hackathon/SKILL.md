---
name: hackathon
description: Strict phase-by-phase playbook for short hackathons (a few hours) where the pitch, demo and look matter more than depth. Walks idea → market check (ICP, competitors, market size → go / pivot / kill) → MVP scope → business model (pricing, lean canvas, scalability) → brand (name, positioning, voice, logo) → UI → build → judge-ready GitHub README → pitch deck and/or demo video (recorded in Recordly) → rehearsal, scales to the event length (2 h to 48 h) and team size (solo to 5+ with parallel tracks and a safe git workflow: worktrees, PRs, an always-demoable main), names the exact installed skill for each phase, and tracks progress in HACKATHON.md so no step gets silently skipped. Use when the user mentions a hackathon, a demo day, a time-boxed build, "what should we build", "cut the scope", "market research", "pricing", "business model", "brand voice", "make the pitch", "README", "demo video", "merge", "PR", "branch", or asks which skill to use for startup/pitch/presentation work.
---

# Hackathon playbook

Short hackathon = judges see a ~3-minute pitch and/or a ~90-second demo video.
Optimise for **one working happy path + a story + a look that feels finished**,
and — when the judges score it — **a believable business: market, pricing,
how it scales**. Never build breadth.

## Execution contract — read first, non-negotiable

These rules override your own judgement about time, efficiency or "what matters
most". Agents under perceived time pressure tend to silently drop steps; these
rules exist to stop exactly that.

1. **Follow the phases in order and do every step of every phase.** For each
   phase, load the named skill and do what that skill says — fully, not a
   summary of it.
2. **You never decide to skip, merge, shorten or "fast-track" a phase or a step.**
   Not because of time, not because it seems obvious, not because the user
   seems to know already. Only the user can skip or reorder, and only by saying
   so explicitly ("skip the logo", "no video", "go straight to build").
3. **Running behind is not a reason to cut.** If a phase is over its timebox,
   say so in one line with the numbers ("phase 7 is 20 min over, 1 h 10 left")
   and **ask** which phase to cut or shorten. Wait for the answer. Until then,
   keep doing the current phase properly.
4. **Every phase ends with its output on disk** (the Output column below) and a
   ticked line in `HACKATHON.md`. A phase without its output is not done — do
   not start the next one.
5. **Do not invent constraints.** Never claim "there's no time", "this isn't
   needed for a hackathon" or "judges won't care" unless the user said it.
6. When unsure what the user wants, ask one short question — do not guess by
   dropping work.

### HACKATHON.md (create it in phase 0, update it after every phase)

```markdown
# Hackathon — <project name>
Start: <HH:MM>   End: <HH:MM>   Deliverables: deck ☐ video ☐ live demo ☐
Profile: <2h | 4.5h | 8h | 24h | 48h>   Team: <solo | 2 | 3–4 | 5+>   Confirmed by user: ☐
Roles: <name/handle → role>          (owner column below uses these)

- [ ] 0. Kickoff — rules, judging criteria, deliverables, profile, roles      @owner
- [ ] 1. Idea check — <one-sentence problem>
- [ ] 2. Market check — depth: full ☐ lite ☐ · verdict: go ☐ pivot ☐ kill ☐ (user's call)
- [ ] 3. MVP scope — <3–4 features, critical flow>
- [ ] 4. Business model — pricing, lean canvas, scalability
- [ ] 5. Brand — BRAND.md (name, positioning, voice) + logo + DESIGN.md
- [ ] 6. UI direction — DESIGN.md direction locked
- [ ] 7. Build — happy path works end to end
- [ ] 8. Polish + feature freeze
- [ ] 9. Repo README — badges, proof table, screenshots
- [ ] 10. Pitch story
- [ ] 11. Slides           (if deck)
- [ ] 12. Demo video       (if video)
- [ ] 13. Rehearsal
Skipped by user: <phase — user's words — time>
```

Every line ends with its owner (`@handle`, or `@all`). Only the user's explicit
words go under "Skipped by user". If that line is empty, every box must end up
ticked.

## Phases (timeboxes shown for the 4.5 h solo profile — see **Scale to your event**)

| # | Phase | Time | Use skill | Output (must exist before moving on) |
|---|---|---|---|---|
| 0 | Kickoff | 5 min (+10 git setup for teams) | — Ask: **event length and team size** → pick the profile and roles from **Scale to your event** and get the user's OK; **judging criteria** (product only? or also business model, market, scalability, viability?), pitch length, **deliverables: deck, demo video, live demo, or all** (default: deck + video), team roles, submission format/deadline | `HACKATHON.md` created, judging criteria written down |
| 1 | Idea check | 15 min | `founder-validate-idea`, then `last30days` on the problem (real complaints, quotes, numbers) | one-sentence problem + who has it + 1 real quote/number for the pitch |
| 2 | Market check | 15 min full / 5 min lite | see **Market check** below — ends with the user's **go / pivot / kill** decision | `MARKET.md` (ICP, competitors, market size, verdict) |
| 3 | MVP scope | 15 min | `founder-mvp-scope` (must / should / won't). Second opinion: `pm-prioritize-features`. Scope for the ICP and the gap found in phase 2 | `MVP.md`: 3–4 features max, one critical user flow, won't-have list |
| 4 | Business model | 15 min full / 5 min lite | see **Business model** below | pricing, business model and scalability added to `MARKET.md` |
| 5 | Brand | 20 min | see **Brand: verbal + visual** below | `BRAND.md` + logo SVG + `DESIGN.md` (2–3 colours, 1–2 fonts) |
| 6 | UI direction | 10 min, then during build | `frontend-design` (commit to one bold aesthetic, plan before code) + `design-taste-frontend` or `hallmark`; tokens/palettes/fonts: `ui-ux-pro-max`; references: `refero-design`. Then the branch for your product type below | direction + tokens written into `DESIGN.md` |
| 7 | Build | ~1 h 15 (full) / ~1 h 35 (lite) | normal coding, **only** the flow from `MVP.md`; seed realistic data; every UI string (headlines, buttons, empty and error states) in the `BRAND.md` voice — `copywriting` for landing/hero copy | happy path works end to end, `DEMO.md` with the exact click path |
| 8 | Polish + freeze | 15 min | `impeccable` (polish / critique / audit); motion: `emil-design-eng`, `animate` | no feature work after this point |
| 9 | Repo README | 15 min | see **Repo README for judges** below | `README.md` + `docs/` screenshots; repo description and topics drafted |
| 10 | Pitch story | 10 min | `founder-pitch-deck` (structure), `pm-value-proposition`; pull market, competition, pricing and scalability straight from `MARKET.md` | `PITCH.md`: story + speaker notes, ≤ 3 min spoken |
| 11 | Slides (if deck) | 20 min | `frontend-slides` (animated HTML deck in the browser; can export PDF). Need PowerPoint? use your agent's `pptx` skill if it has one | the deck file (+ PDF backup) |
| 12 | Demo video (if video) | 25 min | see **Demo video** below | `DEMO_VIDEO.md` storyboard + exported MP4 |
| 13 | Rehearsal | 15 min | `grill-me` to get grilled like a judge; run the pitch out loud with a timer 3× | answers to the likeliest questions — always including "how do you make money?", "how big is this?", "how does it scale?", "why you and not <competitor>?"; backup screenshots/video for a live-demo failure |

## Scale to your event

Pick the profile in phase 0 from the **event length and team size the user
gives you**, write it into `HACKATHON.md` and get the user's OK. The profile is
part of the plan, not a shortcut: you never switch to a smaller profile on your
own. For a length between profiles, take the nearer one and scale its times
proportionally.

### By event length (minutes per phase, solo)

| # | Phase | 2 h | 4.5 h | 8 h | 24 h | 48 h |
|---|---|---|---|---|---|---|
| 0 | Kickoff | 5 | 5 | 10 | 15 | 20 |
| 1 | Idea check | 10 | 15 | 25 | 90 ¹ | 180 ¹ |
| 2 | Market check | 5 ² | 15 / 5 | 25 | 40 | 60 |
| 3 | MVP scope | 10 | 15 | 20 | 30 | 45 |
| 4 | Business model | 5 ² | 15 / 5 | 20 | 35 | 60 |
| 5 | Brand | 10 ³ | 20 | 35 | 60 | 90 |
| 6 | UI direction | 5 | 10 | 20 | 30 | 60 |
| 7 | Build | 40 | 75 / 95 | 160 | 540 ⁴ | 1200 ⁴ |
| 8 | Polish + freeze | 5 | 15 | 30 | 60 | 120 |
| 9 | Repo README | 5 ⁵ | 15 | 25 | 45 | 60 |
| 10 | Pitch story | 5 | 10 | 20 | 30 | 45 |
| 11 | Slides | 10 ⁶ | 20 | 30 | 45 | 60 |
| 12 | Demo video | ⁶ | 25 | 30 | 45 | 60 |
| 13 | Rehearsal | 5 | 15 | 30 | 45 | 60 |
| — | Sleep + meals + buffer | — | — | — | 330 | 760 |

1. 24 h / 48 h: add real user validation — `founder-user-interviews` is the
   main skill (Mom Test script, screening, analysis of the answers); add
   `pm-interview-script` for extra Jobs-to-be-Done probing questions. Talk to 3–5 people (other teams, mentors, online
   communities), and record what they said in `IDEA.md`.
2. 2 h: market check and business model run **lite** regardless of criteria
   (ICP, 3 competitors, verdict; one pricing table) — that is this profile's
   definition, written in `HACKATHON.md`.
3. 2 h: name, one-line positioning, tagline, 3 voice traits, a wordmark logo.
4. 24 h / 48 h: build in blocks of ~3 h, each ending in a **checkpoint** — the
   happy path runs end to end, commit, tick a line in `HACKATHON.md`. Deploy to a
   public URL before the first sleep.
5. 2 h: README = first screen + proof table + quickstart + limits.
6. 2 h: deck **or** video — the one the judges require; both only if the user
   asks. Slides and video share the 10 min.

### By team size

Phases 0–3 are done **together** — everyone needs the same idea, market verdict
and MVP. After that the phases split into tracks that run **in parallel**. Every
track owns its phases end to end; nobody redoes another track's output.

| Team | Roles and the phases they own |
|---|---|
| **Solo** | You do every phase in order, as in the table above. |
| **2** | **Builder** (also the git setup in phase 0): 6, 7, 8, tech parts of 9 (quickstart, architecture, screenshots). **Story:** 5 (visual first, so the builder has `DESIGN.md` early), 4, prose of 9, 10, 11, 12. |
| **3–4** | **Builder ×1–2** (one of them does the git setup in phase 0; split the critical flow: front / back, or screen by screen): 7, 8. **Designer:** 5 visual, 6, UI polish in 8, screenshots, 12. **Business & pitch:** 4, 5 verbal, prose of 9, 10, 11. |
| **5+** | As 3–4, plus a **Captain** who owns `HACKATHON.md`, the clock, merges and the final submission, and a **Demo owner** who owns `DEMO.md`, 12 and the backup video. Never more than one person per surface (README, deck, video). |

**Sync points (everyone, ≤ 10 min each):**
- **S1 after phase 3** — everyone agrees on the market verdict, the critical flow and `MVP.md`.
- **S2 halfway through the build** — does the happy path run end to end? Business
  and brand findings that change the product land here, not later.
- **S3 feature freeze (phase 8)** — UI is final; screenshots and video start now.
- **S4 rehearsal (phase 13)** — the whole team, the real pitch, a timer.

With parallel tracks the build gets the time the other phases would have
taken: README prose, pitch and slides are written during the build, so the
freeze moves to just before video + rehearsal. In a team of 2+ at 4.5 h: build
1:10–3:35 (~2 h 15 after the S2 check), polish + freeze 3:35–3:50, demo video
3:50–4:15, rehearsal 4:15–4:30.

**Git for teams of 2+:** follow **Team git workflow** below from phase 0 on —
it is what keeps a late merge from breaking the demo.

**Several agents on one team:** each person's agent works only on the phases
its person owns, reads the other tracks' files (`MARKET.md`, `BRAND.md`,
`DESIGN.md`, `DEMO.md`) instead of regenerating them, and ticks only its own
lines in `HACKATHON.md`.

## Team git workflow (teams of 2+)

A broken `main` an hour before judging is the most common way teams lose a
working demo. These rules are part of the plan, not optional hygiene.

**Phase 0 setup (the Captain in 5+, otherwise a builder; ~10 min taken from the build):**
- One GitHub repo; everyone pushes branches, nobody commits to `main`.
- Branch protection on `main`: pull request required, 1 approval, status
  checks must pass, no force-push.
- A minimal CI (`.github/workflows/ci.yml`): install, build, typecheck/lint —
  whatever proves the app still starts. A red check blocks the merge.
- Each person's agent works in **its own git worktree** (`using-git-worktrees`)
  so two agents never edit the same checkout.
- One owner for dependencies: only they change `package.json` / lockfiles.

**While building:**
- Short-lived branches: one per task from `MVP.md`, merged within ~1 h.
  Small PRs; pull `main` into your branch before opening the PR.
- Before a PR: `verification-before-completion` — run the app and click the
  `DEMO.md` happy path; paste what you ran into the PR description.
- Review: `requesting-code-review` before merge (another person or their
  agent), `receiving-code-review` when you get feedback.
- Merge: `finishing-a-development-branch`; squash-merge only when CI is green and
  the reviewer clicked the demo path on the branch.
- After every merge to `main`: everyone pulls; the person who merged runs the
  demo path on `main` within 5 minutes.
- **`main` broke?** Revert the merge right away (`git revert -m 1 <merge>` via a
  PR), get `main` green, then fix on the branch. Never fix forward on `main`
  under time pressure, never force-push.
- Tag every known-good `main`: `demo-ok-<HHMM>`. The latest tag is your
  fallback for the live demo.

**From feature freeze (phase 8):**
- Only the Captain merges, only fixes, each one re-checked on the demo path.
- Tag `demo-final`; deploy, screenshot and record the video **from that tag**.

## Market check (phase 2) — before the MVP

There is no point scoping an MVP for a product the market will not carry. This
phase decides whether the idea goes on, and it gives the scope its target.

**Depth comes from the judging criteria recorded in phase 0 — never from your
own sense of time:**
- **Full** — the criteria mention business, market, scalability, viability,
  impact or investors, **or the criteria are unknown**.
- **Lite** (steps 1, 2 and 4 only, three competitors) — only when the user or
  the official rules say judging is product / tech only. Write the reason next
  to the checkbox in `HACKATHON.md`. The same depth applies to phase 4.

1. **Who pays — ICP and beachhead.** `pm-ideal-customer-profile`, then
   `pm-beachhead-segment`: the first narrow segment you could win, and why them.
2. **Competition.** `founder-competitor-matrix` (real, sourced competitors, a
   feature matrix, the gap you own). Add `last30days` on the top competitors to
   find what their users complain about — that is your positioning line.
3. **Market size.** `pm-market-sizing`: TAM / SAM / SOM, top-down **and**
   bottom-up (customers × a realistic price). Every number gets a source link or
   is labelled as an assumption with its arithmetic shown. Never invent a figure.
4. **Verdict — the user decides.** Present **go / pivot / kill** with the
   evidence: the phase 1 score, who pays, the gap against competitors, the
   market size. Recommend one, then **ask** and wait.
   - **Go** → phase 3, scoping for the ICP and the gap found here.
   - **Pivot** (new segment, angle or problem) or **kill** (new idea) → back to
     phase 1 once. The time comes out of the build: tell the user the new build
     time before they choose.
   You never pick the verdict yourself and never skip asking.

`MARKET.md` after phase 2: ICP & beachhead · Competitors (table + gap) · Market
size (TAM/SAM/SOM + sources) · Verdict (decision + why) · Sources.

## Business model (phase 4) — after the MVP

Pricing tiers need the feature set, and a growth loop needs to know how the
product works — so this comes after `MVP.md` exists. Same depth as phase 2
(lite: step 1 only, one pricing table).

1. **Pricing.** `founder-pricing-strategy` (3 tiers with real prices and limits
   built from the MVP's features, anchored to the competitor prices from phase 2,
   unit economics). Second opinion on the revenue model: `pm-monetization-strategy`.
2. **Business model.** `pm-lean-canvas` (one page: problem, segments, UVP,
   channels, revenue, costs, unfair advantage).
3. **Scalability.** `pm-growth-loops` (which loop makes it grow without linear
   effort) + `founder-go-to-market` (the first 100 users: named communities and
   channels). Add one line on how costs scale with users.

`MARKET.md` gains: Pricing (tiers + unit economics) · Business model (lean
canvas) · Scalability (growth loop + first 100 users + cost curve). The README
(phase 9), pitch (phase 10) and slides (phase 11) take their market,
competition, business-model and scale slides from this file.

## Brand: verbal + visual (phase 5)

A logo is not a brand. Judges remember a name, one line and a consistent voice
across the UI, README, pitch and video. Do every step:

1. **Name** — keep the user's name if they have one; otherwise
   `pm-product-name` (5 options, user picks). Check the name is not an obvious
   existing product in the same space (search it once).
2. **Positioning** — `pm-positioning-ideas`, using the competitor matrix from
   `MARKET.md`: one statement — *For <ICP> who <pain>, <name> is the <category>
   that <key benefit>, unlike <alternative>.*
3. **Tagline + key messages** — `pm-value-prop-statements`: a tagline (≤ 8
   words) and the 3 messages every surface repeats.
4. **Voice & tone** — `product-marketing` to write the product context, then
   fill the voice section of `BRAND.md`:
   - 3 traits as *we are X, not Y* (e.g. "confident, not arrogant");
   - words to use / words to avoid (ban generic AI filler: "seamless",
     "revolutionary", "unlock", "empower", "leverage");
   - sample lines in the voice: hero headline, primary button, empty state,
     error message, first sentence of the pitch;
   - tone shifts per surface: UI (short, plain), README (precise, proof-first),
     pitch (energetic, concrete), video captions (one idea per line).
5. **Visual** — `logo-design` (brief → concepts → SVG → mini guidelines), then
   colours and fonts into `DESIGN.md`. The logo brief uses the positioning and
   voice traits from steps 2–4.

`BRAND.md` sections: Name · Positioning · Tagline · Key messages · Voice
(traits, use/avoid, sample lines, tone per surface). Every later phase that
writes words — UI copy (7), README (9), pitch (10), slides (11), video
voiceover and captions (12) — follows it.

## Repo README for judges (phase 9)

Judges open the GitHub repo. The README has to sell the project in the first
screen **and** survive a judge clicking every claim. Persuasive, never inflated:
every "it does X" links to the code, test or screenshot that proves it.

### Rules
- **Proof over adjectives.** Each capability links to where it lives (file,
  test, screenshot, live URL). If it is mocked, seeded or on the roadmap, say so
  in a status column — judges forgive scope, not overclaiming.
- **First screen sells:** name, badges, one bold sentence of what it is, one
  sentence of proof ("working software, not a mock-up: N end-to-end checks …"),
  the live link, then the proof table.
- **Real screenshots only**, taken from the running app with the seeded data
  (`docs/landing.png`, `docs/app.png`, …) plus the demo video / GIF from phase 12
  when it exists (add it to the README then).
- **Badges** from shields.io: license, CI (only if a workflow exists and is
  green), stack (language/runtime/framework with `logo=`), protocols or APIs
  used, `Built at <hackathon name>`, `Live demo`. Check every badge renders —
  some brand logos are missing from simple-icons (e.g. `openai`).
- **Diagrams in Mermaid** (` ```mermaid ` blocks — GitHub renders them as real
  graphs): `flowchart LR` for architecture and how data/messages travel,
  `flowchart TD` for the core idea or a hierarchy, `sequenceDiagram` for one
  request end to end. Keep node labels short, quote labels with special
  characters (`A["label (x)"]`), use `<br/>` for a second line, and highlight
  the one node that matters with a `classDef`. Plain ASCII only for a short
  folder tree.
- **Team section:** ask the user which names or handles to list. Never add real
  names, e-mails or personal domains on your own.
- Write the repo description (one line) and 5–8 topics too. Creating the repo,
  pushing, or changing its visibility needs the user's explicit go-ahead.

### Structure (fill from `MVP.md`, `MARKET.md`, `DEMO.md`, `DESIGN.md`)

```markdown
# <name>

<badges row>

**<What it is in one bold line.>** <Who it is for and the outcome, one sentence.>
<Proof sentence: working software, N tests / checks, what is real.>

> **Live:** <url> · **Demo video:** <link> · **Pitch deck:** <link>

| Ready now | What is implemented | Proof |
|---|---|---|
| <capability> | <one line> | [file](path) · [test](path) · [screenshot](#screenshots) |

## Screenshots
## The problem          ← 3 bullets, with the real quote/number from phase 1
## What it does         ← bold-lead bullets + one Mermaid diagram of the core idea
## Why it matters       ← when business is judged: market size, ICP, pricing, scalability (short, from MARKET.md, sources linked)
## How it works         ← architecture: Mermaid flowchart + one line per folder
## Feature status       ← table: feature · how · status (working / partial / roadmap)
## Quickstart           ← copy-paste commands that start a seeded demo
## Demo data            ← table of seeded users/accounts so judges can click around
## Safety / privacy     ← risk → what the product does (only if relevant)
## Limits (hackathon scope)  ← honest list of what is mocked, in-memory, missing
## Prior art and how <name> differs  ← table from the competitor matrix
## Team
## License
```

## Demo video (phase 12) — recorded in Recordly

[Recordly](https://github.com/webadderallorg/Recordly) (free, macOS / Windows / Linux) records the screen and adds auto-zooms,
cursor polish, a styled background frame, an optional webcam bubble, trims,
speed regions and text annotations. Do every step:

### 12a. Storyboard first — write `DEMO_VIDEO.md` before anything is recorded

Target **60–90 seconds**. Every second must show the product doing something.
Use this structure and fill in the real screens/clicks from `DEMO.md`:

| Time | Beat | On screen | Voiceover / caption (one line) |
|---|---|---|---|
| 0:00–0:05 | Hook | the single most impressive result screen | the problem in one sentence, with the real number/quote from phase 1 |
| 0:05–0:15 | Who + pain | the "before" state or the user's starting point | who has the problem and what it costs them |
| 0:15–0:60 | The flow | the critical user flow from `MVP.md`, step by step, one click per beat | what the user gets at each step (benefit, not feature name) |
| 0:60–0:75 | The wow | the result / the moment the product delivers | the outcome in numbers if possible |
| 0:75–0:90 | Close | logo + product name + one-line value prop (+ URL / QR) | call to action or the "why now" |

Rules for the storyboard:
- One idea per beat; no beat without a visible change on screen.
- Show the result in the first 5 seconds — judges decide early.
- Never show: login screens, loading spinners, empty states, settings, code,
  terminal, errors. Pre-log-in and pre-load everything.
- Captions in the video must make sense with the sound off.

### 12b. Prepare the screen (checklist — tick each)

- Seeded, realistic data (no lorem, no zeros, no "test123").
- Clean browser profile or window: no bookmarks bar, no extensions, no other tabs; 1920×1080 window; zoom 110–125 % so text reads in the video.
- Do Not Disturb on; desktop icons hidden; notifications off.
- Dark/light mode matches `DESIGN.md`.
- Mobile app: record the real device or simulator mirror at device size; enable the device frame in Recordly if available.
- Run the full click path from `DEMO.md` once without recording.

### 12c. Record and edit in Recordly

1. Record the whole flow in one take following `DEMO_VIDEO.md`; move the cursor slowly and deliberately, pause ~1 s after each click.
2. Turn on **auto zoom suggestions**, then keep only zooms that land on the thing the voiceover talks about; add manual zoom regions where a detail matters.
3. Cursor: smoothing on, click bounce on, size slightly larger than default.
4. Styled frame: background colour/gradient from `DESIGN.md`, padding + shadow.
5. **Trim** dead time; add **speed-up regions** over any waiting.
6. Text annotations = the captions from the storyboard.
7. Webcam bubble only if the presenter talks to camera in the video.
8. Voiceover: record separately or live; read the storyboard lines.
9. Export **MP4 1080p** for submission; optional short GIF for the README/socials. Save the `.recordly` project so edits stay possible.
10. Watch the export once start to finish with sound off, then once with sound on; fix anything that does not match the storyboard.

## UI by product type

Pick the branch that matches what you are building, on top of phase 6:

- **Web / landing page:** `frontend-design` → `design-taste-frontend` or `hallmark` → `founder-landing-page` (copy, section by section) → `impeccable`.
- **Dashboard / admin / data app:** `shadcn` (components + blocks, charts via shadcn charts) + `ui-ux-pro-max` (dashboard palettes, density, chart types) + `frontend-design` for a non-default look. Rules: one hero metric per view, max 4–6 KPI tiles, real-looking seeded data (never lorem / 0s), one accent colour for "the number that matters", consistent chart colours across the page. Finish with `impeccable`.
- **Mobile app (Expo / React Native):** `expo-overview` → `expo-router` (navigation) → `expo-design-system` + `expo-native-ui` / `expo-ui` (native look, not a shrunk website) → `expo-animation` for motion and haptics; `vercel-react-native-skills` for performance/best practice; `apple-design` for iOS-quality feel. Demo it on a real phone via Expo Go.
- **Mobile web / PWA (a web app demoed on a phone):** web branch + `mobile-native` (100vh bug, notch, tap highlight, input zoom) + `apple-design`.
- **Native iOS (SwiftUI):** `apple-design`, `mobile-native`; `impeccable` has native audit references.

## Rules of thumb

- One voice everywhere: if a sentence would not fit `BRAND.md`, rewrite it.
- Cut scope before writing code. If a feature is not in `DEMO.md`, it does not exist.
- Hardcode / seed data freely; judges do not see the backend.
- The pitch follows: problem (with a real quote or number) → who → demo → market & business (when judged) → why now → ask.
- Feature freeze at phase 8; everything after is README, deck, video and rehearsal.
- The live demo always has a backup: the exported video or screenshots.

## Optional boosters — use when installed

If one of these exists in your skill list, the phase **must** use it in addition
to the skills above; if it does not exist, carry on without it (that is not a
skip). `infographic` is installed by this playbook; the rest you add yourself.

| Phase | Skill | Adds | Get it |
|---|---|---|---|
| 1 Idea check, 2 Market check | `research` | deep, cited research in parallel with `last30days` (market size, competitors) | any deep-research skill you use |
| 1 / 3 | `brainstorm` | non-generic idea and feature variants (diverge → critique → converge) | [Dymyt-ry/claude-code-toolbelt](https://github.com/Dymyt-ry/claude-code-toolbelt#brainstorm) |
| 7 Build (dashboard) | `dataviz` | chart colour, mark and KPI-tile rules | built into Claude apps |
| 7 Build (landing) | `landing-page-design` | hero / above-the-fold / CTA layout rules | [inferen-sh/skills](https://github.com/inferen-sh/skills) |
| 11 Slides | `pitch-deck-visuals` | slide-by-slide layout and data-slide rules | [inferen-sh/skills](https://github.com/inferen-sh/skills) |
| 11 Slides | `infographic` | one strong data / process slide | installed — [claude-office-skills/skills](https://github.com/claude-office-skills/skills) |

## Other useful skills

- Research: `last30days` (Reddit, X, YouTube, HN, GitHub, Polymarket; TikTok / Instagram with a ScrapeCreators key).
- More market framing: `pm-startup-canvas`, `pm-business-model` (full Business Model Canvas).
- Ideas when stuck: `pm-brainstorm-ideas-new`, `pm-brainstorm-experiments-new`.
- Social launch post: `social-content`.
