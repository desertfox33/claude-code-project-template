# Contributing

Thank you for improving this Claude Code project template.

This is a public repository, but direct write access should remain limited to the maintainer account `desertfox33`.

## Contribution model

1. Fork the repository.
2. Create a feature branch.
3. Make a focused change.
4. Open a pull request.
5. Explain the security and Claude Code impact.

## Before opening a pull request

Check that your change does not add:

- Secrets
- Tokens
- Private keys
- Personal local paths
- Production credentials
- Unsafe shell commands
- Unreviewed MCP connections
- Unexplained automation

## Areas requiring extra review

The following paths can materially affect project behavior:

```text
.claude/hooks/
.claude/skills/
.claude/agents/
.claude/commands/
.mcp.json
.github/workflows/
```

Any change in these areas should explain what it does, why it is needed, and what risk it introduces.

## Style

Keep documentation practical and concise. Prefer clear operational guidance over hype or vague claims.
