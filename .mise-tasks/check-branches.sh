#!/usr/bin/env bash
#MISE description="Check every exercise branch"
set -Eeufo pipefail

branches='
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
'

trash_untracked_exercise_dirs() {
  for path in counter minisocial; do
    if [ -e "$path" ] && [ -z "$(git ls-files -- "$path")" ]; then
      echo "Moving untracked $path left by branch switching to trash."
      trash "$path"
    fi
  done
}

trash_untracked_exercise_dirs

if [ -n "$(git status --porcelain)" ]; then
  echo 'Working tree is not clean. Commit or stash changes before checking exercise branches.' >&2
  exit 1
fi

initial_branch="$(git branch --show-current)"

for branch in $branches; do
  echo "==> $branch"
  git switch "$branch"
  trash_untracked_exercise_dirs

  case "$branch" in
  00-counter) app_dir='counter' ;;
  *) app_dir='minisocial' ;;
  esac

  if [ ! -d "$app_dir" ]; then
    echo "Missing Flutter app directory: $app_dir" >&2
    exit 1
  fi

  (
    cd "$app_dir"
    flutter pub get
    flutter analyze
    flutter test
  )

  if [ -n "$(git status --porcelain)" ]; then
    echo "Checking $branch changed tracked files. Commit dependency updates before continuing." >&2
    exit 1
  fi
done

git switch "$initial_branch"
trash_untracked_exercise_dirs
