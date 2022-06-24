#!/bin/sh
# General
picom -b &
feh --bg-scale $HOME/pictures/wallpapers/main.jpg &
xsetroot -cursor_name left_ptr &
xidlehook --not-when-fullscreen --not-when-audio --timer 60 'slock' '' &
remaps.sh &
xrdb --load .config/xorg/xresources &

# Laptop
touchegg &

# Tablet
#xsetwacom --set 20 MapToOutput HDMI2 &

# XMonad
trayer --edge top --align right --widthtype     request --margin 15 --SetDockType true --SetPartialStrut     true --expand true --monitor 0 --transparent true --alpha     0 --tint 0x292d3e --height 25 --distance 13 &

# dwm
#slstatus &

