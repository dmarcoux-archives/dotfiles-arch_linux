#!/usr/bin/env bash

BACKUP_DIRS=(~/dotfiles/backup/$(hostname)/{pkgs,systemd_units,keys})

echo 'Create backup directories'
mkdir --parents ${BACKUP_DIRS[*]}

echo 'Generate list of official packages'
pacman -Qqen &> ${BACKUP_DIRS[0]}/pkgs.txt

echo 'Generate list of AUR packages'
pacman -Qqem &> ${BACKUP_DIRS[0]}/aur-pkgs.txt

echo 'Generate list of enabled systemd services'
systemctl list-unit-files --type=service --state=enabled --no-legend --no-pager | tr --squeeze-repeats ' ' | cut --delimiter=' ' --fields=1 &> ${BACKUP_DIRS[1]}/enabled_services.txt

# Keep this as documentation
# echo 'Generate list of masked systemd units'
# systemctl list-unit-files --all --state=masked --no-legend --no-pager | tr --squeeze-repeats ' ' | cut --delimiter=' ' --fields=1 &> ${BACKUP_DIRS[1]}/masked_units.txt

echo 'Backup GPG and SSH keys?'
select choice in "Yes" "No"; do
  case $choice in
    Yes ) echo 'Export GPG keys'
          gpg2 --export-secret-keys --armor --output ${BACKUP_DIRS[2]}/secrets.asc
          echo 'Export SSH keys'
          cp ~/.ssh/*id_rsa* ${BACKUP_DIRS[2]}
          echo 'Put keys in a tar archive'
          tar --create --directory=${BACKUP_DIRS[2]} --file=keys.tar secrets.asc *id_rsa*
          echo 'Encrypt the tar archive'
          # TODO: Finish this
          break ;;
    No ) break ;;
  esac
done
