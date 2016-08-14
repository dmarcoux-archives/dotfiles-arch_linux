# If fzf is installed, set it up
if type fzf > /dev/null; then
  # Default command to use when input is tty
  export FZF_DEFAULT_COMMAND='ag -g ""'

  # Load default config files (completion and key bindings)
  # Completion at https://github.com/junegunn/fzf#fuzzy-completion-for-bash-and-zsh
  # Key bindings at https://github.com/junegunn/fzf#key-bindings-for-command-line
  for config (/usr/share/fzf/*.zsh) source $config
fi
