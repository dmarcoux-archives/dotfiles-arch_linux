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

# Remove all non-running containers OR Remove containers linked to a docker image
# $1: docker image (partial or complete name)
drm() {
  if [ -z "$1" ]; then # No argument...
    echo "Remove all non-running containers?"
    select choice in Yes No; do
      case $choice in
	Yes) docker rm $(docker ps -a -q); break;;
	No) break;;
      esac
    done
  else
    echo -e "Remove the following containers\n"
    # Using grep as 'ag --before' doesn't work when piping: https://github.com/ggreer/the_silver_searcher/issues/869
    docker ps -a | grep --color --before 1 $1 # See what we would remove
    echo "" # Simply skipping a line...
    select choice in Yes No; do
      case $choice in
	Yes) docker ps -a | ag $1 | awk '{ print $1 }' | xargs docker rm; break;;
	No) break;;
      esac
    done
  fi
}

# Remove all unused images
drmi() { docker rmi $(docker images -q); }

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }
