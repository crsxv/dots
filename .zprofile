# Autostart X at login
[ -z "$DISPLAY" -a "$(fgconsole)" -eq 1 ] ; exec startx &> /dev/null
