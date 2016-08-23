# If termite is installed, set it up
if type termite > /dev/null; then
  # From https://wiki.archlinux.org/index.php/Termite#Ctrl.2BShift.2Bt
  # With this, the keybinding Ctrl-Shift-T works (which opens a terminal in the current working directory)
  source /etc/profile.d/vte.sh
fi
