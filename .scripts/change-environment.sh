#! /bin/bash

selection=$(zenity --list "Awesome" "Gnome" "i3" "Xfce" --column="" --text="Change Environment" --title="Menu")

case "$selection" in
"Awesome") awesome ; zenity --info --text="Changed to Awesome";;
"Gnome") gnome ; zenity --info --text="Changed to Gnome";;
"i3") i3wm ; zenity --info --text="Changed to i3wm";;
"Xfce") xfce ; zenity --info --text="Changed to Xfce";;
esac
