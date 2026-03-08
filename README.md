# AI Constitution

This repo is a shared, tool-agnostic source of truth for AI agent behavior. It provides:
- `AGENTS.md`: universal rules for all agents
- `agents/`: tool-specific overlays
- `.skills/`: portable skill implementations that can be loaded in different agent environments
- `agents/skills.md`: shared skills registry

## Fresh Machine Setup

### 1) Clone
```bash
git clone <YOUR_REMOTE_URL> ~/ai-constitution
cd ~/ai-constitution
```

### 2) Codex Setup
Codex can be pointed to this repo's guidance in a new session. Use the setup script to wire repo skills into `~/.codex/skills` and print the instructions to use them.

```bash
./scripts/setup-codex.sh
```

Then, in a new Codex session, say:
- “Open `~/ai-constitution/AGENTS.md` and `~/ai-constitution/agents/codex.md`. Use them as the operating rules.”

### 3) Claude Setup
```bash
./scripts/setup-claude.sh
```

Then, in a new Claude session, say:
- “Open `~/ai-constitution/AGENTS.md` and `~/ai-constitution/agents/claude.md`. Use them as the operating rules.”

## Included Skills
- `dev-loop`: plan-first, TDD-oriented workflow for non-trivial implementation work
- `orchestrator`: coordination skill for multi-step or cross-cutting delivery
- `ux-eval`: UX and UI evaluation skill with heuristics and Playwright scaffolding
- `e2e-loop`: approval-gated end-to-end testing workflow for user stories and user flows

## Repo Layout
- `AGENTS.md`: universal operating rules
- `agents/claude.md`: Claude overlay
- `agents/codex.md`: Codex overlay
- `agents/skills.md`: skills registry
- `.skills/dev-loop/`: portable `dev-loop` skill
- `.skills/orchestrator/`: portable `orchestrator` skill
- `.skills/ux-eval/`: portable `ux-eval` skill with references and scripts
- `.skills/e2e-loop/`: portable `e2e-loop` skill with framework-selection and reporting references
- `scripts/`: setup helpers

## Recommended Project Integration
For each project repo, either:
- clone this repo into the project as a subfolder and point your agent tooling at its `.skills/` directory
- or sync the needed skills from this repo into the tool-specific skills directory

Example `AGENTS.local.md`:
```md
# Local Agent Rules

This project inherits the universal rules from:
- ~/ai-constitution/AGENTS.md
- ~/ai-constitution/agents/codex.md (for Codex)
- ~/ai-constitution/agents/claude.md (for Claude)

Project-specific rules (if any) go here.
```

## Skills Strategy
This repo keeps the portable skill source in `.skills/` and mirrors the inventory in `agents/skills.md`.

Typical mappings:
- Claude: load skills directly from `.skills/*/SKILL.md`
- Codex: symlink or copy `.skills/*` into `~/.codex/skills/*`
