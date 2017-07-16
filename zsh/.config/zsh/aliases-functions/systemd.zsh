ealias sysd='systemctl'
alias shutdown='systemctl poweroff'
alias reboot='systemctl reboot'

# Output all active and running systemd services (beside the core systemd services)
alias services="systemctl list-units -t service --no-pager --no-legend | grep active | grep -v systemd | grep -v exited | awk '{ print \$1 }'"
