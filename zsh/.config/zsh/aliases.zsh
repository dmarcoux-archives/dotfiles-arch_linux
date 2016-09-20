#----- Default options
alias ls='ls --all --color=auto --format=horizontal --group-directories-first'
alias mkdir='mkdir --parents --verbose' # No error when directory already exists, more feedback
alias ping='ping -c 3' # Ping with 3 packets
alias wget='wget --continue' # Always resume download if partial file found
alias history='history 1' # Retrieve all history (useful when using piping the output to grep/ag/whatever)
alias yank='yank -- xsel -b' # Yank to the clipboard, as opposed to the default primary clipboard

#----- systemd
alias sysd='systemctl'
alias shutdown='systemctl poweroff'
alias reboot='systemctl reboot'

#----- Safety nets
# Prompt when removing more than 3 files at a time and do not remove '/'
alias rm='rm --interactive=once --preserve-root'
# Fail to operate recursively on '/'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

#----- Confirmation
alias mv='mv --interactive'
alias cp='cp --interactive'
alias ln='ln --interactive'

#----- Package management and system upgrades
alias pacman='sudo pacman'
alias aura='sudo aura'
alias sup='pacman -Syu --noconfirm && aura -Akyu --noconfirm'

#----- Databases
alias mysql='mysql --auto-vertical-output' # Automatically switch to vertical output mode
alias mycli='mycli --auto-vertical-output' # if the result is wider than the terminal width

#----- cURL
alias curljson='curl --verbose --header "Content-Type: application/json" --data' # Then add '{"abc":"123","def":"'my text'"}' http://whatever.com

#----- Docker and Docker Compose
alias doc='docker'
alias doccom='docker-compose'

#----- Vim
alias v='vim'
alias vi='vim'

#----- Git
alias g='git'
alias gbra='git branch'
alias gchp='git cherry-pick'
alias gcko='git checkout'
alias gcom='git commit'
alias gcoma='git commit --amend'
alias gdi='git diff'
alias gdis='git diff --staged'
alias glo='git log --oneline'
alias gpu='git push'
alias gpuf='git push --force-with-lease'
alias gpure='git pull --rebase --autostash'
alias greb='git rebase'
alias grebc='git rebase --continue'
alias grebi='git rebase -i'
alias gsh='git show'
alias gsta='git status'

#----- Clipboard copy/paste
alias cbc='xsel --clipboard --input'
alias cbp='xsel --clipboard --output'

#----- File manager
alias ra='ranger'
