# Decisions

## 001 - Keep CLAUDE.md concise

Decision: Put always-loaded instructions in `CLAUDE.md`, and move task-specific detail into rules, skills, commands, agents, and workflows.

Reason: Project memory should be useful every session without filling the context window with rarely used instructions.

## 002 - Keep local overrides out of git

Decision: Use `CLAUDE.local.md` and `.claude/settings.local.json` for personal settings and ignore them in git.

Reason: Local paths, preferences, and experimental permissions should not affect the whole team.
