#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"

mkdir -p "$CODEX_HOME"

cat <<MSG
Codex setup

1) Open these files in your Codex session:
   - $ROOT_DIR/AGENTS.md
   - $ROOT_DIR/agents/codex.md

2) (Optional) Link shared skills registry into Codex home:
   ln -sfn "$ROOT_DIR/agents/skills.md" "$CODEX_HOME/skills-registry.md"

3) If you keep Codex skills in $CODEX_HOME/skills, ensure any referenced skills exist there.
MSG
