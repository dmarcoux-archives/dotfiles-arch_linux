# Loading .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Set the keyboard layout to Canadian Multilingual with the following options:
# Caps Lock key is now acting as Left Control key
# Key combination RightAlt + 4 produces €
setxkbmap -layout ca -variant multi -option ctrl:nocaps eurosign:4

# Disable Left Control key
xmodmap -e "keycode 37="

# Start i3
exec i3
