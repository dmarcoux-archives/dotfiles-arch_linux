# If wine is installed, set it up
if type wine > /dev/null; then
  export WINEARCH=win32
  export WINEPREFIX=~/.wine32
fi
