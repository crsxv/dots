#!/bin/bash

  eval $($(dirname $0)/sp eval)
  echo ${SPOTIFY_ARTIST} - ${SPOTIFY_TITLE}

  case $BLOCK_BUTTON in
   1) spotify_remote pause ;;
   2) i3-msg workspace number 7:  ;;
   3) spotify_remote play ;;
  esac
