alias doc='docker'
alias doccom='docker-compose'

# Remove containers based on their name
#
# $1: name (partial or complete)
drm() {
  echo -e "Remove the following containers?\n"

  docker ps --all --filter="name=$1" # See containers we would remove

  echo "" # Skipping a line

  select choice in Yes No; do
    case $choice in
      Yes) docker ps --all --quiet --filter="name=$1" | xargs --no-run-if-empty docker rm; break;;
      No) break;;
    esac
  done
}

# Stop all containers
dstop() {
  echo -e "Stop all Docker containers?\n"

  docker ps # See containers we would stop

  echo "" # Skipping a line

  select choice in Yes No; do
    case $choice in
      Yes) docker ps --quiet | xargs --no-run-if-empty docker stop; break;;
      No) break;;
    esac
  done
}
