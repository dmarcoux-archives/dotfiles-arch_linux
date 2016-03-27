#----- Default options
alias ls='ls -a --color=auto' # Show all files and color the output
alias mkdir='mkdir -pv' # No error when directory already exists, more feedback
alias ping='ping -c 3' # Ping with 3 packets
alias wget='wget -c' # Always resume download if partial file found
alias history='history 1' # Retrieve all history (useful when using piping the output to grep/ag/whatever)

#----- systemd
alias sa='systemctl start'
alias so='systemctl stop'
alias se='systemctl enable'
alias sd='systemctl disable'
alias soff='systemctl poweroff'
alias sreb='systemctl reboot'

#----- Safety nets
# prompt when removing more than 3 files at a time and do not remove '/'
alias rm='rm -I --preserve-root'

#----- Confirmation
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

#----- Fail to operate recursively on '/'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

#----- Package management and system upgrades
alias pacman='sudo pacman'
alias aura='sudo aura'
alias sup='pacman -Syu --noconfirm && aura -Akyu --noconfirm'

#----- Databases
alias sa-psql='systemctl start postgresql.service'
alias so-psql='systemctl stop postgresql.service'
alias sa-mysql='systemctl start mysqld.service'
alias so-mysql='systemctl stop mysqld.service'

#----- Ruby
alias b='bundle'
alias bi='bundle install'
alias be='noglob bundle exec' # Disable zsh glob operators with noglob (mostly for rake)
alias bl='bundle list'
alias -g rcop='rubocop' # Global alias
alias rcophtml='rubocop -f html -o ./tmp/rubocop.html'

#----- cURL
alias curljson='curl -H "Content-Type: application/json" --data' # Then add '{"abc":"123","def":"'my text'"}' http://whatever.com

#----- Docker and Docker Compose
alias doc='docker'
alias doccom='docker-compose'
