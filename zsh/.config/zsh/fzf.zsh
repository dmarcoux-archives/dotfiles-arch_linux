# If fzf is installed, set it up
if type fzf > /dev/null; then
  # Default command to use when input is tty
  export FZF_DEFAULT_COMMAND='\ag --hidden -g ""'

  # Default command for the CTRL+T key binding
  export FZF_CTRL_T_COMMAND='\ag --hidden -g ""'

  # Default colors, Solarized (Light)
  _fzf_default_colors() {
    local black='#002B36'
    local grey='#839496'
    local dark_beige='#EEE8D5'
    local light_beige='#FDF6E3'
    local yellow='#B58900'
    local orange='#CB4B16'
    local red='#DC322F'
    local magenta='#D33682'
    local violet='#6C71C4'
    local blue='#268BD2'
    local cyan='#2AA198'
    local green='#859900'

    export FZF_DEFAULT_COLORS="
      --color fg:$grey,bg:$light_beige,hl:$blue,fg+:$light_beige,bg+:$green,hl+:$blue
      --color info:$yellow,prompt:$yellow,pointer:$light_beige,marker:$light_beige,spinner:$yellow
    "
  }
  _fzf_default_colors

  # Keybinds to select, deselect and toggle all results
  local BIND_SELECT="--bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all"

  # Default options
  export FZF_DEFAULT_OPTS="$BIND_SELECT $FZF_DEFAULT_COLORS"

  # Load default config files (completion and key bindings)
  # Completion at https://github.com/junegunn/fzf#fuzzy-completion-for-bash-and-zsh
  # Key bindings at https://github.com/junegunn/fzf#key-bindings-for-command-line
  for config in /usr/share/fzf/*.zsh; do source $config; done

  # fzf-marks: https://github.com/urbainvaes/fzf-marks
  # GNU General Public License v3.0
  if [[ -z "${MARKS_FILE}" ]] ; then
    local MARKS_DIR="${XDG_CONFIG_HOME}/fzf-marks"
    mkdir --parents $MARKS_DIR &> /dev/null
    export MARKS_FILE="${MARKS_DIR}/marks"
  fi

  if [[ ! -f "${MARKS_FILE}" ]]; then
    touch "${MARKS_FILE}"
  fi

  if [[ -z "${FZF_MARKS_COMMAND}" ]] ; then
    FZF_VERSION=$(fzf --version | awk -F. '{ print $1 * 1e6 + $2 * 1e3 + $3 }')
    MINIMUM_VERSION=16001

    if [[ $FZF_VERSION -gt $MINIMUM_VERSION ]]; then
      FZF_MARKS_COMMAND="fzf --height 40% --reverse"
    elif [[ ${FZF_TMUX:-1} -eq 1 ]]; then
      FZF_MARKS_COMMAND="fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}"
    else
      FZF_MARKS_COMMAND="fzf"
    fi

    export FZF_MARKS_COMMAND
  fi

  # Create a fzf mark
  function mark() {
    local mark_to_add
    # Replace /home/my_user by ~ (https://unix.stackexchange.com/a/207237)
    mark_to_add=$(echo "$* : ${PWD/#$HOME/~}")
    echo "${mark_to_add}" >> "${MARKS_FILE}"

    echo "** The following mark has been added **"
    echo "${mark_to_add}"
  }

  function handle_symlinks() {
    local fname
    if [ -L "${MARKS_FILE}" ]; then
      fname=$(readlink "${MARKS_FILE}")
    else
      fname=${MARKS_FILE}
    fi
    echo "${fname}"
  }

  # cd to a fzf mark
  # TODO: Fix minor bug which doesn't display VCS info
  # TODO: Fix -> Pressing Enter after is somehow blocking the shell... weird
  function jump() {
    local jumpline jumpdir marks
    jumpline=$($(echo ${FZF_MARKS_COMMAND}) --bind=ctrl-y:accept --tac < "${MARKS_FILE}")
    if [[ -n ${jumpline} ]]; then
      jumpdir=$(echo "${jumpline}" | sed -n "s/.* : \(.*\)$/\1/p" | sed "s#~#${HOME}#")
      marks=$(handle_symlinks)
      perl -p -i -e "s#${jumpline}\n##g" "${marks}"
      cd "${jumpdir}" && echo "${jumpline}" >> "${MARKS_FILE}"
    fi
    zle && zle reset-prompt
  }

  # Delete a fzf mark
  function dmark()  {
    local marks_to_delete line marks
    marks_to_delete=$($(echo ${FZF_MARKS_COMMAND}) -m --bind=ctrl-y:accept,ctrl-t:toggle --tac < "${MARKS_FILE}")
    marks=$(handle_symlinks)

    if [[ -n ${marks_to_delete} ]]; then
      while read -r line; do
        perl -p -i -e "s#${line}\n##g" ${marks}
      done <<< "$marks_to_delete"

      echo "** The following marks have been deleted **"
      echo "${marks_to_delete}"
    fi
  }

  # Define keybind CTRL+G to jump to fzf mark
  zle -N jump
  bindkey '^g' jump
fi
