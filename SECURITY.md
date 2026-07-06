# Security Policy

This is a public repository maintained by `desertfox33`.

## Supported use

This repository is a Claude Code project template. It contains project instructions, skills, hooks, agent definitions, workflow notes, and security guidance.

## Reporting a security issue

If you find a security issue in this template, open a GitHub issue with enough detail to reproduce or review the concern.

Do not include live secrets, private tokens, passwords, or customer data in the issue.

## Public repository safety rules

The repository should not contain:

- API keys
- Access tokens
- Private SSH keys
- GPG private keys
- Cloud credentials
- Real `.env` files
- Production credentials
- Personal local paths
- Private Claude local overrides

Use example files instead:

- `.env.example`
- `CLAUDE.local.md.example`
- `.claude/settings.local.json.example`

## High-risk areas

Review these files carefully before merging changes:

- `.claude/hooks/*.sh`
- `.mcp.json`
- `.claude/agents/*.md`
- `.claude/skills/*/SKILL.md`
- GitHub Actions workflows
- Dependency manifests

Hooks can execute commands. MCP configuration can connect Claude to external systems. Skills and agents can influence how work is delegated or interpreted. Treat these as code, not just documentation.

## Maintainer checklist before merging

- Review the diff line by line.
- Confirm no secret values were added.
- Confirm hooks do not run destructive commands.
- Confirm MCP servers are expected and documented.
- Confirm new instructions do not bypass review or safety controls.
- Confirm examples are clearly marked as examples.
- Confirm public users cannot push directly to `main`.

## Recommended GitHub settings

Enable:

- Two-factor authentication for the maintainer account
- Dependency graph
- Dependabot alerts
- Dependabot security updates
- Secret scanning
- Secret scanning push protection where available
- Branch protection or repository rulesets for `main`
- Pull request review before merge
- Read-only GitHub Actions permissions unless write access is required
