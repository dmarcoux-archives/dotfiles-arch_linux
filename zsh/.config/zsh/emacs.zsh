# If emacs is installed, set it up
if type emacs > /dev/null; then
  alias em='emacs'
  # Script from dotfiles/scripts, which is in the PATH
  alias emacs='emacs_client.sh'

  # Edit emacs' desktop file to launch emacs from an interactive shell, which will expand the alias defined above
  sudo sed -i 's/Exec=.*/Exec=emacs_client.sh %F/' /usr/share/applications/emacs.desktop
fi
