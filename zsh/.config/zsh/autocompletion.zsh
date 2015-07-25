# Allow completion from within a word/phrase
setopt COMPLETE_IN_WORD

# When completing from the middle of a word, move the cursor to the end of the word
setopt ALWAYS_TO_END

# Enable autocompletion
autoload -U compinit
compinit

# Case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

zstyle ':completion:*' verbose yes

zstyle ':completion:*' group-name ''

zstyle ':completion:*' menu select=long

zstyle ':completion:*' use-compctl false
