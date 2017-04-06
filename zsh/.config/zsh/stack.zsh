# If stack is installed, set it up
if type stack > /dev/null; then
  eval "$(stack --bash-completion-script stack)"
fi
