# Scale to your event (phase 0)

Pick the profile in phase 0 from the **event length and team size the user
gives you**, write it into `HACKATHON.md` and get the user's OK. The profile is
part of the plan, not a shortcut: you never switch to a smaller profile on your
own. For a length between profiles, take the nearer one and scale its times
proportionally.

## By event length (minutes per phase, solo)

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

1. 24 h / 48 h: add real user validation — `founder-user-interviews` (Mom Test
   script, screening, analysis of the answers). Talk to 3–5 people (other teams, mentors, online
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

## By team size

Phases 0–3 are done **together** — everyone needs the same idea, market verdict
and MVP. After that the phases split into tracks that run **in parallel**. Every
track owns its phases end to end; nobody redoes another track's output.

| Team | Roles and the phases they own |
|---|---|
| **Solo** | You do every phase in order, as in the phase table in `SKILL.md`. |
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

**Git for teams of 2+:** read `references/team-git.md` in phase 0 and follow it
from then on — it is what keeps a late merge from breaking the demo.

**Several agents on one team:** each person's agent works only on the phases
its person owns, reads the other tracks' files (`MARKET.md`, `BRAND.md`,
`DESIGN.md`, `DEMO.md`) instead of regenerating them, and ticks only its own
lines in `HACKATHON.md`.
