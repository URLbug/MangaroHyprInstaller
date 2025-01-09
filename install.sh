#!/bin/bash

# Update
pacman -Svy

# Download hyperland
yes | pacman -Sy hyprland

# Download apps
yes | pacman -Sy kitty make \
    git waybar otf-font-awesome \
    ttf-arimo-nerd noto-fonts

# Hypr configs
rm -rf ~/.config/hypr
rsync -a ./hypr  ~/.config/

# Make Waybar hyperlink
rsync -a ./waybar  ~/.config/ 
rm -rf /etc/xdg/waybar
ln -s ~/.config/waybar/ waybar


