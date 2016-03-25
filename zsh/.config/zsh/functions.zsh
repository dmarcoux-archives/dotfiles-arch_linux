#----- General

# Quicker than cd ..; cd ...; etc...
#   ~$ cd ~/dir/example/folder
#   ~/dir/example/folder$ up 2
#   ~/dir$
# Credits: http://www.bashoneliners.com/oneliners/oneliner/220/
up() { DEEP=$1; [ -z "${DEEP}" ] && { DEEP=1; }; for i in $(seq 1 ${DEEP}); do cd ../; done; }

#----- Docker

# Remove all non-running containers
drm() { docker rm $(docker ps -a -q); }

# Remove all unused images
drmi() { docker rmi $(docker images -q); }

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }
