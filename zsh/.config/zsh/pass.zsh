# If pass is installed, set it up
if type pass > /dev/null; then
  # Do not pollute the home directory
  export PASSWORD_STORE_DIR=$XDG_CONFIG_HOME/pass/passwords

  # Copy two-factor authentication code to clipboard for a specific login
  2fa(){
    # List full paths of passwords stored by pass under $PASSWORD_STORE_DIR
    # Keep the relative paths of these passwords without the .gpg extension (just like how pass does it)
    # Select one login with fzf
    # Retrieve the OTP code for the selected login and copy it to the clipboard
    find $PASSWORD_STORE_DIR/otp -name "*.gpg" -print | sed -e "s|$PASSWORD_STORE_DIR/\(.*\)\.gpg|\1|g" | fzf --no-multi --reverse | xargs --no-run-if-empty pass otp --clip
  }
fi
