alias ls='ls --all --color=auto --format=horizontal --group-directories-first'
alias mkdir='mkdir --parents --verbose' # No error when directory already exists, more feedback
alias ping='ping -c 3' # Ping with 3 packets
alias wget='wget --continue' # Always resume download if partial file found
alias history='history 1' # Retrieve all history (useful when using piping the output to grep/ag/whatever)
alias yank='yank -- xsel --clipboard' # Yank to the clipboard, as opposed to the default primary clipboard
