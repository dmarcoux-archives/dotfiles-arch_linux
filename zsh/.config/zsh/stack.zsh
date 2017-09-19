# If stack is installed, set it up
if type stack > /dev/null; then
  export PATH=$PATH:~/.local/bin
  eval "$(stack --bash-completion-script stack)"
fi
