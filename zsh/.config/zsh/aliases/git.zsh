alias g='git'
alias ga='git add'
alias gbra='git branch'
alias gchp='git cherry-pick'
alias gcko='git checkout'
alias gckob='git checkout -b'
# Select a branch with fzf and switch to it
alias gckof='git branch | fzf | cut --characters=3- | xargs --no-run-if-empty git checkout'
alias gclo='git clone'
alias gcom='git commit'
alias gcoma='git commit --amend'
alias gdi='git diff'
alias gdis='git diff --staged'
# Output: abbreviated_commit_hash (%h) | commit_message (%s) | author_name (%an, in yellow) | commit_date_relative (%cr, in green)
alias glo='git log --pretty=format:"%h %C(bold)|%C(reset) %s %C(bold)|%C(reset) %C(yellow)%an%C(reset) %C(bold)|%C(reset) %C(green)%cr%C(reset)"'
# Copy a string from the output of the glo alias (a commit hash for example)
alias gloy='glo | yank'
alias gmer='git merge'
# Select a branch with fzf and merge it in the current branch
alias gmerf='git branch | fzf | cut --characters=3- | xargs --no-run-if-empty git merge'
alias gpu='git push'
alias gpuf='git push --force-with-lease'
alias gpure='git pull --rebase --autostash'
alias greb='git rebase'
alias grebc='git rebase --continue'
# From the output of the glo alias, select with fzf the commit hash to rebase on
# TODO: Improve this to use xargs. It's not possible right now as xargs on Linux doesn't support -o, which prevent Vim from complaining about the input
alias grebi='git rebase --interactive $(glo | fzf --ansi --no-sort | cut --delimiter=" " --fields=1)'
alias gres='git reset'
alias grev='git revert'
# Select a commit with fzf and revert it
alias grevf='glo | fzf --ansi --no-sort | cut --delimiter=" " --fields=1 | xargs --no-run-if-empty git revert'
alias gsh='git show'
alias gst='git status'
alias gsta='git stash'
