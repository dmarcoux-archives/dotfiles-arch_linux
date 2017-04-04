#!/usr/bin/env bash

# Set the keyboard layout to Canadian Multilingual
setxkbmap -layout ca -variant multi

# Customize the keyboard layout even more
# See details in xmodmap/.Xmodmap
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# Caps Lock acts as Left Control when pressed and held (set with xmodmap)
# Caps Lock acts as Escape when pressed and quickly released (set with xcape)
xcape -e 'Control_L=Escape'
