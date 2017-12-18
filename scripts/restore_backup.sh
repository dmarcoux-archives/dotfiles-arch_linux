#!/usr/bin/env bash

# Same as in backup.sh
BACKUP_DIRS=(~/dotfiles/backup/$(hostname)/{pkgs,systemd_units,keys})

echo 'Restore GPG and SSH keys?'
select choice in "Yes" "No"; do
  case $choice in
    Yes ) echo 'Decrypt encrypted tar archive'
          $(cd ${BACKUP_DIRS[2]} && gpg --quiet --output keys.tar --decrypt keys.tar.gpg)

          echo 'Reload GPG agent to clear the cached passphrase'
          gpg-connect-agent reloadagent /bye 1> /dev/null

          echo 'Extract GPG and SSH keys from unencrypted tar archive'
          $(cd ${BACKUP_DIRS[2]} && tar xvf keys.tar 1> /dev/null)

          echo 'Restore GPG keys'
          gpg2 --import ${BACKUP_DIRS[2]}/secrets.asc
          # Get the key id (2E...4A from example below) and trust it
          # gpg: key 2E558BC282FA5A4A: "Dany Marcoux <danymarcoux@gmail.com>" not changed

          echo 'Restore SSH keys'
          cp ${BACKUP_DIRS[2]}/*id_rsa* ~/.ssh/

          echo 'Remove exported GPG/SSH keys and tar archives'
          $(cd ${BACKUP_DIRS[2]} && rm secrets.asc *id_rsa* keys.tar{,.gpg})

          break ;;
    No ) break ;;
  esac
done
