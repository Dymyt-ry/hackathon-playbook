<div align="center">

# 🏁 hackathon-playbook

**A strict, phase-by-phase hackathon playbook for AI coding agents —<br>from idea to pitch deck and demo video, without the agent skipping steps.**

[![CI](https://github.com/Dymyt-ry/hackathon-playbook/actions/workflows/ci.yml/badge.svg)](https://github.com/Dymyt-ry/hackathon-playbook/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-22c55e.svg)](LICENSE)
[![Agent Skills](https://img.shields.io/badge/Agent_Skills-SKILL.md-8b5cf6.svg)](https://agentskills.io)
[![Skills](https://img.shields.io/badge/skills_routed-52-0ea5e9.svg)](THIRD_PARTY.md)
[![PRs welcome](https://img.shields.io/badge/PRs-welcome-f97316.svg)](#contributing)

[![Claude Code](https://img.shields.io/badge/Claude_Code-supported-D97757?logo=anthropic&logoColor=white)](https://claude.com/claude-code)
[![Cursor](https://img.shields.io/badge/Cursor-supported-000000?logo=cursor&logoColor=white)](https://cursor.com)
[![Codex](https://img.shields.io/badge/Codex-supported-412991)](https://github.com/openai/codex)

</div>

---

In a 4–5 hour hackathon the judges see a three-minute pitch and a ninety-second
demo. They never see your backend. What wins is **one working happy path, a
clear story and a product that looks finished**.

AI agents are great at the building part and bad at the rest: they over-build,
they produce UI that looks generated, and under time pressure they quietly drop
steps ("no time for the logo, skipping the rehearsal"). This playbook fixes all
three.

## ✨ What you get

- **One skill that runs the whole day.** Say *"hackathon"* and the agent walks
  thirteen phases in order, loading the right specialist skill for each one.
- **An execution contract.** The agent may not skip, merge or shorten a phase
  on its own. If it falls behind it tells you the numbers and **asks** what to
  cut. Progress is tracked in `HACKATHON.md`, so a skipped step is visible.
- **Design that doesn't look AI-made.** Anti-"AI slop" design skills for web,
  dashboards and mobile, wired into the build phase.
- **A business, not just a demo.** When judges score market, business model or
  scalability, a dedicated phase sizes the market (TAM/SAM/SOM with sources),
  maps real competitors, prices three tiers and shows how it scales.
- **A brand, not just a logo.** Name, positioning, tagline and a written voice
  (`BRAND.md`) that the UI copy, README, pitch and video all follow.
- **A README that sells to judges.** Badges, a "Ready now / Proof" table where
  every claim links to code or a screenshot, honest limits — the format judges
  can verify in two minutes.
- **Pitch deck *and* demo video.** An HTML deck, plus a storyboarded 60–90 s
  demo video recorded and edited in [Recordly](https://github.com/webadderallorg/Recordly).
- **52 best-in-class skills, one command.** Pulled straight from their authors
  (Anthropic, Expo, shadcn, Vercel, Emil Kowalski, Paul Bakaus, …) and linked into
  Claude Code, Cursor and Codex.

## 🗺️ The day, phase by phase

| # | Phase | Time* | Skills the agent loads | Output |
|:-:|---|:-:|---|---|
| 0 | Kickoff | 5 min | — | `HACKATHON.md`: rules, judging criteria, deliverables, roles |
| 1 | Idea check | 15 min | `founder-validate-idea`, `last30days` | problem + who + a real quote/number |
| 2 | MVP scope | 15 min | `founder-mvp-scope`, `pm-prioritize-features` | `MVP.md`: 3–4 features, one flow |
| 3 | Market & business | 30 / 10 min | `pm-ideal-customer-profile`, `pm-beachhead-segment`, `founder-competitor-matrix`, `pm-market-sizing`, `founder-pricing-strategy`, `pm-monetization-strategy`, `pm-lean-canvas`, `pm-growth-loops`, `founder-go-to-market` | `MARKET.md`: ICP, competitors, TAM/SAM/SOM, pricing, business model, scalability |
| 4 | Brand | 20 min | `pm-product-name`, `pm-positioning-ideas`, `pm-value-prop-statements`, `product-marketing`, `logo-design` | `BRAND.md` (name, positioning, tagline, voice) + logo + `DESIGN.md` |
| 5 | UI direction | 10 min | `frontend-design`, `design-taste-frontend` / `hallmark`, `ui-ux-pro-max`, `refero-design` | design direction locked |
| 6 | Build | ~1.25–1.6 h | + branch for web / dashboard / mobile (below) | happy path + `DEMO.md` |
| 7 | Polish + freeze | 15 min | `impeccable`, `emil-design-eng`, `animate` | no more features |
| 8 | Repo README | 15 min | badges, proof table, screenshots | judge-ready `README.md` |
| 9 | Pitch story | 10 min | `founder-pitch-deck`, `pm-value-proposition` + `MARKET.md` | `PITCH.md` |
| 10 | Slides | 20 min | `frontend-slides` | the deck |
| 11 | Demo video | 25 min | Recordly + storyboard | `DEMO_VIDEO.md` + MP4 |
| 12 | Rehearsal | 15 min | `grill-me` | answers to "how do you make money / how big / how does it scale" and more |

<sub>*for a ~4.5 h event; the agent scales the timeboxes to yours. Phase 3 runs **full** when judges score business, market or scalability (or the criteria are unknown) and **lite** when judging is product-only — decided by the rules, never by the agent.</sub>

### UI branches

| Building a… | Skill chain |
|---|---|
| 🌐 **Web app / landing page** | `frontend-design` → `design-taste-frontend` or `hallmark` → `founder-landing-page` → `impeccable` |
| 📊 **Dashboard** | `shadcn` + `ui-ux-pro-max` + `frontend-design` → `impeccable` — one hero metric, 4–6 KPI tiles, realistic seeded data |
| 📱 **Expo / React Native app** | `expo-overview` → `expo-router` → `expo-design-system` + `expo-native-ui` / `expo-ui` → `expo-animation`, `vercel-react-native-skills`, `apple-design` |
| 📲 **Mobile web / PWA** | web chain + `mobile-native` + `apple-design` |

## 📏 Scales to your event

Phase 0 asks for the event length and team size and picks a profile (you confirm it):

| | 2 h | 4.5 h | 8 h | 24 h | 48 h |
|---|:-:|:-:|:-:|:-:|:-:|
| Build time (solo) | 45 min | 1 h 15 | 2 h 40 | 9 h in 3 h blocks | 20 h in 3 h blocks |
| Market & business | lite | full or lite* | full | full | full |
| User interviews | — | — | — | 3–5 people | 3–5 people |
| Deck + video | one of them | both | both | both | both |
| Sleep, meals, buffer | — | — | — | 5.5 h | 12.5 h |

<sub>*full when judges score business, market or scalability, or the criteria are unknown.</sub>

| Team | Tracks |
|---|---|
| Solo | every phase in order |
| 2 | **Builder** (UI, build, polish) · **Story** (brand, market, README prose, pitch, slides, video) |
| 3–4 | **Builder ×1–2** · **Designer** (brand visual, UI, polish, screenshots, video) · **Business & pitch** |
| 5+ | the above + **Captain** (clock, `HACKATHON.md`, merges, submission) + **Demo owner** |

Tracks run in parallel after the MVP scope with four sync points (after scope,
mid-build, feature freeze, rehearsal), so a team of two at 4.5 h gets ~2.5 h of
build instead of 1 h 15. Each teammate's agent works only its own phases and reads
the others' files instead of regenerating them.

## 🎬 Demo video

Phase 11 writes a storyboard before anything is recorded, then walks you through
Recordly:

| Time | Beat | Show |
|---|---|---|
| 0:00–0:05 | Hook | the most impressive result + the problem in one line |
| 0:05–0:15 | Who + pain | the starting point |
| 0:15–0:60 | The flow | the critical path, one click per beat |
| 0:60–0:75 | The wow | the outcome, in numbers if possible |
| 0:75–0:90 | Close | logo, one-line value prop, URL / QR |

Never on screen: logins, spinners, empty states, code, errors. Then: a clean
1080p browser at 110–125 % zoom, auto-zooms kept only where the voiceover
points, smoothed cursor with click bounce, a branded frame, trimmed dead time,
captions that work with the sound off, MP4 export.

## 🚀 Install

```bash
git clone https://github.com/Dymyt-ry/hackathon-playbook.git
cd hackathon-playbook
./install.sh
```

Restart your agent and say **"hackathon"** (or `/hackathon`).

| Option | |
|---|---|
| `--agents claude,cursor` | choose where to link: `claude` (`~/.claude/skills`, also read by Cursor), `agents` (`~/.agents/skills`: Codex, Cursor and other Agent Skills tools), `codex`, `cursor` |
| `--dry-run` | print the plan, change nothing |
| `--uninstall` | remove everything this installer created |

**Requirements:** `git` and `bash` (macOS or Linux). Skills are stored in
`~/.local/share/hackathon-playbook/skills` and symlinked into each agent's
folder. Existing skill folders with the same name are never overwritten.

## 🔒 Safety

The installer **never executes third-party code**: it sparse-clones each source
repository, copies the skill folder and rewrites a few lines of text (names and
one path). [`THIRD_PARTY.md`](THIRD_PARTY.md) lists every source, its license,
exactly what is rewritten, and the few skills that download or install things
when *you* use them. Read it once before installing — that is good hygiene for
any skill.

## 🙏 Credits

This playbook is glue; the craft lives in the skills it routes to. Huge thanks to
[Anthropic](https://github.com/anthropics/skills),
[Paul Bakaus](https://github.com/pbakaus/impeccable),
[Emil Kowalski](https://github.com/emilkowalski/skills),
[Expo](https://github.com/expo/skills),
[shadcn](https://github.com/shadcn-ui/ui),
[Vercel](https://github.com/vercel-labs/agent-skills),
[Leon Lin](https://github.com/Leonxlnx/taste-skill),
[Hassan El Mghari](https://github.com/Nutlope/hallmark),
[Next Level Builder](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill),
[Refero](https://github.com/referodesign/refero_skill),
[Emotix](https://github.com/emotixco/claude-skills-founder),
[Pawel Huryn](https://github.com/phuryn/pm-skills),
[Matt Van Horn](https://github.com/mvanhorn/last30days-skill),
[Kaan Kızıltuğ](https://github.com/kaankiziltug/logo-design-skill),
[Zara Zhang](https://github.com/zarazhangrui/frontend-slides),
[Matt Pocock](https://github.com/mattpocock/skills),
[Corey Haines](https://github.com/coreyhaines31/marketingskills),
[Claude Office Skills](https://github.com/claude-office-skills/skills) and the
[Recordly](https://github.com/webadderallorg/Recordly) team.

## Contributing

Issues and PRs welcome — especially new UI branches, better timeboxes for other
event lengths, and upstream path changes (CI re-installs everything weekly to
catch those). Run `./scripts/check.sh` before opening a PR.

## License

[MIT](LICENSE) for this repository. Third-party skills keep their own licenses —
see [THIRD_PARTY.md](THIRD_PARTY.md).
