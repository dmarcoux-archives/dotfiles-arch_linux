# System update: Official packages, then AUR packages
function sup() {
  # TODO: Add another function which builds on top of pacfiles to deal with .pacnew/.pacsave files
  sudo pacman --sync --refresh --sysupgrade && pacaur --update --devel --needed
}

# Remove orphan packages
# (with --arg-file, stdin remains unchanged when commands are run. Otherwise, stdin is redirected from /dev/null)
alias rop='xargs --arg-file=<(pacman --query --deps --unrequired --quiet) --no-run-if-empty sudo pacman --remove --nosave --recursive'

# List .pacnew, .pacsave files
function pacfiles() {
  find / -regextype posix-extended -regex ".+\.pac(new|save)" 2> /dev/null
}
