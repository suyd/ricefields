#!/bin/bash
nitrogen --restore &
slstatus &
picom -b &
xsetwacom --set 20 MapToOutput HDMI2 &
xset s on &
xset s 600 &
xss-lock slock &
$HOME/.local/bin/remaps.sh &
