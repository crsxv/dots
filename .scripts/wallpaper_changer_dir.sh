#!/bin/sh
#
# set default wallpaper first in .xinitrc
# sleep 5m

# define directories here
dir1="/home/chris/pics/wallpapers/"
dir2="/home/chris/pics/wallpapers/"

currentwall () {
    # get current wallpaper
    wall=$(awk '/feh/ {printf $3}' "$HOME/.fehbg")
    wall=${wall#\'*}
    wall=${wall%*\'}
    wall=${wall##*/}
}

# then start your shufflin'
    while true;do
	find $dir1 $dir2 $dir3 ! -name "$wall" -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
	shuf -n1 -z | xargs -0 feh --bg-fill
	# increase if needed
    sleep 5m
done
