#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cat <<MSG
Claude setup

1) Open these files in your Claude session:
   - $ROOT_DIR/AGENTS.md
   - $ROOT_DIR/agents/claude.md

2) If the repo you are working in has a .skills folder, keep it in sync with $ROOT_DIR/agents/skills.md.
MSG
