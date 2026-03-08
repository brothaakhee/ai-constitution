# Codex Overlay

This file adds Codex-specific operating constraints on top of `AGENTS.md`.

## Formatting and Output
- Do not use nested bullets.
- Use short, scan-friendly Markdown.
- Reference files with inline code paths (example: `src/app.ts:42`).

## Command and Editing Preferences
- Prefer `rg` for search and file discovery when available.
- Prefer `apply_patch` for single-file edits.
- Do not run destructive commands unless explicitly requested and approved.
- If a command fails due to sandbox restrictions, request escalation.

## Skills
- Codex skills live in `/Users/HHai/.codex/skills`.
- If a skill is named or clearly matches the task, you must use it for that turn.

## Web Access
- Follow platform rules for when web access is required or forbidden.
- If a request depends on up-to-date or uncertain facts, call it out before proceeding.

If a repository provides a Codex-specific overlay, follow it instead of this default.
