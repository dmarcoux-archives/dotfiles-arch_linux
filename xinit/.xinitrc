# Loading .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Set the keyboard layout to Canadian Multilingual with the following options:
# Caps Lock key is now acting as Left Control key
# Key combination RightAlt + 4 produces €
setxkbmap -layout ca -variant multi -option ctrl:nocaps eurosign:4

# I use a keyboard layout where I hold down AltGr to type |. This avoids issues "command not found" after typing a |
# Credits: http://stackoverflow.com/questions/19999712/after-a-pipe-the-command-is-considered-prefixed-with-a-space
setxkbmap -option "nbsp:none"

# Disable Left Control key
xmodmap -e "keycode 37="

# Start i3
exec i3
