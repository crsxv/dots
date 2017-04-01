#!/bin/bash

spotify-now -i "%artist - %title"

# Left click
if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
sp pause
# Middle click
elif [[ "${BLOCK_BUTTON}" -eq 2 ]]; then
  pavucontrol
# Right click
elif [[ "${BLOCK_BUTTON}" -eq 3 ]]; then
sp play
fi
