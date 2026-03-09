#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cat <<MSG
Claude setup

1) Open these files in your Claude session:
   - $ROOT_DIR/AGENTS.md
   - $ROOT_DIR/agents/claude.md

2) This repo already contains portable skills in:
   - $ROOT_DIR/.skills/brainstorm
   - $ROOT_DIR/.skills/bug-review
   - $ROOT_DIR/.skills/copy-expert
   - $ROOT_DIR/.skills/dev-loop
   - $ROOT_DIR/.skills/e2e-loop
   - $ROOT_DIR/.skills/orchestrator
   - $ROOT_DIR/.skills/ux-eval

3) If you mirror skills into another repo, keep its .skills folder aligned with $ROOT_DIR/agents/skills.md.
MSG
