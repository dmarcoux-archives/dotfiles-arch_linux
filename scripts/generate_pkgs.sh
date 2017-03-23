#!/usr/bin/env bash
pacman -Qqen &> ~/dotfiles/pkgs/pkgs.txt
pacman -Qqem &> ~/dotfiles/pkgs/aur-pkgs.txt
