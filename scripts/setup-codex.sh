#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
SKILLS_DIR="$CODEX_HOME/skills"

mkdir -p "$CODEX_HOME"
mkdir -p "$SKILLS_DIR"

for skill_dir in "$ROOT_DIR"/.skills/*; do
  if [ -d "$skill_dir" ]; then
    skill_name="$(basename "$skill_dir")"
    ln -sfn "$skill_dir" "$SKILLS_DIR/$skill_name"
  fi
done

cat <<MSG
Codex setup

1) Open these files in your Codex session:
   - $ROOT_DIR/AGENTS.md
   - $ROOT_DIR/agents/codex.md

2) Repo skills have been linked into:
   - $SKILLS_DIR/dev-loop
   - $SKILLS_DIR/orchestrator
   - $SKILLS_DIR/ux-eval

3) (Optional) Link shared skills registry into Codex home:
   ln -sfn "$ROOT_DIR/agents/skills.md" "$CODEX_HOME/skills-registry.md"

4) In a new Codex session, you can invoke:
   - \$dev-loop
   - \$orchestrator
   - \$ux-eval
MSG
