# Set GPG TTY
export GPG_TTY=$(tty)

# Start gpg-agent if it is not already running
# From https://wiki.archlinux.org/index.php/GnuPG#SSH_agent
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent /bye >/dev/null 2>&1
fi

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null
