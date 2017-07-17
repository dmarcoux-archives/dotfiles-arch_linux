#!/usr/bin/env bash

# On Arch Linux, Haskell libraries/executables are dynamically linked since late-June 2017.
# This results in stack requiring the whole Haskell development ecosystem.
# In order to avoid this, I prefer to manually install stack.
curl -sSL https://get.haskellstack.org/ | sh
