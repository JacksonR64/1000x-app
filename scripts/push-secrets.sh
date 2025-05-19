#!/usr/bin/env bash
set -euo pipefail

# deduce "owner/repo" from the current origin URL
REPO=$(git remote get-url origin | sed -E 's#.*github.com[:/](.+)\.git#\1#')

echo "📦  Pushing non-empty vars from .env to $REPO …"
grep -v '^\s*#' .env | while IFS='=' read -r key value; do
  [[ -z "$value" ]] && continue         # skip blank lines
  echo " • $key"
  gh secret set "$key" -b"$value" --repo "$REPO" >/dev/null
done
echo "✅  Done."
