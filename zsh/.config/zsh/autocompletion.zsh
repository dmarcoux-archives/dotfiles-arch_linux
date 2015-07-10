# Enable autocompletion
autoload -U compinit
compinit
# Autocompletion systems
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=long
zstyle ':completion:*' use-compctl false
