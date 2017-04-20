# If fzf is installed, set it up
if type fzf > /dev/null; then
  # Default command to use when input is tty
  export FZF_DEFAULT_COMMAND='\ag --hidden -g ""'

  # Default command for the CTRL+T key binding
  export FZF_CTRL_T_COMMAND='\ag --hidden -g ""'

  # Default colors, Solarized (Light)
  _fzf_default_colors() {
    local black='#002B36'
    local grey='#839496'
    local dark_beige='#EEE8D5'
    local light_beige='#FDF6E3'
    local yellow='#B58900'
    local orange='#CB4B16'
    local red='#DC322F'
    local magenta='#D33682'
    local violet='#6C71C4'
    local blue='#268BD2'
    local cyan='#2AA198'
    local green='#859900'

    export FZF_DEFAULT_COLORS="
      --color fg:$grey,bg:$light_beige,hl:$blue,fg+:$light_beige,bg+:$green,hl+:$blue
      --color info:$yellow,prompt:$yellow,pointer:$light_beige,marker:$light_beige,spinner:$yellow
    "
  }
  _fzf_default_colors

  # Default options
  export FZF_DEFAULT_OPTS="$FZF_DEFAULT_COLORS"

  # Load default config files (completion and key bindings)
  # Completion at https://github.com/junegunn/fzf#fuzzy-completion-for-bash-and-zsh
  # Key bindings at https://github.com/junegunn/fzf#key-bindings-for-command-line
  for config (/usr/share/fzf/*.zsh) source $config
fi
