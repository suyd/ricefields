#!/bin/bash
#Paru dependency
sudo pacman -S --needed base-devel
mkdir .src
git clone https://aur.archlinux.org/paru.git .src/paru
cd .src/paru
makepkg -si

#Package list

paru --needed --ask 4 -Sy - < pkglist.txt

systemctl --user enable pipewire.service
systemctl --user enable syncthing.service
systemctl enable auto-cpufreq --now

stow 
#Not on arch
#doom emacs
#initialize xmonad config
# git clone xmonad, xmonad-contrib 
## stack init stack install

stack init & 
#Doom
git clone https://github.com/hlissner/doom-emacs ~/.config/emacs

~/.config/emacs/bin/doom install

#Options
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

