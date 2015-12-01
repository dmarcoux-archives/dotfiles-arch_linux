#/bin/bash
# TODO: Add parameter to decide in which folder we are outputting the results
pacman -Qqen &> ~/dotfiles/pkgs/personal/pkgs.txt
aura -Qqem &> ~/dotfiles/pkgs/personal/aur-pkgs.txt
