#!/usr/bin/env bash
set -euo pipefail

# This script outputs the contents of the regular review issue, see ./github/workflows/review.yml

rev=$(git rev-parse HEAD)

echo "Because the documentation in this repository may slowly deviate from reality, this monthly issue is created to regularly review the files.

If you're pinged, please ensure that the relevant documentation matches reality.

- If that's not the case, please investigate how this happened and address this so it doesn't happen again.

  To mitigate the current inconsistency:
  - If a PR was merged without updating reality, update reality to match the new documentation, then post a comment in this issue with what was done.
  - If reality was updated without a PR, open a PR to update the documentation, then post a comment in this issue with a link to the PR.

- Once the documentation matches reality, tick the checkmark.

If all checkmarks are ticked, the issue can be closed.

## Code owners

These are all [current code owner entries](../tree/$rev/.github/CODEOWNERS):
"

# TODO: List all files in the repo, link to them directly and look up codeowners using some glob matching/codeowners library/CLI, warn for files without code owner
while read -r file users; do
  if [[ "$file" == "#" || "$file" == "" ]]; then
    continue
  fi
  echo "- [ ] \`$file\`: $users"
done < .github/CODEOWNERS