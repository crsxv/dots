#!/bin/bash

# Script to randomly set Background from files in a directory

# Directory Containing Pictures
DIR="/home/chris/pics/wallpapers/"

# Command to Select a random jpg file from directory
# Delete the *.jpg to select any file but it may return a folder
PIC=$(ls $DIR/*.jpg *.png | shuf -n1)

# Command to set Background Image
feh --bg-scale $PIC

