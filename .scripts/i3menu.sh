#!/bin/sh

# menu icon
echo "<span font='12' font_weight='ultralight' foreground='#c5c8c6' ></span>"
# ☰  

# mouse buttons
case $BLOCK_BUTTON in
    1) i3-dmenu-desktop --dmenu="/usr/bin/rofi -dmenu -i -p 'apps:' -width 25 -padding 19 -opacity 85 -yoffset -180 -xoffset 500" ;; #left click rofi
    2) rofi-logout ;; #middle click, logout menu
    3) rofi-s  #right click, rofi web search
esac
