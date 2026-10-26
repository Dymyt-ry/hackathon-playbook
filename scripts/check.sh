#!/usr/bin/env bash
# Repo checks (run in CI and locally):
#  1. SKILL.md has valid frontmatter whose name matches its folder.
#  2. Every references/ file SKILL.md points to exists.
#  3. Every skill the playbook routes to is installed by install.sh.
#  4. Every skill install.sh installs is routed to (no dead weight).
set -euo pipefail
cd "$(dirname "$0")/.."

fail=0
dir=skills/hackathon
skill=$dir/SKILL.md

head -1 "$skill" | grep -qx -- '---' || { echo "frontmatter missing in $skill"; fail=1; }
name="$(awk '/^name:/ {print $2; exit}' "$skill")"
[ "$name" = "hackathon" ] || { echo "name: '$name' does not match folder 'hackathon'"; fail=1; }
grep -q '^description: ' "$skill" || { echo "description missing in $skill"; fail=1; }

while read -r ref; do
  [ -f "$dir/$ref" ] || { echo "playbook points to '$ref' but $dir/$ref does not exist"; fail=1; }
done < <(grep -ohE 'references/[a-z0-9-]+\.md' "$dir"/SKILL.md "$dir"/references/*.md | sort -u)

# Skills the agent's own platform may provide; not installed by us.
optional="pptx research brainstorm dataviz landing-page-design pitch-deck-visuals"

installed="$(grep -E '^[A-Za-z0-9._-]+/[A-Za-z0-9._-]+\|' install.sh | awk -F'|' '{print $3}' | sort -u)"
# Backticks below are literal Markdown, not shell expansions.
# shellcheck disable=SC2016
referenced="$(grep -ohE '`[a-z0-9]+(-[a-z0-9]+)+`|`(animate|impeccable|shadcn|last30days|copywriting|infographic|pptx|research|brainstorm|dataviz)`' "$dir"/SKILL.md "$dir"/references/*.md \
  | tr -d '`' | sort -u)"

for s in $referenced; do
  case " $optional hackathon " in *" $s "*) continue ;; esac
  # Filenames and placeholders that look like skill names are not skills.
  case "$s" in *.md|demo-final|demo-ok) continue ;; esac
  if ! printf '%s\n' "$installed" | grep -qx "$s"; then
    echo "playbook routes to '$s' but install.sh does not install it"; fail=1
  fi
done

for s in $installed; do
  if ! printf '%s\n' "$referenced" | grep -qx "$s"; then
    echo "install.sh installs '$s' but the playbook never routes to it"; fail=1
  fi
done

[ "$fail" = 0 ] && echo "checks passed ($(printf '%s\n' "$installed" | wc -l | tr -d ' ') third-party skills + hackathon)"
exit "$fail"
