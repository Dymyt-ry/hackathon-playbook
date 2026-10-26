# Repo README for judges (phase 9)

Judges open the GitHub repo. The README has to sell the project in the first
screen **and** survive a judge clicking every claim. Persuasive, never inflated:
every "it does X" links to the code, test or screenshot that proves it.

## Rules
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

## Structure (fill from `MVP.md`, `MARKET.md`, `DEMO.md`, `DESIGN.md`)

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
