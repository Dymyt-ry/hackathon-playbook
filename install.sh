#!/usr/bin/env bash
# hackathon-playbook installer
#
# Installs the `hackathon` skill from this repo plus every skill it routes to,
# fetched straight from each author's repository (nothing third-party is
# bundled here). Skills land in one directory and are symlinked into the skill
# folders of Claude Code, Cursor and Codex.
#
# It never runs third-party code: repos are sparse-cloned, skill folders are
# copied, and only text is rewritten (skill names, one path). Review what you
# install — see THIRD_PARTY.md.
#
#   ./install.sh                      # everything, linked for all agents
#   ./install.sh --agents claude      # only Claude Code
#   ./install.sh --dry-run            # show what would happen
#   ./install.sh --uninstall          # remove the links and the skill store

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STORE="${HACKATHON_PLAYBOOK_HOME:-$HOME/.local/share/hackathon-playbook}/skills"
AGENTS="claude,agents,codex"
DRY_RUN=0
UNINSTALL=0

usage() {
  sed -n '2,17p' "$0" | sed 's/^# \{0,1\}//'
  cat <<'EOF'
Options:
  --agents LIST   comma-separated: claude, agents, codex, cursor (default: claude,agents,codex)
                  claude -> ~/.claude/skills   (Claude Code; Cursor reads it too)
                  agents -> ~/.agents/skills   (Codex, Cursor and other Agent Skills tools)
                  codex  -> ~/.codex/skills    (older Codex versions)
                  cursor -> ~/.cursor/skills
  --store DIR     where the skill files live (default: ~/.local/share/hackathon-playbook/skills)
  --dry-run       print the plan, change nothing
  --uninstall     remove links created by this installer and the store
  -h, --help      this help
EOF
}

while [ $# -gt 0 ]; do
  case "$1" in
    --agents) AGENTS="$2"; shift 2 ;;
    --store) STORE="$2"; shift 2 ;;
    --dry-run) DRY_RUN=1; shift ;;
    --uninstall) UNINSTALL=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "unknown option: $1" >&2; usage; exit 2 ;;
  esac
done

# --- output helpers ---------------------------------------------------------
if [ -t 1 ]; then B=$'\033[1m'; G=$'\033[32m'; Y=$'\033[33m'; R=$'\033[31m'; D=$'\033[2m'; N=$'\033[0m'
else B=; G=; Y=; R=; D=; N=; fi
say()  { printf '%s\n' "$*"; }
ok()   { printf '  %s+%s %s\n' "$G" "$N" "$*"; }
skip() { printf '  %s=%s %s\n' "$D" "$N" "$*"; }
warn() { printf '  %s!%s %s\n' "$Y" "$N" "$*" >&2; }
die()  { printf '%serror:%s %s\n' "$R" "$N" "$*" >&2; exit 1; }
run()  { if [ "$DRY_RUN" = 1 ]; then printf '  %s[dry-run]%s %s\n' "$D" "$N" "$*"; else "$@"; fi; }

command -v git >/dev/null || die "git is required"

agent_dir() {
  case "$1" in
    claude) echo "$HOME/.claude/skills" ;;
    agents) echo "$HOME/.agents/skills" ;;
    codex)  echo "$HOME/.codex/skills" ;;
    cursor) echo "$HOME/.cursor/skills" ;;
    *) die "unknown agent: $1 (use claude, agents, codex, cursor)" ;;
  esac
}

