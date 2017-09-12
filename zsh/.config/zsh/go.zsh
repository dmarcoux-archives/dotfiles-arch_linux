# If go is installed, set it up
if type go > /dev/null; then
  export GOPATH=~/projets/go
  export GOROOT=/usr/lib/go
  export PATH=$PATH:$GOPATH/bin
fi
