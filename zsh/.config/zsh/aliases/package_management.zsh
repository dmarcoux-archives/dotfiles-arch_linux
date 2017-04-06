alias -g pacman='sudo pacnanny'

# System update: Official packages, then AUR packages
alias sup='pacman --sync --refresh --sysupgrade && pacaur --update --devel --needed'

# Remove orphan packages
alias rop='xargs --arg-file=<(pacman --query --deps --unrequired --quiet) pacman --remove --nosave --recursive'
