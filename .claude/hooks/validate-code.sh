#!/usr/bin/env bash
set -euo pipefail

# Project validation helper.
# Customize this script for the stack used in your repository.

if [ -f package.json ]; then
  npm test
elif [ -f pyproject.toml ] || [ -f pytest.ini ]; then
  pytest
elif [ -f go.mod ]; then
  go test ./...
else
  echo "No known test command detected. Add project validation to .claude/hooks/validate-code.sh"
fi
