ealias doc='docker'
ealias doccom='docker-compose'

# Select Docker containers to remove
# Tip: Amazing with default options --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all
#      We can quickly select specific, multiple or all containers
ealias drmf='docker ps --all | fzf --reverse --header-lines=1 --multi | cut --delimiter=" " --fields=1 | xargs --no-run-if-empty docker rm'

# Select Docker containers to stop
# Tip: Amazing with default options --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all
#      We can quickly select specific, multiple or all containers
ealias dstopf='docker ps | fzf --reverse --header-lines=1 --multi | cut --delimiter=" " --fields=1 | xargs --no-run-if-empty docker stop'
