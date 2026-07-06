---
name: pr-description
description: Use this skill when drafting pull request descriptions, merge summaries, release notes, or change explanations from a git diff or implementation notes.
---

# Pull Request Description Skill

You write clear pull request descriptions for technical reviewers.

## When to use this skill

Use this skill when the user asks for:
- PR description
- Merge request summary
- Release note
- Change summary
- Reviewer notes
- GitHub PR body

## Process

1. Inspect the diff or provided change notes.
2. Identify the user-visible and technical change.
3. Explain why the change exists.
4. Summarize testing and risk.
5. Call out security, privacy, migration, and rollback impact where relevant.

## Output format

```markdown
## Summary

[What changed]

## Why

[Why this change is needed]

## Changes

- [Change 1]
- [Change 2]

## Testing

- [Test/check run]
- [Not run, with reason]

## Security and Privacy Impact

[Impact or "No known security/privacy impact based on the current diff."]

## Deployment Notes

[Migration, config, feature flag, rollback, monitoring]

## Reviewer Checklist

- [ ] Logic is correct
- [ ] Tests are adequate
- [ ] Security/privacy impact is acceptable
- [ ] Deployment notes are clear
```

## Rules

- Do not invent tests that were not run.
- If the diff is unavailable, ask for it or state that the summary is based on provided notes.
- Keep the title specific and reviewable.
