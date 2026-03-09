---
name: backlog
description: >
  View and manage the GitHub Issues backlog. Use this skill when the user says
  things like "show me the backlog", "what's in the queue", "what should we work
  on next", "pick up a ticket", "work on the next issue", "show open bugs", or
  "what needs doing". Also use when the user asks you to work from the backlog
  autonomously — pick the highest priority item and start working on it using
  the appropriate workflow skill (dev-loop for features, direct fix for bugs).
---

# Backlog — Issue Queue Management

View, prioritize, and work from the GitHub Issues backlog.

## When to use

- User asks to see the backlog, open issues, or what's next
- User asks you to pick up work from the backlog
- User wants to triage, prioritize, or close issues
- User says "what needs doing" or "work on the next ticket"

## Commands

The user may invoke this skill with optional arguments:

- `/backlog` — Show the full open backlog, organized by priority
- `/backlog bugs` — Show only bugs
- `/backlog features` — Show only features
- `/backlog next` — Pick the highest priority item and start working on it
- `/backlog triage` — Review untagged/unprioritized issues and suggest labels
- `/backlog close #N` — Close issue #N with a reason

## Workflow

### Viewing the backlog

Fetch open issues and display them organized by priority:

```bash
# Get all open issues with labels
gh issue list --state open --json number,title,labels,createdAt,updatedAt --limit 50
```

Display format:
```
## Backlog

### High Priority
- #12 Fix wallet balance not updating after transfer [bug]
- #15 Add biometric auth for iOS [feature]

### Medium Priority
- #8 Improve error messages on registration form [ui/ux]

### Low Priority
- #3 Clean up unused API endpoints [chore]

### Unprioritized
- #18 Something without priority labels [bug]
```

### Working from the backlog (`/backlog next`)

1. Fetch the highest priority open issue
2. Read the full issue body and comments
3. Assess the work:
   - **Trivial fix** (typo, one-file change, config): Fix it directly
   - **Bug**: Investigate, fix, verify — autonomous bug fixing per CLAUDE.md
   - **Non-trivial feature/improvement**: Invoke the `dev-loop` skill
4. When done, close the issue with `gh issue close #N --comment "Fixed in commit <sha>"`

### Triaging (`/backlog triage`)

1. Find issues missing priority or type labels
2. For each, read the issue and suggest appropriate labels
3. Present suggestions to the user for approval
4. Apply approved labels via `gh issue edit #N --add-label "label"`

### Closing (`/backlog close #N`)

```bash
gh issue close N --comment "Reason for closing"
```

## Rules

- **Priority order**: `priority:high` > `priority:medium` > `priority:low` > unprioritized
- **Within same priority**: Bugs before features before improvements before chores
- **Respect scope**: When picking up a ticket, work only on what the ticket describes
- **Link work to issues**: Reference issue numbers in commits when working tickets
- **Keep it visual**: Use clean formatting when showing the backlog so it's scannable
- **Auto-close**: When you complete work for an issue, close it with a reference to the fix
