#!/usr/bin/env bash
set -euo pipefail

fail=0

report() {
  echo "ERROR: $*" >&2
  fail=1
}

warn() {
  echo "WARN: $*" >&2
}

# Files that should never be committed to this public template.
blocked_paths=(
  ".mcp.json"
  "CLAUDE.local.md"
  ".claude/settings.local.json"
  ".env"
)

for path in "${blocked_paths[@]}"; do
  if [ -e "$path" ]; then
    report "Local-only or sensitive file is committed/present: $path"
  fi
done

# Private key and credential-like files.
while IFS= read -r -d '' file; do
  report "Private-key or credential-like file found: $file"
done < <(
  find . \
    -path ./.git -prune -o \
    \( -name "*.pem" -o -name "*.key" -o -name "*.p12" -o -name "*.pfx" -o -name "id_rsa" -o -name "id_ed25519" \) \
    -print0
)

# Obvious secret markers. This is not a replacement for GitHub secret scanning.
if git grep -nE '(AKIA[0-9A-Z]{16}|BEGIN (RSA|OPENSSH|EC|DSA)? ?PRIVATE KEY|ghp_[A-Za-z0-9_]{20,}|GITHUB_TOKEN=|AWS_SECRET_ACCESS_KEY=)' -- . ':!.git' >/tmp/repo-safety-findings.txt 2>/dev/null; then
  cat /tmp/repo-safety-findings.txt >&2
  report "Potential secret-like content found."
fi

# Risky shell patterns in automation.
if git grep -nE 'curl .*\| *(sh|bash)|wget .*\| *(sh|bash)|rm -rf /|chmod 777|sudo ' -- .claude scripts .github 2>/dev/null; then
  report "Risky shell pattern found in automation paths."
fi

if [ "$fail" -ne 0 ]; then
  echo "Repository safety check failed." >&2
  exit 1
fi

echo "Repository safety check passed."
