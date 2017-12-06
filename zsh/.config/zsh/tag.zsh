# If tag is installed, set it up
if type tag > /dev/null; then
  tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }

  # ag doesn't have a way to set default options, so they are set in the alias below...
  # color-match: bold blue foreground
  # color-path: bold dark grey foreground
  # color-line-number: bold dark grey foreground
  alias ag='noglob tag --color-match="1;38;5;4" --color-path="1;38;5;10" --color-line-number="1;38;5;10"'

  export TAG_ALIAS_PREFIX=v
fi
