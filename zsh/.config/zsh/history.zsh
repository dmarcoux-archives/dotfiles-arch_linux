HISTFILE=~/.zhistory
HISTSIZE=3000
SAVEHIST=3000

# Share history among all shells
setopt SHARE_HISTORY

# Do add command lines into the history if they are duplicates of the previous command line
setopt HIST_IGNORE_DUPS

# Remove superfluous blanks from each command line being added to the history
setopt HIST_REDUCE_BLANKS
