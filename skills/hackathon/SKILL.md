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
7. **When a phase points to a file in `references/`** (next to this
   `SKILL.md`), read the whole file at the start of that phase and do every
   step in it. The steps live there to keep this file short, not because they
   are optional.

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

## Phases (timeboxes shown for the 4.5 h solo profile — other lengths and team sizes: `references/scale.md`)

| # | Phase | Time | Use skill | Output (must exist before moving on) |
|---|---|---|---|---|
| 0 | Kickoff | 5 min (+10 git setup for teams) | — Ask: **event length and team size** → pick the profile and roles from `references/scale.md` and get the user's OK (teams of 2+: also set up `references/team-git.md`); **judging criteria** (product only? or also business model, market, scalability, viability?), pitch length, **deliverables: deck, demo video, live demo, or all** (default: deck + video), team roles, submission format/deadline | `HACKATHON.md` created, judging criteria written down |
| 1 | Idea check | 15 min | `founder-validate-idea`, then `last30days` on the problem (real complaints, quotes, numbers) | one-sentence problem + who has it + 1 real quote/number for the pitch |
| 2 | Market check | 15 min full / 5 min lite | `references/market-check.md` — ends with the user's **go / pivot / kill** decision | `MARKET.md` (ICP, competitors, market size, verdict) |
| 3 | MVP scope | 15 min | `founder-mvp-scope` (must / should / won't). Scope for the ICP and the gap found in phase 2 | `MVP.md`: 3–4 features max, one critical user flow, won't-have list |
| 4 | Business model | 15 min full / 5 min lite | `references/business-model.md` | pricing, business model and scalability added to `MARKET.md` |
| 5 | Brand | 20 min | `references/brand.md` (verbal + visual) | `BRAND.md` + logo SVG + `DESIGN.md` (2–3 colours, 1–2 fonts) |
| 6 | UI direction | 10 min, then during build | `impeccable` owns the direction: shape the UX/UI before code and commit to one bold, non-generic direction; typeset and colorize for fonts and palette. `ui-ux-pro-max` as a lookup only (`--domain` color, typography, google-fonts, chart or ux) for palette and font-pairing candidates — never its `--design-system --persist` (`DESIGN.md` stays the one source of truth). Then the branch for your product type in `references/ui-by-product-type.md` | direction + tokens written into `DESIGN.md` |
| 7 | Build | ~1 h 15 (full) / ~1 h 35 (lite) | normal coding, **only** the flow from `MVP.md`; seed realistic data; every UI string (headlines, buttons, empty and error states) in the `BRAND.md` voice — `copywriting` for landing/hero copy | happy path works end to end, `DEMO.md` with the exact click path |
| 8 | Polish + freeze | 15 min | `impeccable` (polish / critique / audit). Motion: `impeccable`'s animate command picks where motion goes and builds the one focal moment; `animate` builds the routine UI motion (button press, dropdown, modal, drawer, toast) from its tables. Expo apps: `expo-animation` | no feature work after this point |
| 9 | Repo README | 15 min | `references/readme.md` | `README.md` + `docs/` screenshots; repo description and topics drafted |
| 10 | Pitch story | 10 min | `founder-pitch-deck` (structure); tagline and key messages from `BRAND.md`; pull market, competition, pricing and scalability straight from `MARKET.md` | `PITCH.md`: story + speaker notes, ≤ 3 min spoken |
| 11 | Slides (if deck) | 20 min | `frontend-slides` (animated HTML deck in the browser; can export PDF). Need PowerPoint? use your agent's `pptx` skill if it has one | the deck file (+ PDF backup) |
| 12 | Demo video (if video) | 25 min | `references/demo-video.md` (storyboard, then Recordly) | `DEMO_VIDEO.md` storyboard + exported MP4 |
| 13 | Rehearsal | 15 min | `grill-me` to get grilled like a judge; run the pitch out loud with a timer 3× | answers to the likeliest questions — always including "how do you make money?", "how big is this?", "how does it scale?", "why you and not <competitor>?"; backup screenshots/video for a live-demo failure |

## Rules of thumb

- One owner per decision: when two skills serve the same phase, the playbook says which one owns the decision and what the other adds. On a conflict the owner wins — never mix their rules or keep two sources of truth (one `DESIGN.md`, one `BRAND.md`).
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
| 1 Idea check, 2 Market check | `research` | deep, cited research — use it **instead of** a plain `last30days` run, since it runs `last30days` itself | any deep-research skill you use |
| 1 / 3 | `brainstorm` | non-generic idea and feature variants (diverge → critique → converge) | [Dymyt-ry/claude-code-toolbelt](https://github.com/Dymyt-ry/claude-code-toolbelt#brainstorm) |
| 7 Build (dashboard) | `dataviz` | chart colour, mark and KPI-tile rules | built into Claude apps |
| 7 Build (landing) | `landing-page-design` | hero / above-the-fold / CTA layout rules | [inferen-sh/skills](https://github.com/inferen-sh/skills) |
| 11 Slides | `pitch-deck-visuals` | slide-by-slide layout and data-slide rules | [inferen-sh/skills](https://github.com/inferen-sh/skills) |
| 11 Slides | `infographic` | one strong data / process slide | installed — [claude-office-skills/skills](https://github.com/claude-office-skills/skills) |

## Other useful skills

- Research: `last30days` (Reddit, X, YouTube, HN, GitHub, Polymarket; TikTok / Instagram with a ScrapeCreators key).
- Ideas when stuck: `brainstorm` if installed, otherwise `pm-brainstorm-ideas-new`.
- Social launch post: `social-content`.
