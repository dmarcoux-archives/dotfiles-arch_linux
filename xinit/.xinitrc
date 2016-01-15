# Loading .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Set the keyboard layout to Canadian Multilingual with the option RightAlt+4 = €
setxkbmap -layout ca -variant multi -option eurosign:4

# Start i3
exec i3
