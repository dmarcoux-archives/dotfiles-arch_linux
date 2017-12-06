# If docker is installed, set it up
if type docker > /dev/null; then
  ealias doc='docker'
  ealias doccom='docker-compose'

  # Docker with fzf
  # Tip: The following aliases are even better with this default option --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all
  #      We can quickly select one, multiple or all container(s)

  # Select Docker containers and remove them
  ealias drmf='docker ps --all | fzf --reverse --header-lines=1 --multi | tr --squeeze-repeats " " | cut --delimiter=" " --fields=1 | xargs --no-run-if-empty docker rm'

  # Select Docker containers and stop them
  ealias dstopf='docker ps | fzf --reverse --header-lines=1 --multi | tr --squeeze-repeats " " | cut --delimiter=" " --fields=1 | xargs --no-run-if-empty docker stop'

  # Select Docker images and remove them
  ealias drmif='docker image ls | fzf --reverse --header-lines=1 --multi | tr --squeeze-repeats " " | cut --delimiter=" " --fields=3 | xargs --no-run-if-empty docker rmi'
fi
