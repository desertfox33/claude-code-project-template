# Testing Standard Rule

Use this rule when writing or reviewing tests.

## Test quality

- Test behavior, not implementation details.
- Cover success, failure, boundary, and authorization cases.
- Prefer deterministic fixtures.
- Avoid tests that rely on external services unless clearly marked as integration tests.
- Add regression tests for bug fixes.

## Failure analysis

When a test fails:
1. Read the assertion and failure output.
2. Identify whether the test or product code is wrong.
3. Make the smallest valid fix.
4. Re-run the narrow test first, then the broader suite if practical.