# --- manifest ----------------------------------------------------------------
# repo | path inside repo | installed name | transform
#   transform: none | founder | pm
MANIFEST='
emotixco/claude-skills-founder|skills/validate-idea|founder-validate-idea|founder
emotixco/claude-skills-founder|skills/mvp-scope|founder-mvp-scope|founder
emotixco/claude-skills-founder|skills/pitch-deck|founder-pitch-deck|founder
emotixco/claude-skills-founder|skills/competitor-matrix|founder-competitor-matrix|founder
emotixco/claude-skills-founder|skills/landing-page|founder-landing-page|founder
emotixco/claude-skills-founder|skills/go-to-market|founder-go-to-market|founder
emotixco/claude-skills-founder|skills/pricing-strategy|founder-pricing-strategy|founder
emotixco/claude-skills-founder|skills/product-brief|founder-product-brief|founder
emotixco/claude-skills-founder|skills/persona-gen|founder-persona-gen|founder
phuryn/pm-skills|pm-product-discovery/skills/prioritize-features|pm-prioritize-features|pm
phuryn/pm-skills|pm-product-discovery/skills/brainstorm-ideas-new|pm-brainstorm-ideas-new|pm
phuryn/pm-skills|pm-product-discovery/skills/brainstorm-experiments-new|pm-brainstorm-experiments-new|pm
phuryn/pm-skills|pm-product-strategy/skills/value-proposition|pm-value-proposition|pm
phuryn/pm-skills|pm-product-strategy/skills/lean-canvas|pm-lean-canvas|pm
phuryn/pm-skills|pm-product-strategy/skills/startup-canvas|pm-startup-canvas|pm
phuryn/pm-skills|pm-go-to-market/skills/ideal-customer-profile|pm-ideal-customer-profile|pm
phuryn/pm-skills|pm-go-to-market/skills/beachhead-segment|pm-beachhead-segment|pm
mvanhorn/last30days-skill|skills/last30days|last30days|none
kaankiziltug/logo-design-skill|skills/logo-design|logo-design|none
anthropics/skills|skills/frontend-design|frontend-design|none
Leonxlnx/taste-skill|skills/taste-skill|design-taste-frontend|none
Nutlope/hallmark|skills/hallmark|hallmark|none
nextlevelbuilder/ui-ux-pro-max-skill|.claude/skills/ui-ux-pro-max|ui-ux-pro-max|none
referodesign/refero_skill|skills/refero-design|refero-design|none
pbakaus/impeccable|.agents/skills/impeccable|impeccable|none
emilkowalski/skills|skills/emil-design-eng|emil-design-eng|none
emilkowalski/skills|skills/animate|animate|none
emilkowalski/skills|skills/apple-design|apple-design|none
emilkowalski/skills|skills/mobile-native|mobile-native|none
shadcn-ui/ui|skills/shadcn|shadcn|none
expo/skills|plugins/expo/skills/expo-overview|expo-overview|none
expo/skills|plugins/expo/skills/expo-router|expo-router|none
expo/skills|plugins/expo/skills/expo-design-system|expo-design-system|none
expo/skills|plugins/expo/skills/expo-native-ui|expo-native-ui|none
expo/skills|plugins/expo/skills/expo-ui|expo-ui|none
expo/skills|plugins/expo/skills/expo-animation|expo-animation|none
vercel-labs/agent-skills|skills/react-native-skills|vercel-react-native-skills|none
zarazhangrui/frontend-slides|plugins/frontend-slides/skills/frontend-slides|frontend-slides|none
mattpocock/skills|skills/productivity/grill-me|grill-me|none
coreyhaines31/marketingskills|skills/social|social-content|none
'

# Names this installer may create links for (hackathon + every manifest entry).
all_names() {
  echo hackathon
  printf '%s\n' "$MANIFEST" | awk -F'|' 'NF==4 {print $3}'
}

link_all() {
  local IFS_OLD="$IFS" agent dir name src target
  # Split the comma-separated agent list on purpose.
  IFS=','
  # shellcheck disable=SC2086
  set -- $AGENTS
  IFS="$IFS_OLD"
  for agent in "$@"; do
    dir="$(agent_dir "$agent")"
    say "${B}Linking into ${dir/#$HOME/~}${N}"
    run mkdir -p "$dir"
    for name in $(all_names); do
      src="$STORE/$name"; target="$dir/$name"
      [ -d "$src" ] || [ "$DRY_RUN" = 1 ] || { warn "$name missing from store, not linked"; continue; }
      if [ -L "$target" ]; then
        [ "$(readlink "$target")" = "$src" ] && { skip "$name"; continue; }
        run rm "$target"
      elif [ -e "$target" ]; then
        warn "$name: a real folder already exists at ${target/#$HOME/~} — left untouched"
        continue
      fi
      run ln -s "$src" "$target"; ok "$name"
    done
  done
}

