alias pacman='sudo pacman'

# System update: Official packages, then AUR packages
alias sup='pacman --sync --refresh --sysupgrade && pacaur --update --devel --needed'
