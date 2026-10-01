---
name: hackathon
description: Strict phase-by-phase playbook for short hackathons (a few hours) where the pitch, demo and look matter more than depth. Walks idea → MVP scope → brand → UI → build → pitch deck and/or demo video (recorded in Recordly) → rehearsal, naming the exact installed skill for each phase, and tracks progress in HACKATHON.md so no step gets silently skipped. Use when the user mentions a hackathon, a demo day, a time-boxed build, "what should we build", "cut the scope", "make the pitch", "demo video", or asks which skill to use for startup/pitch/presentation work.
---

# Hackathon playbook

Short hackathon = judges see a ~3-minute pitch and/or a ~90-second demo video.
Optimise for **one working happy path + a story + a look that feels finished**.
Never build breadth.

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
   say so in one line with the numbers ("phase 4 is 20 min over, 1 h 10 left")
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

- [ ] 0. Kickoff — rules, deliverables, team roles
- [ ] 1. Idea check — <one-sentence problem>
- [ ] 2. MVP scope — <3–4 features, critical flow>
- [ ] 3. Brand — logo + DESIGN.md
- [ ] 4. UI direction — DESIGN.md direction locked
- [ ] 5. Build — happy path works end to end
- [ ] 6. Polish + feature freeze
- [ ] 7. Pitch story
- [ ] 8. Slides            (if deck)
- [ ] 9. Demo video        (if video)
- [ ] 10. Rehearsal
Skipped by user: <phase — user's words — time>
```

Only the user's explicit words go under "Skipped by user". If that line is
empty, every box must end up ticked.

## Phases (timeboxes for ~4.5 h — scale proportionally)

| # | Phase | Time | Use skill | Output (must exist before moving on) |
|---|---|---|---|---|
| 0 | Kickoff | 5 min | — Ask: judging criteria, pitch length, **deliverables: deck, demo video, live demo, or all** (default: deck + video), team roles, submission format/deadline | `HACKATHON.md` created |
| 1 | Idea check | 15 min | `founder-validate-idea`, then `last30days` on the problem (real complaints, quotes, numbers) | one-sentence problem + who has it + 1 real quote/number for the pitch |
| 2 | MVP scope | 15 min | `founder-mvp-scope` (must / should / won't). Second opinion: `pm-prioritize-features` | `MVP.md`: 3–4 features max, one critical user flow, won't-have list |
| 3 | Brand | 15 min | `logo-design` (brief → concepts → SVG → mini brand guidelines) | logo SVG + `DESIGN.md` (2–3 colours, 1–2 fonts) |
| 4 | UI direction | 10 min, then during build | `frontend-design` (commit to one bold aesthetic, plan before code) + `design-taste-frontend` or `hallmark`; tokens/palettes/fonts: `ui-ux-pro-max`; references: `refero-design`. Then the branch for your product type below | direction + tokens written into `DESIGN.md` |
| 5 | Build | ~2 h | normal coding, **only** the flow from `MVP.md`; seed realistic data | happy path works end to end, `DEMO.md` with the exact click path |
| 6 | Polish + freeze | 15 min | `impeccable` (polish / critique / audit); motion: `emil-design-eng`, `animate` | no feature work after this point |
| 7 | Pitch story | 15 min | `founder-pitch-deck` (structure), `pm-value-proposition`, `founder-competitor-matrix` | `PITCH.md`: story + speaker notes, ≤ 3 min spoken |
| 8 | Slides (if deck) | 20 min | `frontend-slides` (animated HTML deck in the browser; can export PDF). Need PowerPoint? use your agent's `pptx` skill if it has one | the deck file (+ PDF backup) |
| 9 | Demo video (if video) | 25 min | see **Demo video** below | `DEMO_VIDEO.md` storyboard + exported MP4 |
| 10 | Rehearsal | 15 min | `grill-me` to get grilled like a judge; run the pitch out loud with a timer 3× | answers to the 5 likeliest questions; backup screenshots/video for a live-demo failure |

## Demo video (phase 9) — recorded in Recordly

[Recordly](https://github.com/webadderallorg/Recordly) (free, macOS / Windows / Linux) records the screen and adds auto-zooms,
cursor polish, a styled background frame, an optional webcam bubble, trims,
speed regions and text annotations. Do every step:

### 9a. Storyboard first — write `DEMO_VIDEO.md` before anything is recorded

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

### 9b. Prepare the screen (checklist — tick each)

- Seeded, realistic data (no lorem, no zeros, no "test123").
- Clean browser profile or window: no bookmarks bar, no extensions, no other tabs; 1920×1080 window; zoom 110–125 % so text reads in the video.
- Do Not Disturb on; desktop icons hidden; notifications off.
- Dark/light mode matches `DESIGN.md`.
- Mobile app: record the real device or simulator mirror at device size; enable the device frame in Recordly if available.
- Run the full click path from `DEMO.md` once without recording.

### 9c. Record and edit in Recordly

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

Pick the branch that matches what you are building, on top of phase 4:

- **Web / landing page:** `frontend-design` → `design-taste-frontend` or `hallmark` → `founder-landing-page` (copy, section by section) → `impeccable`.
- **Dashboard / admin / data app:** `shadcn` (components + blocks, charts via shadcn charts) + `ui-ux-pro-max` (dashboard palettes, density, chart types) + `frontend-design` for a non-default look. Rules: one hero metric per view, max 4–6 KPI tiles, real-looking seeded data (never lorem / 0s), one accent colour for "the number that matters", consistent chart colours across the page. Finish with `impeccable`.
- **Mobile app (Expo / React Native):** `expo-overview` → `expo-router` (navigation) → `expo-design-system` + `expo-native-ui` / `expo-ui` (native look, not a shrunk website) → `expo-animation` for motion and haptics; `vercel-react-native-skills` for performance/best practice; `apple-design` for iOS-quality feel. Demo it on a real phone via Expo Go.
- **Mobile web / PWA (a web app demoed on a phone):** web branch + `mobile-native` (100vh bug, notch, tap highlight, input zoom) + `apple-design`.
- **Native iOS (SwiftUI):** `apple-design`, `mobile-native`; `impeccable` has native audit references.

## Rules of thumb

- Cut scope before writing code. If a feature is not in `DEMO.md`, it does not exist.
- Hardcode / seed data freely; judges do not see the backend.
- The pitch follows: problem (with a real quote or number) → who → demo → why now → ask.
- Feature freeze at phase 6; everything after is deck, video and rehearsal.
- The live demo always has a backup: the exported video or screenshots.

## Optional boosters — use when installed

Not installed by this playbook. If one of these exists in your skill list, the
phase **must** use it in addition to the skills above; if it does not exist,
carry on without it (that is not a skip).

| Phase | Skill | Adds |
|---|---|---|
| 1 Idea check | `research` | deep, cited research in parallel with `last30days` |
| 1 / 2 | `brainstorm` | non-generic idea and feature variants |
| 5 Build (dashboard) | `dataviz` | chart colour, mark and KPI-tile rules |
| 5 Build (landing) | `landing-page-design` | hero / above-the-fold / CTA layout rules |
| 8 Slides | `pitch-deck-visuals` | slide-by-slide layout and data-slide rules |
| 8 Slides | `infographic` | one strong data / process slide |

## Other useful skills

- Research: `last30days` (Reddit, X, YouTube, HN, GitHub, Polymarket; TikTok / Instagram with a ScrapeCreators key).
- Market framing: `pm-lean-canvas`, `pm-startup-canvas`, `pm-ideal-customer-profile`, `pm-beachhead-segment`, `founder-go-to-market`, `founder-pricing-strategy`.
- Ideas when stuck: `pm-brainstorm-ideas-new`, `pm-brainstorm-experiments-new`.
- Social launch post: `social-content`.
