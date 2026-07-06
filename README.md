# Claude Code Project Template

A secure, reusable project template for setting up Claude Code with structured project instructions, skills, agents, hooks, workflows, and GitHub repository safety controls.

This repository is maintained by **desertfox33** and is designed to help developers use Claude Code consistently across real project work while keeping public-repository security risks under control.

---

## Purpose

AI coding tools work best when they understand the project around the code.

This template provides a structured Claude Code setup for:

* project-wide instructions
* reusable Claude skills
* specialized agents
* slash-command workflows
* deterministic hooks
* local-only configuration patterns
* secure GitHub repository practices
* public-repository safety checks

The goal is not only to make Claude Code more useful, but also to make its behavior more predictable, reviewable, and safer for collaborative development.

---

## Repository Structure

```text
claude-code-project-template/
├── CLAUDE.md
├── CLAUDE.local.md.example
├── AGENTS.md
├── .mcp.example.json
├── .gitignore
├── SECURITY.md
├── CONTRIBUTING.md
├── README.md
├── .github/
│   ├── CODEOWNERS
│   ├── dependabot.yml
│   ├── pull_request_template.md
│   └── workflows/
│       └── repository-safety.yml
├── .claude/
│   ├── settings.json
│   ├── settings.local.json.example
│   ├── rules/
│   ├── commands/
│   ├── skills/
│   ├── agents/
│   ├── hooks/
│   ├── memory/
│   └── workflows/
├── scripts/
│   ├── check-repo-safety.sh
│   └── init-local.sh
└── blog/
    └── devto-claude-code-project-setup.md
```

---

## Core Concepts

### `CLAUDE.md`

`CLAUDE.md` is the main project instruction file. It should contain context Claude should know in every session, such as:

* project purpose
* coding standards
* testing expectations
* security expectations
* sensitive files
* recommended skills and workflows

Do not put secrets, local paths, private notes, or temporary machine-specific information in `CLAUDE.md`.

---

### `CLAUDE.local.md`

`CLAUDE.local.md` is for personal local overrides.

This file should not be committed.

Use the example file:

```bash
cp CLAUDE.local.md.example CLAUDE.local.md
```

Use it for local preferences such as:

* local test commands
* machine-specific paths
* personal workflow notes
* temporary development instructions

---

### `.claude/rules/`

Rules define project standards that Claude should follow across multiple tasks.

Examples include:

* code style
* API conventions
* testing standards
* pull request standards

Use rules when the guidance is reusable and applies broadly.

---

### `.claude/skills/`

Skills provide reusable task expertise.

This template includes skills for:

* code review
* test writing
* pull request descriptions
* security review

Use skills when Claude should follow a repeatable process for a specific type of work.

Example:

```text
Use the security-review skill to inspect this branch before merge.
```

---

### `.claude/agents/`

Agents define specialized Claude roles.

This template includes agents for:

* security review
* test writing
* research

Agents are useful when a task benefits from isolated focus or a specialized review perspective.

Agent output should be treated as advisory. Human review is still required before merging, deploying, or publishing changes.

---

### `.claude/hooks/`

Hooks provide deterministic checks around Claude Code tool use.

This template includes hooks for:

* blocking writes to sensitive files
* blocking dangerous Bash commands
* formatting after edits
* validating code

Hooks are executable code and must be reviewed carefully.

Security-sensitive hook changes should require code-owner review.

---

### `.claude/workflows/`

Workflows define repeatable multi-step task patterns, such as:

* feature development
* bug fixing
* code review

Workflows can reference skills, rules, and agents to keep project work consistent.

---

### MCP Configuration

This repository intentionally commits:

```text
.mcp.example.json
```

This repository should not commit:

```text
.mcp.json
```

`.mcp.json` is local-only and is ignored by Git.

Model Context Protocol configuration may connect Claude to external tools, repositories, services, or data sources. Treat MCP configuration as sensitive integration configuration.

Before enabling MCP, review:

* what service it connects to
* what permissions it has
* whether it can read private data
* whether it can write or delete data
* where credentials are stored
* whether the server or package source is trusted

---

## Security Model

This repository treats Claude Code configuration as security-sensitive.

The following files and directories require careful review:

```text
.claude/hooks/
.claude/settings.json
.claude/agents/
.claude/skills/
.github/workflows/
.mcp.example.json
scripts/
.gitignore
SECURITY.md
```

Why:

* hooks can execute commands
* MCP configuration can connect to external services
* agents and skills can influence model behavior
* GitHub Actions can execute automation on pull requests
* `.gitignore` controls whether local secrets are protected from accidental commits

---

## Local-Only Files

The following files should not be committed:

```text
.mcp.json
CLAUDE.local.md
.claude/settings.local.json
.env
.env.*
*.pem
*.key
id_rsa
id_ed25519
secrets/
credentials/
```

The `.gitignore` file is configured to help prevent accidental commits of local configuration and secrets.

---

## Repository Safety Check

Before committing or opening a pull request, run:

```bash
chmod +x scripts/check-repo-safety.sh
./scripts/check-repo-safety.sh
```

Also validate shell scripts:

```bash
bash -n scripts/check-repo-safety.sh
find .claude/hooks -type f -name "*.sh" -print0 | xargs -0 -r bash -n
```

The safety check is designed to fail closed when it detects release-blocking issues such as:

* committed `.mcp.json`
* committed local Claude override files
* private key material
* secret-like patterns
* risky shell patterns in automation paths

This check is not a replacement for GitHub secret scanning or human review, but it provides a useful local and CI safety baseline.

---

## GitHub Actions

This repository includes a safety workflow:

```text
.github/workflows/repository-safety.yml
```

The workflow runs on:

* pull requests
* pushes to `main`

It validates:

* repository safety checks
* shell syntax for safety scripts
* shell syntax for Claude hooks

Recommended GitHub Actions settings for this repository:

```text
Workflow permissions: Read repository contents permission
Require approval for workflows from outside contributors
Do not expose repository secrets to fork pull requests
Disable GitHub Actions from creating or approving pull requests
```

---

## Recommended Public Repository Protections

For a public GitHub repository, enable branch protection or rulesets for `main`.

Recommended rules:

* require pull request before merge
* require at least one approval
* require Code Owner review
* require conversation resolution
* dismiss stale approvals after new commits
* block force pushes
* restrict branch deletion
* require repository safety workflow to pass

Also enable available GitHub security features:

* dependency graph
* Dependabot alerts
* Dependabot security updates
* secret scanning
* secret scanning push protection
* private vulnerability reporting, if available

---

## CODEOWNERS

This repository uses `CODEOWNERS` to require owner review for security-sensitive areas.

Recommended protected paths include:

```text
.github/
.github/workflows/
.claude/hooks/
.claude/settings.json
.claude/agents/
.claude/skills/
.mcp.example.json
scripts/
SECURITY.md
.gitignore
```

Changes to these files should be reviewed as security-sensitive changes.

---

## Getting Started

Clone the repository:

```bash
git clone https://github.com/desertfox33/claude-code-project-template.git
cd claude-code-project-template
```

Create local-only Claude notes:

```bash
cp CLAUDE.local.md.example CLAUDE.local.md
```

Create local-only Claude settings if needed:

```bash
cp .claude/settings.local.json.example .claude/settings.local.json
```

Create local MCP configuration only if needed:

```bash
cp .mcp.example.json .mcp.json
```

Review `.mcp.json` carefully before enabling any MCP server.

Run the repository safety check:

```bash
chmod +x scripts/check-repo-safety.sh
./scripts/check-repo-safety.sh
```

---

## Suggested Claude Code Usage

Examples:

```text
Use the code-review skill to review the current branch.
```

```text
Use the testing-patterns skill to identify missing tests for this change.
```

```text
Use the security-review skill to inspect .claude/hooks and GitHub Actions before merge.
```

```text
Use the pr-description skill to prepare a pull request summary with testing evidence and security impact.
```

---

## Pull Request Expectations

Every pull request should explain:

* what changed
* why it changed
* how it was tested
* whether Claude hooks, MCP, agents, skills, or GitHub Actions were modified
* security impact
* rollback considerations, if relevant

Before opening a pull request, run:

```bash
./scripts/check-repo-safety.sh
bash -n scripts/check-repo-safety.sh
find .claude/hooks -type f -name "*.sh" -print0 | xargs -0 -r bash -n
```

---

## Security Guidelines

Do not commit:

* credentials
* API keys
* tokens
* private keys
* session cookies
* `.env` files
* local MCP config
* local Claude override files
* private incident data
* confidential customer data
* private repository source code unless explicitly intended

Do not add automation that:

* runs destructive commands without approval
* exposes secrets to forked pull requests
* runs untrusted contributor code with elevated permissions
* downloads and executes remote scripts without review
* modifies production systems
* weakens branch protection or review controls

---

## Common Mistakes to Avoid

### Mistake 1: Committing `.mcp.json`

Commit `.mcp.example.json`, not `.mcp.json`.

`.mcp.json` belongs to your local machine or controlled environment.

---

### Mistake 2: Treating hooks as documentation

Hooks are executable code. Review them like production automation.

---

### Mistake 3: Using warning-only safety checks

Security checks should fail closed when they detect release-blocking findings.

A scanner that only prints warnings but exits successfully can allow unsafe changes into `main`.

---

### Mistake 4: Running public pull request code too freely

Public pull requests are untrusted input.

Do not expose secrets to fork PR workflows. Do not run unreviewed contributor scripts locally.

---

### Mistake 5: Assuming AI-generated changes are safe

AI-generated changes still require human review, testing, and security validation.

---

## Maintainer Checklist

Before publishing or merging major changes:

* [ ] `.mcp.json` is not committed.
* [ ] `CLAUDE.local.md` is not committed.
* [ ] `.claude/settings.local.json` is not committed.
* [ ] `.gitignore` blocks local and secret files.
* [ ] `scripts/check-repo-safety.sh` passes.
* [ ] Claude hook scripts pass `bash -n`.
* [ ] GitHub Actions workflow uses least privilege.
* [ ] CODEOWNERS covers security-sensitive paths.
* [ ] Branch protection or rulesets are enabled for `main`.
* [ ] Secret scanning and push protection are enabled.
* [ ] Pull request template includes security checks.
* [ ] Security-sensitive changes have been reviewed.

---

## Development Notes

This template is intentionally conservative.

Claude Code can improve productivity, but the repository should not rely on the model as the security boundary. Security boundaries should be enforced through:

* GitHub permissions
* branch protection
* CODEOWNERS
* least-privilege GitHub Actions
* local safety checks
* secret scanning
* human review
* careful MCP configuration
* deterministic hooks

---

## Contributing

Contributions are welcome through pull requests.

Before submitting a PR:

1. Run the repository safety check.
2. Validate shell scripts.
3. Do not commit local-only configuration.
4. Explain any changes to hooks, MCP examples, agents, skills, or workflows.
5. Include testing evidence.

See `CONTRIBUTING.md` for additional guidance.

---

## Security

Please do not report secrets, tokens, private logs, or sensitive details in public issues.

See `SECURITY.md` for responsible disclosure and repository safety expectations.

---

## References

* Claude Code documentation
* Model Context Protocol documentation
* GitHub Actions security guidance
* GitHub branch protection and rulesets
* GitHub secret scanning and push protection