uninstall() {
  local agent dir name target
  for agent in claude agents codex cursor; do
    dir="$(agent_dir "$agent")"
    for name in $(all_names); do
      target="$dir/$name"
      if [ -L "$target" ] && [ "$(readlink "$target")" = "$STORE/$name" ]; then
        run rm "$target"; ok "unlinked ${target/#$HOME/~}"
      fi
    done
  done
  [ -d "$STORE" ] && { run rm -rf "$STORE"; ok "removed ${STORE/#$HOME/~}"; }
  say "${G}Done.${N}"
}

# Replace the first `name:` line of a SKILL.md frontmatter.
set_name() {
  local file="$1" name="$2" tmp
  tmp="$(mktemp)"
  awk -v n="$name" '!done && /^name:/ { print "name: " n; done=1; next } { print }' "$file" > "$tmp"
  mv "$tmp" "$file"
}

# In-place sed that works with both BSD (macOS) and GNU sed.
sed_i() {
  local last
  for last in "$@"; do :; done
  sed -i.hpbak "$@" && rm -f "$last.hpbak"
}

fetch_repo() {   # repo -> sparse checkout dir (all paths that repo needs)
  local repo="$1" dest="$2" paths
  paths="$(printf '%s\n' "$MANIFEST" | awk -F'|' -v r="$repo" '$1==r {print $2}' | sort -u)"
  [ "$repo" = "emotixco/claude-skills-founder" ] && paths="$paths
shared"
  git clone --quiet --depth 1 --filter=blob:none --sparse "https://github.com/$repo" "$dest"
  # shellcheck disable=SC2086
  git -C "$dest" sparse-checkout set $paths
}

install_all() {
  local repo dir path name transform src dst
  WORK="$(mktemp -d)"; trap 'rm -rf "$WORK"' EXIT

  say "${B}hackathon-playbook${N} → ${STORE/#$HOME/~}"
  run mkdir -p "$STORE"

  # 1. the playbook itself
  run rm -rf "$STORE/hackathon"
  run cp -R "$SCRIPT_DIR/skills/hackathon" "$STORE/hackathon"; ok "hackathon"

  # 2. third-party skills, one sparse clone per repo
  for repo in $(printf '%s\n' "$MANIFEST" | awk -F'|' 'NF==4 {print $1}' | sort -u); do
    say "${B}${repo}${N}"
    dir="$WORK/$(echo "$repo" | tr '/' '_')"
    if [ "$DRY_RUN" = 1 ]; then
      printf '%s\n' "$MANIFEST" | awk -F'|' -v r="$repo" '$1==r {print "  [dry-run] " $3 "  <-  " $2}'
      continue
    fi
    if ! fetch_repo "$repo" "$dir" 2>/dev/null; then warn "could not fetch $repo — skipped"; continue; fi

    if [ "$repo" = "emotixco/claude-skills-founder" ]; then
      rm -rf "$STORE/_founder-shared"; cp -R "$dir/shared" "$STORE/_founder-shared"
    fi

    while IFS='|' read -r r path name transform; do
      [ "$r" = "$repo" ] || continue
      src="$dir/$path"; dst="$STORE/$name"
      [ -f "$src/SKILL.md" ] || { warn "$name: $path/SKILL.md not found upstream — skipped"; continue; }
      rm -rf "$dst"; cp -R "$src" "$dst"; rm -rf "$dst/.git"
      set_name "$dst/SKILL.md" "$name"
      case "$transform" in
        founder)
          # Plugin-only variable → absolute path; plugin command refs → skill names.
          sed_i -e "s#\${CLAUDE_PLUGIN_ROOT}/shared#$STORE/_founder-shared#g" \
                -e 's#/founder:\([a-z-]*\)#founder-\1#g' "$dst/SKILL.md" ;;
      esac
      ok "$name"
    done <<EOF
$MANIFEST
EOF
  done
  [ -d "$STORE/_founder-shared" ] && [ "$DRY_RUN" = 0 ] && \
    sed_i -e 's#/founder:\([a-z-]*\)#founder-\1#g' "$STORE/_founder-shared/conventions.md" 2>/dev/null || true

  link_all
  say ""
  say "${G}Installed.${N} Restart your agent, then say: ${B}\"hackathon\"${N} or run ${B}/hackathon${N}."
  say "${D}TikTok/Instagram in last30days need a ScrapeCreators key — run /last30days once for setup.${N}"
}

if [ "$UNINSTALL" = 1 ]; then uninstall; else install_all; fi
