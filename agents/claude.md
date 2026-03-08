# Claude Overlay

This file adds Claude-specific operating constraints on top of `AGENTS.md`.

## Skills
- When a relevant skill exists for the task, you must use it.
- Skills are stored at `.skills/*/SKILL.md` in the repository unless the repo says otherwise.
- If skills exist, match the task to a skill before starting work.

## Subagents
- Use subagents to keep main context small.
- One task per subagent.
- Launch independent subagent tasks in parallel.

## Task Tracking
- Plan-first: write a plan to `tasks/todo.md` with checkable items.
- Verify plan with the user before implementation.
- Track progress and mark items complete as you go.
- Add a short review section to `tasks/todo.md` when done.

## Lessons Loop
- After any correction from the user, update `tasks/lessons.md` with the pattern.
- Review lessons at session start when relevant.

If a repository uses different task or lessons paths, follow the repo’s instructions instead of these defaults.
