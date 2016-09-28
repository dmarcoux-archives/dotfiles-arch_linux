# Loading .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Set the keyboard layout to Canadian Multilingual
setxkbmap -layout ca -variant multi

# Loading .Xmodmap
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# Start i3
exec i3
