# Claude Project Instructions

This file is loaded at the start of every Claude Code session for this repository.

## Project identity

Project owner: desertfox33  
Repository: claude-code-project-template  
Primary purpose: reusable Claude Code project structure for software, documentation, DevSecOps, and AI-assisted engineering workflows.

## Operating principles

- Prefer small, reviewable changes.
- Explain assumptions before making broad changes.
- Do not rewrite unrelated files.
- Do not remove security controls unless explicitly requested.
- Run relevant checks after code changes when a test or lint command is available.
- Treat generated code as draft until reviewed by a human.
- Never place secrets, tokens, private keys, customer data, or credentials in committed files.

## Architecture context

This repository is a template. It is designed to be copied into real projects and adapted.

Use these locations consistently:

- `.claude/rules/` for reusable project rules
- `.claude/commands/` for custom slash commands
- `.claude/skills/` for auto-triggered task skills
- `.claude/agents/` for specialized subagents
- `.claude/hooks/` for deterministic enforcement scripts
- `.claude/memory/` for project decisions and persistent context
- `.claude/workflows/` for multi-step task playbooks

## Coding conventions

- Keep logic simple and explicit.
- Prefer readable names over clever abstractions.
- Include tests for changed behavior where practical.
- For security-sensitive changes, call out the asset, threat, control, detection point, and residual risk.
- For infrastructure changes, call out IAM, logging, network exposure, cost, and rollback impact.

## Git behavior

Before committing or preparing a PR:

1. Review the diff.
2. Confirm no secrets or local-only files are staged.
3. Run available tests or explain why they were not run.
4. Produce a clear summary of user-facing and technical changes.

## When to use skills

Use `.claude/skills/code-review` when the task is about reviewing code, security, reliability, or maintainability.

Use `.claude/skills/testing-patterns` when the task is about test design, missing coverage, test failures, fixtures, or CI quality.

Use `.claude/skills/pr-description` when the task is about writing a pull request description, release note, merge summary, or change narrative.

Use `.claude/skills/security-review` when the task is security-sensitive.

## Human review rule

Claude can assist with analysis, drafting, refactoring, and checks, but humans own final approval for production changes.
