#!/usr/bin/env bash

mkdir --parents pkgs/$(hostname)

# Generate list of official packages
pacman -Qqen &> ~/dotfiles/pkgs/$(hostname)/pkgs.txt

# Generate list of AUR packages
pacman -Qqem &> ~/dotfiles/pkgs/$(hostname)/aur-pkgs.txt
