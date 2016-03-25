#----- Zsh package for version control systems
autoload -Uz vcs_info

# Only for Git
zstyle ':vcs_info:*' formats " (%b) " enable git

# Call the package in a pre-command
precmd() { vcs_info }

# Enable command substitution in the prompt
setopt prompt_subst

#----- Prompt
# %n -> username
# %~ -> path
# %f -> reset foreground color to the default
# ${vcs_info_msg_0_}% -> git information, see above
# Anything else is displayed as it is (For example, @)
PROMPT='[%n@%~]${vcs_info_msg_0_}% $ %f'
