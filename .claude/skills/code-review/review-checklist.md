# Code Review Checklist

## Security

- Authentication and authorization are explicit.
- User input is validated.
- Secrets are not committed, logged, or exposed.
- Sensitive data is masked in logs.
- External calls have timeouts and error handling.
- Permissions are least privilege.

## Reliability

- Failure paths are handled.
- Retries are safe and bounded.
- Duplicate requests do not create duplicate state.
- Long-running work is observable.
- Rollback impact is understood.

## Testing

- New behavior has tests.
- Bug fixes include regression coverage.
- Authorization and negative paths are tested.
- CI commands are documented.
