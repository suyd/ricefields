#!/bin/bash
nitrogen --restore &
slstatus &
picom -b &
xsetwacom --set 20 MapToOutput HDMI2
$HOME/.local/bin/remaps.sh &
