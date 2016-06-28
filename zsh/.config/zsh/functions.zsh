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
drmi() { docker rmi $(docker images -q); }

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }
