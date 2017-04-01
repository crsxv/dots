#!/bin/bash

# Display the current track on Spotify if it's running.

HOST=$(hostname)
if [[ "$HOST" == "m73" ]]; then
        DISPLAY_TRACK=false
elif [[ "$HOST" == "debian" ]]; then
        DISPLAY_TRACK=true
fi

if [[ $(ps -U root -u root -N | grep -Fo 'spotify') == *spotify* ]]; then

        if [ "$DISPLAY_TRACK" = true ]; then

                TITLE=`playerctl -p spotify metadata 'xesam:title'`
                ARTIST=`playerctl -p spotify metadata 'xesam:artist'`
                ALBUM=`playerctl -p spotify metadata 'xesam:album'`
                # If "title - artist - album" is very long, just display the title
                # and artist.
                NCHAR=(${#TITLE} + ${#ARTIST} + ${#ALBUM})
                if [[ $NCHAR -gt 30 ]]; then
                        TRACK=`echo " "$TITLE " - " $ARTIST`
                        echo "$TRACK" | sed -e 's/?/\?/g'
                else
                        TRACK=`echo " "$TITLE " - " $ARTIST " - " $ALBUM`
                        echo "$TRACK" | sed -e 's/?/\?/g'
                fi
        else
                echo ""
        fi
        if [[ $BLOCK_BUTTON == '1' ]]; then
                i3-msg workspace number 7: 
        fi
        if [[ $BLOCK_BUTTON == '3' ]]; then
                TITLE=`playerctl -p spotify metadata 'xesam:title'`
                ARTIST=`playerctl -p spotify metadata 'xesam:artist'`
                ALBUM=`playerctl -p spotify metadata 'xesam:album'`
                notify-send "`echo -e $TITLE'\n'$ARTIST'\n'$ALBUM`" \
                        -i /usr/share/icons/Numix-Circle/scalable/apps/Spotify.svg
        fi
elif [[ $(ps -U root -u root -N | grep -Fo 'rhythmbox') == *rhythmbox* ]]; then
        if [ "$DISPLAY_TRACK" = true ]; then

                TITLE=`playerctl -p rhythmbox metadata 'xesam:title'`
                ARTIST=`playerctl -p rhythmbox metadata 'xesam:artist'`
                ALBUM=`playerctl -p rhythmbox metadata 'xesam:album'`
                # If "title - artist - album" is very long, just display the title
                # and artist.
                NCHAR=(${#TITLE} + ${#ARTIST} + ${#ALBUM})
                if [[ $NCHAR -gt 30 ]]; then
                        TRACK=`echo "- "$TITLE " - " $ARTIST`
                        echo "$TRACK" | sed -e 's/?/\?/g'
                else
                        TRACK=`echo "- "$TITLE " - " $ARTIST " - " $ALBUM`
                        echo "$TRACK" | sed -e 's/?/\?/g'
                fi
        else
                echo ""
        fi
        if [[ $BLOCK_BUTTON == '1' ]]; then
                i3-msg workspace number 7:
        fi
        if [[ $BLOCK_BUTTON == '3' ]]; then
                TITLE=`playerctl -p rhythmbox metadata 'xesam:title'`
                ARTIST=`playerctl -p rhythmbox metadata 'xesam:artist'`
                ALBUM=`playerctl -p rhythmbox metadata 'xesam:album'`
                notify-send "`echo -e $TITLE'\n'$ARTIST'\n'$ALBUM`" \
                        -i /usr/share/icons/Numix-Circle/scalable/apps/rhythmbox.svg
        fi
else
        exit 0
fi
