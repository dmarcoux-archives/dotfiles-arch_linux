#----- General

# Quicker than cd ..; cd ...; etc...
#   ~$ cd ~/dir/example/folder
#   ~/dir/example/folder$ up 2
#   ~/dir$
# Credits: http://www.bashoneliners.com/oneliners/oneliner/220/ (I simply reformated the script)
up() {
  DEPTH=$1;

  if [ -z "${DEPTH}" ]; then # No depth provided...
    DEPTH=1;
  fi

  for i in $(seq 1 ${DEPTH}); do
    cd ../
  done
}

# Extract archives
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        NAME=${1%.*}
        mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

#----- Docker

# Remove all non-running containers
#   OR
# Remove containers based on their name
#
# $1: name (partial or complete)
drm() {
  if [ -z "$1" ]; then # No name...
    echo -e "Remove all non-running Docker containers?\n"

    docker ps --all --filter=status=exited # See what we would remove

    echo "" # Skipping a line

    select choice in Yes No; do
      case $choice in
	Yes) docker ps --all --quiet | xargs --no-run-if-empty docker rm; break;;
	No) break;;
      esac
    done
  else
    echo -e "Remove the following containers?\n"

    docker ps --all --filter="name=$1" # See what we would remove

    echo "" # Skipping a line

    select choice in Yes No; do
      case $choice in
	Yes) docker ps --all --quiet --filter="name=$1" | xargs --no-run-if-empty docker rm; break;;
	No) break;;
      esac
    done
  fi
}

# Remove all unused images
drmi() {
  echo -e "Remove all unused Docker images?\n"

  docker images --filter=dangling=true # See what we would remove

  echo "" # Skipping a line

  select choice in Yes No; do
    case $choice in
      Yes) docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi; break;;
      No) break;;
    esac
  done
}

# Stop all containers
dstop() {
  echo -e "Stop all Docker containers?\n"

  docker ps # See what we would stop

  echo "" # Skipping a line

  select choice in Yes No; do
    case $choice in
      Yes) docker ps --all --quiet | xargs --no-run-if-empty docker stop; break;;
      No) break;;
    esac
  done
}
