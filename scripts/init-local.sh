#!/usr/bin/env bash
set -euo pipefail

[ -f CLAUDE.local.md ] || cp CLAUDE.local.md.example CLAUDE.local.md
[ -f .claude/settings.local.json ] || cp .claude/settings.local.json.example .claude/settings.local.json

echo "Local Claude files created. Review them before use."
