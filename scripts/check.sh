#!/usr/bin/env bash
# Repo checks (run in CI and locally):
#  1. SKILL.md has valid frontmatter whose name matches its folder.
#  2. Every skill the playbook routes to is installed by install.sh.
set -euo pipefail
cd "$(dirname "$0")/.."

fail=0
skill=skills/hackathon/SKILL.md

head -1 "$skill" | grep -qx -- '---' || { echo "frontmatter missing in $skill"; fail=1; }
name="$(awk '/^name:/ {print $2; exit}' "$skill")"
[ "$name" = "hackathon" ] || { echo "name: '$name' does not match folder 'hackathon'"; fail=1; }
grep -q '^description: ' "$skill" || { echo "description missing in $skill"; fail=1; }

# Skills the agent's own platform may provide; not installed by us.
optional="pptx research brainstorm dataviz landing-page-design pitch-deck-visuals infographic"

installed="$(grep -E '^[A-Za-z0-9._-]+/[A-Za-z0-9._-]+\|' install.sh | awk -F'|' '{print $3}' | sort -u)"
# Backticks below are literal Markdown, not shell expansions.
# shellcheck disable=SC2016
referenced="$(grep -oE '`[a-z0-9]+(-[a-z0-9]+)+`|`(animate|hallmark|impeccable|shadcn|last30days|pptx|research|brainstorm|dataviz|infographic)`' "$skill" \
  | tr -d '`' | sort -u)"

for s in $referenced; do
  case " $optional hackathon " in *" $s "*) continue ;; esac
  # Filenames and placeholders that look like skill names are not skills.
  case "$s" in *.md|ui-by-product-type|demo-final|demo-ok) continue ;; esac
  if ! printf '%s\n' "$installed" | grep -qx "$s"; then
    echo "SKILL.md routes to '$s' but install.sh does not install it"; fail=1
  fi
done

[ "$fail" = 0 ] && echo "checks passed ($(printf '%s\n' "$installed" | wc -l | tr -d ' ') third-party skills + hackathon)"
exit "$fail"
