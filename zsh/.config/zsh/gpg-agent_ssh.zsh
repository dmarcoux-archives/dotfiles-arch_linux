# Start gpg-agent if it is not already running
# From https://wiki.archlinux.org/index.php/GnuPG#SSH_agent
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent /bye >/dev/null 2>&1
fi
