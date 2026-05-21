#!/usr/bin/env bash
#MISE description="Rebase exercise branches onto main"
set -Eeuo pipefail

branches='
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
'

trash_untracked_exercise_dirs() {
  for path in counter minisocial; do
    if [ -e "$path" ] && [ -z "$(git ls-files -- "$path")" ]; then
      echo "Moving untracked $path left by branch switching to trash."
      trash "$path"
    fi
  done
}

require_clean_worktree() {
  if [ -n "$(git status --porcelain)" ]; then
    echo 'Working tree is not clean. Commit or stash changes before rebasing exercise branches.' >&2
    exit 1
  fi
}

require_branch() {
  if ! git show-ref --verify --quiet "refs/heads/$1"; then
    echo "Missing local branch: $1" >&2
    exit 1
  fi
}

trash_untracked_exercise_dirs
require_clean_worktree

initial_branch="$(git branch --show-current)"

if [ -z "$initial_branch" ]; then
  echo 'Cannot rebase from a detached HEAD.' >&2
  exit 1
fi

require_branch main
require_branch 00-counter

for branch in $branches; do
  require_branch "$branch"
done

echo '==> 00-counter'
git switch 00-counter
trash_untracked_exercise_dirs
git rebase main
require_clean_worktree

previous_branch=''
previous_old_tip=''

for branch in $branches; do
  old_tip="$(git rev-parse "$branch")"

  echo "==> $branch"
  git switch "$branch"
  trash_untracked_exercise_dirs

  if [ -z "$previous_branch" ]; then
    git rebase main
  else
    git rebase --onto "$previous_branch" "$previous_old_tip"
  fi

  require_clean_worktree
  previous_branch="$branch"
  previous_old_tip="$old_tip"
done

git switch "$initial_branch"
trash_untracked_exercise_dirs
