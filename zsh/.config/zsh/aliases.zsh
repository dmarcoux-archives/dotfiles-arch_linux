# Default options
alias ls='ls -a --color=auto' # Show all files and color the output
alias mkdir='mkdir -pv' # No error when directory already exists, more feedback
alias ping='ping -c 3' # Ping with 3 packets
alias wget='wget -c' # Always resume download if partial file found

# Shortcuts
alias c=clear
alias ..='cd ..'
alias ...='cd ../..'

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

# Package management
alias pacman="sudo pacman"
alias aura="sudo aura"
alias sup="pacman -Syu && aura -Akyu"

# Databases
alias start-psql="systemctl start postgresql.service"
alias stop-psql="systemctl stop postgresql.service"
