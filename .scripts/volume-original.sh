#Clickable Volume
#
# Left click
if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
  pactl set-sink-volume 0 +5%
# Middle click
elif [[ "${BLOCK_BUTTON}" -eq 2 ]]; then
  pavucontrol
# Right click
elif [[ "${BLOCK_BUTTON}" -eq 3 ]]; then
  pactl set-sink-volume 0 -5%
fi

pavu_status=$(pulseaudio-ctl full-status)
pavu_status=($pavu_status)

volume=${pavu_status[0]}
muted=${pavu_status[1]}

if [ "$muted" == "yes" ]; then
  echo '<span foreground="#Cd3f45">Mute</span>'
else
  echo $volume
fi
