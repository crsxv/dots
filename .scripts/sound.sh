#/bin/bash

rl=$(runlevel | awk '{print $2}')

if [[ $rl -eq 0 || $rl -eq 6 ]]
  then
    amixer -D pulse sset Master 0%
    aplay -q -d 1 /root/silence.wav
else
  amixer -D pulse sset Master 50%
fi

notify-send -i preferences-desktop-sound "Sound-Settings" "The speakers have been updated according to your runlevel."

#amixer -D pulse sget Master | egrep -o "[0-9]+%"
