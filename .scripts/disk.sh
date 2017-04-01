#!/bin/sh

DIR="${BLOCK_INSTANCE:-$HOME}"
ALERT_LOW="${100:-20}" # color will turn red above this value (default: 80%)

usage=$(df -h -P -l "$DIR" | awk -v alert_low=$ALERT_LOW '
/\/.*/ {
	print $4
	use=$4
	# no need to continue parsing
	exit 0
}
END {
	gsub(/%$/,"",use)
	if (100 - use < alert_low) {
		# color
		
	}}')

echo "<span foreground='#87AFAF' ></span>$usage"

case $BLOCK_BUTTON in
 1) i3-msg exec rofi-find ;; #left click, locate +xdg-open files with rofi
 2) i3-msg exec filelight ;; #middle click, open filelight
 3) i3-msg exec pcmanfm --browser ;; #right click, open filemanager
esac
