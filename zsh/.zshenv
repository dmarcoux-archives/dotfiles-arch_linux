#----- Editor & Browser
export EDITOR=vim
export VISUAL=vim
export BROWSER=chromium

#----- Locale
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_TIME=fr_CA.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LESSCHARSET=utf-8

#----- XDG Base Directory
# From https://wiki.archlinux.org/index.php/XDG_Base_Directory_support

# User-specific configuration files
export XDG_CONFIG_HOME=$HOME/.config

# User-specific data files
export XDG_DATA_HOME=$HOME/.local/share

# User-specific non-essential (cached) data
export XDG_CACHE_HOME=$HOME/.cache

# User-specific runtime files
# XDG_RUNTIME_DIR is already set through pam_systemd
