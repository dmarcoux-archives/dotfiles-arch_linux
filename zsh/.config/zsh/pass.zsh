# If pass is installed, set it up
if type pass > /dev/null; then
  # Do not pollute the home directory
  export PASSWORD_STORE_DIR=$XDG_CONFIG_HOME/pass/passwords
fi
