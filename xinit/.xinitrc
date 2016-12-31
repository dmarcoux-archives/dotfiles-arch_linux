# Loading .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Set keyboard layout
source ~/dotfiles/scripts/keyboard_layout.sh

# Start i3
exec i3
