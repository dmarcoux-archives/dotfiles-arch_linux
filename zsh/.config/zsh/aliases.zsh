# Default options
alias ls='ls -a --color=auto' # Show all files and color the output
alias mkdir='mkdir -pv' # No error when directory already exists, more feedback
alias ping='ping -c 3' # Ping with 3 packets
alias wget='wget -c' # Always resume download if partial file found
alias history='history 1' # Retrieve all history (useful when using with grep)

# General shortcuts
alias c=clear
alias up=upup

# systemctl shortcurts
alias sa='systemctl start'
alias so='systemctl stop'
alias se='systemctl enable'
alias sd='systemctl disable'

# Safety nets
# prompt when removing more than 3 files at a time and do not remove '/'
alias rm='rm -I --preserve-root'

# Confirmation
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Fail to operate recursively on '/'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Package management and system upgrades
alias pacman="sudo pacman"
alias aura="sudo aura"
alias sup="pacman -Syu --noconfirm && aura -Akyu --noconfirm"

# Databases
alias start-psql="systemctl start postgresql.service"
alias stop-psql="systemctl stop postgresql.service"

# Ruby
alias b="bundle"
alias bi="bundle install"
alias be="bundle exec"
alias bl="bundle list"
