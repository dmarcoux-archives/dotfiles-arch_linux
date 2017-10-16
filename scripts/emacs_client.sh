#!/usr/bin/env bash

# Check if there's an emacs frame
emacsclient -n -e "(if (> (length (frame-list)) 1) 't)" 2> /dev/null | grep t &> /dev/null

if [ "$?" -eq "1" ]; then
  # Start the emacs daemon (if needed), then create an emacs frame
  emacsclient -a '' -nqc "$@" &> /dev/null
else
  # Use existent emacs frame
  emacsclient -nq "$@" &> /dev/null
fi
