#!/bin/sh

# This script is called on startup to remap keys.
# Increase key speed via a rate change
xset r rate 300 50
# Set Keyboard Layout
setxkbmap -layout es
# Map the caps lock key to super...
setxkbmap -option caps:super
# But when it is pressed only once, treat it as escape.
killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'
# Map the menu button to right super as well.
xmodmap -e 'keycode 135 = Super_R'
# Turn off the caps lock if on since there is no longer a key for it.
xset -q | grep "Caps Lock:\s*on" && xdotool key Caps_Lock
