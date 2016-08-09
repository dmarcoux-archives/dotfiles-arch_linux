#----- Default options
alias ls='ls --all --color=auto --format=horizontal --group-directories-first'
alias mkdir='mkdir --parents --verbose' # No error when directory already exists, more feedback
alias ping='ping -c 3' # Ping with 3 packets
alias wget='wget --continue' # Always resume download if partial file found
alias history='history 1' # Retrieve all history (useful when using piping the output to grep/ag/whatever)

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

#----- Ruby
alias b='bundle'
alias bi='bundle install'
alias be='noglob bundle exec' # Disable zsh glob operators with noglob (mostly for rake)
alias bl='bundle list'
alias -g rcop='rubocop' # Global alias
alias rcophtml='rubocop --format html --out ./tmp/rubocop.html'

#----- cURL
alias curljson='curl --verbose --header "Content-Type: application/json" --data' # Then add '{"abc":"123","def":"'my text'"}' http://whatever.com

#----- Docker and Docker Compose
alias doc='docker'
alias doccom='docker-compose'

#----- Vim
alias v='vim'
alias vi='vim'
