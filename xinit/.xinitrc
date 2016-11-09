# Loading .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Set the keyboard layout to Canadian Multilingual
setxkbmap -layout ca -variant multi

# Customize the keyboard layout even more
# Summary (details in .Xmodmap):
# - Disable Left Control
# - Caps Lock acts as Left Control
# - AltGr + 4 produces €
# - AltGr + Space produces a normal space
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# Caps Lock acts as Left Control when pressed and held (set within .Xmodmap)
# Caps Lock acts as Escape when pressed and quickly released (set with xcape)
xcape -e 'Control_L=Escape'

# Start i3
exec i3
