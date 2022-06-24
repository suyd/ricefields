#!/bin/bash
#pacman -S xcape ttf-fira-code newsboat zsh xorg neovim picom ncmpcpp mpd mpc ttf-hack alsa-utils libxft-bgra xserver zsh-syntax-highlighting exa pamixer nitrogen rofi xss-lock

#spaceship-prompt
pacman -S --needed xorg xorg-server xorg-xinit xorg-apps xorg-xmessage \
	mesa lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver lib32-mesa-vdpau \
	libx11 libxft libxinerama libxrandr libxss \
	pkgconf \
	alacritty rofi xmobar feh trayer \
	ttf-fira-code ttf-hack ttf-font-awesome \
	alsa-utils pipewire lib32-pipewire pipewire-alsa pipewire-pulse pamixer wireless_tools xclip xdg-user-dirs \
	unzip polkit syncthing stack\
	firefox emacs flatpak steam

#systemctl --user enable pipewire.service
#systemctl --user enable syncthing.service
#systemctl enable auto-cpufreq --now
paru -S --needed nerd-fonts-hack touchegg touche picom-jonaburg-git brillo lf-bin auto-cpufreq xidlehook

#Not on arch
#doom emacs
#initialize xmonad config
# git clone xmonad, xmonad-contrib 
# stack init stack install

#Options
gsettings set org.gnome.desktop.interface color-scheme prefer-dark

