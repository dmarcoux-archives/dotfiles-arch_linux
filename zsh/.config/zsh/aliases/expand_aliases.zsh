# Expand aliases (or not, see comments below...)
# Shamelessly taken from https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/globalias

globalias() {
   zle _expand_alias
   zle expand-word
   zle self-insert
}
zle -N globalias

# Space expands all aliases, including global
bindkey -M emacs " " globalias
bindkey -M viins " " globalias

# Control-Space to make a normal space
bindkey -M emacs "^ " magic-space
bindkey -M viins "^ " magic-space

# Normal space during searches
bindkey -M isearch " " magic-space
