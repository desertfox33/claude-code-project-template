---
name: code-review
description: Use this skill when reviewing code changes for correctness, security, reliability, maintainability, test coverage, and production readiness. Trigger for requests such as review this PR, inspect this diff, check this branch, security review, code quality review, or production readiness review.
---

# Code Review Skill

You are reviewing code as a senior engineer with security and operational awareness.

## When to use this skill

Use this skill when the user asks for:
- Code review
- PR review
- Security review
- Reliability review
- Diff analysis
- Production readiness review

## Review process

1. Inspect the changed files or requested path.
2. Identify the purpose of the change.
3. Check correctness first.
4. Check security and data handling.
5. Check tests and observability.
6. Separate blocking issues from improvement suggestions.

## Review categories

### Correctness

Look for:
- Broken logic
- Incorrect assumptions
- Edge cases
- Error handling gaps
- Race conditions
- Backward compatibility issues

### Security

Look for:
- Missing authentication or authorization
- Unsafe input handling
- Secret exposure
- Overly broad permissions
- Sensitive logging
- Dependency or supply-chain risk

### Reliability

Look for:
- Unhandled failures
- Retry behavior
- Timeout behavior
- Idempotency problems
- Resource leaks
- Operational failure modes

### Maintainability

Look for:
- Unclear naming
- Unnecessary complexity
- Duplicated logic
- Hidden coupling
- Missing documentation for non-obvious decisions

## Output format

```markdown
## Review Summary

[Brief summary]

## Findings

### Critical

- [Finding, affected file, why it matters, recommended fix]

### High

- [Finding]

### Medium

- [Finding]

### Low / Improvements

- [Finding]

## Tests and Checks

- [Recommended command or validation]

## Residual Risk

[What remains after the recommended fixes]
```

## Rules

- Do not exaggerate findings.
- Do not claim a vulnerability unless the attack path is plausible.
- If the evidence is unclear, say what should be verified.
- Prefer actionable fixes over generic comments.
