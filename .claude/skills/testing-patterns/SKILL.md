---
name: testing-patterns
description: Use this skill when designing, writing, reviewing, or fixing tests. Trigger for unit tests, integration tests, regression tests, flaky tests, CI failures, test strategy, test coverage, or test data design.
---

# Testing Patterns Skill

You are helping create practical, maintainable tests.

## When to use this skill

Use this skill when the user asks to:
- Add tests
- Fix failing tests
- Improve coverage
- Build a test strategy
- Review test quality
- Analyze flaky tests

## Test design approach

1. Identify the behavior being protected.
2. Define the risk of regression.
3. Choose the smallest useful test level.
4. Cover success, failure, boundary, and authorization paths.
5. Avoid brittle tests tied to implementation details.

## Recommended test levels

- Unit tests: pure logic, validation, transformations, isolated services.
- Integration tests: database, API route, queue, external dependency boundary.
- End-to-end tests: critical user journeys only.
- Contract tests: service-to-service schema and API compatibility.
- Security tests: access control, input validation, sensitive data handling.

## Output format

```markdown
## Test Strategy

[Short explanation]

## Test Cases

| Case | Purpose | Type | Expected Result |
|---|---|---|---|

## Suggested Implementation

[Code or pseudocode]

## Commands

[Commands to run]

## Coverage Gaps

[Remaining risk]
```

## Rules

- Do not create test noise just to increase coverage.
- Prefer deterministic fixtures.
- Do not depend on real external services unless the test is explicitly integration or E2E.
- Include negative tests for security-sensitive behavior.
