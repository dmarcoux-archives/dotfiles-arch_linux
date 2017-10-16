# hub: Wrapper for git to Improve GitHub Workflow
alias git='hub'

ealias g='git'
ealias ga='git add'
ealias gbra='git branch'
ealias gchp='git cherry-pick'
ealias gcko='git checkout'
ealias gckob='git checkout -b'
# Select a branch with fzf and switch to it
alias gckof='git branch | fzf | cut --characters=3- | xargs --no-run-if-empty git checkout'
ealias gclo='git clone'
ealias gcom='git commit'
ealias gcoma='git commit --amend'
ealias gdi='git diff'
ealias gdis='git diff --staged'
# Output: abbreviated_commit_hash (%h) | commit_message (%s) | author_name (%an, in yellow) | commit_date_relative (%cr, in green)
alias glo='git log --pretty=format:"%h %C(bold)|%C(reset) %s %C(bold)|%C(reset) %C(yellow)%an%C(reset) %C(bold)|%C(reset) %C(green)%cr%C(reset)"'
# Copy a string from the output of the glo alias (a commit hash for example)
alias gloy='glo | yank'
ealias gmer='git merge'
# Select a branch with fzf and merge it in the current branch
alias gmerf='git branch | fzf | cut --characters=3- | xargs --no-run-if-empty git merge'
ealias gpu='git push'
ealias gpuf='git push --force-with-lease'
ealias gpure='git pull --rebase --autostash'
ealias greb='git rebase'
ealias grebc='git rebase --continue'
# From the output of the glo alias, select with fzf the commit hash to rebase on
# TODO: Improve this to use xargs. It's not possible right now as xargs on Linux doesn't support -o, which prevent Vim from complaining about the input
alias grebi='git rebase --interactive $(glo | fzf --ansi --no-sort | cut --delimiter=" " --fields=1)'
ealias gres='git reset'
ealias grev='git revert'
# Select a commit with fzf and revert it
alias grevf='glo | fzf --ansi --no-sort | cut --delimiter=" " --fields=1 | xargs --no-run-if-empty git revert'
ealias gsh='git show'
# Select a commit with fzf and show it
alias gshf='glo | fzf --ansi --no-sort | cut --delimiter=" " --fields=1 | xargs --no-run-if-empty git show'
ealias gst='git status'
ealias gsta='git stash'
