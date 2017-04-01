#!/bin/bash
#
# show available pacman updates

PACMAN=$(checkupdates | wc -l)

if [ "$PACMAN" -gt 0 ]; then
    echo "<span foreground='#81A2BE'> </span>$PACMAN"
    #     
else
    exit 0
fi
