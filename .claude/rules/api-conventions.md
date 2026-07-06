# API Conventions Rule

Use this rule when changing API routes, request/response schemas, clients, or integrations.

## API design

- Validate inputs at the boundary.
- Return predictable error shapes.
- Do not leak internal stack traces or sensitive details.
- Keep authentication and authorization checks explicit.
- Use idempotency where repeat requests can create duplicate state.
- Document breaking changes.

## Security review points

- What asset does the endpoint expose?
- Who is allowed to access it?
- What abuse path exists?
- What logs confirm successful and failed access?
- What rate limits or WAF controls are relevant?
