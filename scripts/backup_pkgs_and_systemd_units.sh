#!/usr/bin/env bash

BACKUP_DIRS=(~/dotfiles/backup/$(hostname)/{pkgs,systemd_units})

echo 'Create backup directories'
mkdir --parents ${BACKUP_DIRS[@]}

echo 'Generate list of official packages'
pacman -Qqen &> ${BACKUP_DIRS[0]}/pkgs.txt

echo 'Generate list of AUR packages'
pacman -Qqem &> ${BACKUP_DIRS[0]}/aur-pkgs.txt

echo 'Generate list of enabled systemd services'
systemctl list-unit-files --type=service --state=enabled --no-legend --no-pager | tr --squeeze-repeats ' ' | cut --delimiter=' ' --fields=1 &> ${BACKUP_DIRS[1]}/enabled_services.txt

# Keep this as documentation
# echo 'Generate list of masked systemd units'
# systemctl list-unit-files --all --state=masked --no-legend --no-pager | tr --squeeze-repeats ' ' | cut --delimiter=' ' --fields=1 &> ${BACKUP_DIRS[1]}/masked_units.txt
