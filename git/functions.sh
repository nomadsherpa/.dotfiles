# Git rebase master/main
# Rebase the current branch to the master/main even if there are uncommitted changes
unalias grbm
grbm() {
  # Check if there are any changes to stash
  if [ -n "$(git status --porcelain)" ]; then
    git stash push --include-untracked
    changes_stashed=true
  fi

  # Rebasing the current branch to the main branch
  git rebase $(git_main_branch)

  # Pop the stash if it was previously stashed
  if [ "$changes_stashed" = true ]; then
    git stash pop
  fi
}

# Git rebase interactive N
# Rebase the last N commits interactively
# $ grbin 11 # Rebase the last 11 commits
grbin() {
  grbi "HEAD~$1"
}
