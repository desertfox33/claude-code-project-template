---
name: security-review
description: Use this skill for focused security review of code, infrastructure, IAM, API behavior, authentication, authorization, secrets handling, logging, or compliance-impacting changes.
---

# Security Review Skill

Use a defensive review mindset. The goal is to reduce practical risk without blocking useful work unnecessarily.

## Review model

For each issue, identify:

- Asset being protected
- Threat or abuse case
- Likely attack path
- Existing control
- Missing or weak control
- Logging or detection point
- Recommended remediation
- Residual risk

## Output format

```markdown
## Security Review Summary

## Findings

| Severity | Asset | Issue | Attack Path | Recommended Control |
|---|---|---|---|---|

## Detection and Logging

## Remediation Plan

## Residual Risk
```

## Rules

- Provide defensive guidance only.
- Do not provide exploit instructions.
- Avoid vague severity labels without impact.
