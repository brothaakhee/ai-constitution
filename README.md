# AI Constitution

This repo is a shared, tool-agnostic source of truth for AI agent behavior. It provides:
- `AGENTS.md`: universal rules for all agents
- `agents/`: tool-specific overlays
- `agents/skills.md`: shared skills registry template

## Fresh Machine Setup

### 1) Clone
```bash
git clone <YOUR_REMOTE_URL> ~/ai-constitution
cd ~/ai-constitution
```

### 2) Codex Setup
Codex can be pointed to this repo’s guidance in a new session. Use the setup script to wire skills and provide quick instructions.

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

## Repo Layout
- `AGENTS.md`: universal operating rules
- `agents/claude.md`: Claude overlay
- `agents/codex.md`: Codex overlay
- `agents/skills.md`: shared skills registry template
- `scripts/`: setup helpers

## Recommended Project Integration
For each project repo, add a small local overlay so tools can find the shared rules quickly:
- `AGENTS.local.md` with a short note pointing to this repo
- `agents/<tool>.md` for tool-specific overrides (only if needed)

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
Keep tool-agnostic skill metadata in `agents/skills.md`. Each tool can map that registry to its own skill system:
- Claude: `.skills/*/SKILL.md`
- Codex: `~/.codex/skills/*/SKILL.md`

