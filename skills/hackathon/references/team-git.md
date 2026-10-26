# Team git workflow (teams of 2+)

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
