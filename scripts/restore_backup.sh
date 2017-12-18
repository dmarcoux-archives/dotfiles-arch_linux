#!/usr/bin/env bash

# Same as in backup.sh
BACKUP_DIRS=(~/dotfiles/backup/$(hostname)/{pkgs,systemd_units,keys})

echo 'Restore GPG and SSH keys?'
select choice in "Yes" "No"; do
  case $choice in
    Yes ) DECRYPT_TRIES=3
          TRIES=0

          echo "Decrypting encrypted tar archive (Maximum $DECRYPT_TRIES tries)"
          # Until X unsuccessful tries OR tar archive successfully decrypted
          until [ $TRIES -eq $DECRYPT_TRIES ] || [ -e ${BACKUP_DIRS[2]}/keys.tar ]; do
            gpg --quiet --output ${BACKUP_DIRS[2]}/keys.tar --decrypt ${BACKUP_DIRS[2]}/keys.tar.gpg

            echo 'Reloading GPG agent to clear the cached passphrase'
            gpg-connect-agent reloadagent /bye 1> /dev/null;

            TRIES=$((TRIES + 1))
          done

          if [ ! -e ${BACKUP_DIRS[2]}/keys.tar ]; then
            echo 'Failed to decrypt tar archive. Exiting...'
            break
          fi

          echo 'Extracting GPG and SSH keys from unencrypted tar archive'
          $(cd ${BACKUP_DIRS[2]} && tar xvf keys.tar 1> /dev/null)

          echo 'Restoring GPG keys and their trusts'
          gpg --import ${BACKUP_DIRS[2]}/secrets.asc
          gpg --import-ownertrust ${BACKUP_DIRS[2]}/otrust.txt

          echo 'Restoring SSH keys'
          cp ${BACKUP_DIRS[2]}/*id_rsa* ~/.ssh/

          echo 'Removing exported GPG/SSH keys and the unencrypted tar archive'
          $(cd ${BACKUP_DIRS[2]} && rm secrets.asc otrust.txt *id_rsa* keys.tar)

          break ;;
    No ) break ;;
  esac
done
