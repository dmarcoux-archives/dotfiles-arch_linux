alias pacman='sudo pacman'

# System update: Official packages, then AUR packages
alias sup='pacman --sync --refresh --sysupgrade && pacaur --update --devel --needed'

# Remove orphan packages
alias rop='xargs --arg-file=<(sudo pacman --query --deps --unrequired --quiet) sudo pacman --remove --nosave --recursive'
