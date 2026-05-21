#!/usr/bin/env bash
#MISE description="Push main and exercise branches to origin"
#USAGE flag "--dry-run" help="Preview git pushes without updating remote branches"
set -Eeuo pipefail

exercise_branches=(
  00-counter
  01-timelinepage
  02-postcard
  03-themedata
  04-addpost
  05-riverpod
  06-postentity
  07-getpostfeed
  08-composepage
  09-router
  10-sign-and-post
  11-widgettest
)

require_clean_worktree() {
  if [ -n "$(git status --porcelain)" ]; then
    echo 'Working tree is not clean. Commit or stash changes before pushing exercise branches.' >&2
    exit 1
  fi
}

require_branch() {
  if ! git show-ref --verify --quiet "refs/heads/$1"; then
    echo "Missing local branch: $1" >&2
    exit 1
  fi
}

push_options=()

if [ "${usage_dry_run:-false}" = true ]; then
  push_options+=(--dry-run)
fi

require_clean_worktree
require_branch main
git remote get-url origin >/dev/null

for branch in "${exercise_branches[@]}"; do
  require_branch "$branch"
done

git push "${push_options[@]}" origin main
git push "${push_options[@]}" --force-with-lease origin "${exercise_branches[@]}"
