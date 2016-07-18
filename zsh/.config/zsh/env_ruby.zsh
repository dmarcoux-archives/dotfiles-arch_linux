# If rbenv is installed, set it up
if type rbenv > /dev/null; then
  export PATH="$PATH:~/.rbenv/bin"
  eval "$(rbenv init -)" # Load rbenv
fi
