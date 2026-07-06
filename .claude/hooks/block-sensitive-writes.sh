#!/usr/bin/env bash
set -euo pipefail

# Defensive starter hook.
# Blocks obvious writes to local secrets and private key material.
# Claude Code passes hook event JSON on stdin. We avoid jq so this remains portable.

payload="$(cat || true)"

blocked_patterns=(
  ".env"
  ".env."
  "id_rsa"
  "id_ed25519"
  ".pem"
  ".p12"
  ".pfx"
)

for pattern in "${blocked_patterns[@]}"; do
  if printf '%s' "$payload" | grep -Fq "$pattern"; then
    echo "Blocked write: path appears to target a secret or private key file: $pattern" >&2
    exit 2
  fi
done

exit 0
