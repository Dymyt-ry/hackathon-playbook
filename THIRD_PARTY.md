# Third-party skills

This repository contains only the `hackathon` playbook (MIT). Every other skill
is **downloaded from its author's repository at install time** by `install.sh`
and stays under its own license. Nothing below is redistributed from here.

| Skills (installed name) | Source | License |
|---|---|---|
| `founder-validate-idea`, `founder-mvp-scope`, `founder-pitch-deck`, `founder-competitor-matrix`, `founder-landing-page`, `founder-go-to-market`, `founder-pricing-strategy`, `founder-product-brief`, `founder-persona-gen`, `founder-user-interviews` | [emotixco/claude-skills-founder](https://github.com/emotixco/claude-skills-founder) | MIT |
| `pm-prioritize-features`, `pm-brainstorm-ideas-new`, `pm-brainstorm-experiments-new`, `pm-interview-script`, `pm-value-proposition`, `pm-lean-canvas`, `pm-startup-canvas`, `pm-ideal-customer-profile`, `pm-beachhead-segment`, `pm-growth-loops`, `pm-market-sizing`, `pm-monetization-strategy`, `pm-business-model`, `pm-product-name`, `pm-positioning-ideas`, `pm-value-prop-statements` | [phuryn/pm-skills](https://github.com/phuryn/pm-skills) | MIT |
| `last30days` | [mvanhorn/last30days-skill](https://github.com/mvanhorn/last30days-skill) | MIT |
| `logo-design` | [kaankiziltug/logo-design-skill](https://github.com/kaankiziltug/logo-design-skill) | MIT (its reference library contains third-party logos, which are trademarks of their owners — see the upstream TRADEMARKS.md) |
| `frontend-design` | [anthropics/skills](https://github.com/anthropics/skills/tree/main/skills/frontend-design) | Apache-2.0 (LICENSE.txt in the skill folder) |
| `design-taste-frontend` | [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) | MIT |
| `hallmark` | [Nutlope/hallmark](https://github.com/Nutlope/hallmark) | MIT |
| `ui-ux-pro-max` | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | MIT |
| `refero-design` | [referodesign/refero_skill](https://github.com/referodesign/refero_skill) | MIT |
| `impeccable` | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | Apache-2.0 |
| `emil-design-eng`, `animate`, `apple-design`, `mobile-native` | [emilkowalski/skills](https://github.com/emilkowalski/skills) | MIT |
| `shadcn` | [shadcn-ui/ui](https://github.com/shadcn-ui/ui/tree/main/skills/shadcn) | MIT |
| `expo-overview`, `expo-router`, `expo-design-system`, `expo-native-ui`, `expo-ui`, `expo-animation` | [expo/skills](https://github.com/expo/skills) | MIT |
| `vercel-react-native-skills` | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | MIT (declared in the skill's frontmatter) |
| `frontend-slides` | [zarazhangrui/frontend-slides](https://github.com/zarazhangrui/frontend-slides) | MIT |
| `grill-me` | [mattpocock/skills](https://github.com/mattpocock/skills) | MIT |
| `social-content` (upstream name `social`), `product-marketing`, `copywriting` | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) | MIT |
| `infographic` | [claude-office-skills/skills](https://github.com/claude-office-skills/skills) | MIT |
| `using-git-worktrees`, `verification-before-completion`, `requesting-code-review`, `receiving-code-review`, `finishing-a-development-branch` | [obra/superpowers](https://github.com/obra/superpowers) | MIT |

## What the installer changes

Text only, never code:

- `founder-*` and `pm-*` are prefixed so they do not collide with each other
  (both packs ship a `pricing-strategy`) and group together in skill pickers.
- `founder-*` skills come from a Claude Code plugin and point at
  `${CLAUDE_PLUGIN_ROOT}/shared/conventions.md`. Only Claude Code plugins expand
  that variable, so the installer rewrites it to the absolute path of the copied
  `shared/` folder. That makes them work in Cursor and Codex too.
- `react-native-skills` and `social` are installed under the name their
  frontmatter (or this playbook) uses, because agents match on that name.

## Things worth knowing before you run them

- `impeccable`'s launcher downloads its detector binary from the author's GitHub
  releases the first time you use `/audit` or `/live`, verified against a sha256
  file from the same release. The design guidance works without it.
- `frontend-slides` ships `export-pdf.sh` (installs Playwright via npm when you
  run it) and `deploy.sh` (publishes a deck when you run it). Neither runs on
  install.
- `last30days` sends search queries to the services it searches; TikTok and
  Instagram need a ScrapeCreators API key that its own setup flow creates.
