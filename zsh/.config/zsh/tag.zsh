# If tag is installed, set it up
if (( $+commands[tag] )); then
  tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
  alias ag='noglob tag'
  export TAG_ALIAS_PREFIX=v
fi
