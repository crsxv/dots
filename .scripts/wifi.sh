#!/bin/bash

#------------------------------------------------------------------------

INTERFACE="${BLOCK_INSTANCE:-wlp2s0}"

#------------------------------------------------------------------------

# As per #36 -- It is transparent: e.g. if the machine has no battery or wireless
# connection (think desktop), the corresponding block should not be displayed.
[[ ! -d /sys/class/net/${INTERFACE}/wireless ]] ||
    [[ "$(cat /sys/class/net/$INTERFACE/operstate)" = 'down' ]] && exit

#------------------------------------------------------------------------

QUALITY=$(grep $INTERFACE /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')

#------------------------------------------------------------------------

echo $QUALITY% # full text
echo $QUALITY% # short text

# color
if [[ $QUALITY -ge 80 ]]; then
    echo "#00FF00"
elif [[ $QUALITY -lt 80 ]]; then
    echo "#FFF600"
elif [[ $QUALITY -lt 60 ]]; then
    echo "#FFAE00"
elif [[ $QUALITY -lt 40 ]]; then
    echo "#FF0000"
fi
