# If npm is installed, set it up
if type npm > /dev/null; then
  # Create directory for global installations
  mkdir --parents ~/.npm-global

  # Configure npm to use the new directory path
  npm config set prefix '~/.npm-global'

  # Add the directory to the PATH
  export PATH="$PATH:~/.npm-global/bin"
fi
