#!/usr/bin/env bash

# When changing this, do the same in restore_backup.sh
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
    Yes ) echo 'Export GPG keys and their trusts'
          gpg --export-secret-keys --armor --output ${BACKUP_DIRS[2]}/secrets.asc
          gpg --export-ownertrust > ${BACKUP_DIRS[2]}/otrust.txt

          echo 'Export SSH keys'
          cp ~/.ssh/*id_rsa* ${BACKUP_DIRS[2]}

          echo 'Put keys in a tar archive'
          $(cd ${BACKUP_DIRS[2]} && tar --create --file=keys.tar secrets.asc otrust.txt *id_rsa*)

          echo 'Encrypt the tar archive'
          $(cd ${BACKUP_DIRS[2]} && gpg --symmetric --cipher-algo=AES256 keys.tar)

          echo 'Remove exported GPG/SSH keys and the unencrypted tar archive'
          $(cd ${BACKUP_DIRS[2]} && rm secrets.asc otrust.txt *id_rsa* keys.tar)

          echo 'Reload GPG agent to clear the cached passphrase'
          gpg-connect-agent reloadagent /bye 1> /dev/null

          break ;;
    No ) break ;;
  esac
done
