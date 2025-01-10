#!/bin/bash

# Update
pacman -Svy

# Download yay
yes | pacman -Sy yay

# Download hyperland
yes | pacman -Sy hyprland hypridle hyprpaper

# Download apps
yes | pacman -Sy kitty make \
    git waybar otf-font-awesome \
    ttf-arimo-nerd noto-fonts \
    thunar wofi wofi-power-menu code blueman \
    zsh neofetch


# ZSH Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

rsync ./.zshrc ~/.zshrc
rsync ./.p10k.zsh ~/.p10k.zsh

chsh -s $(which zsh)

# Hypr configs
rm -rf ~/.config/hypr
rsync -a ./hypr  ~/.config/

# Make Waybar hyperlink
rsync -a ./waybar  ~/.config/ 
rm -rf /etc/xdg/waybar
ln -s ~/.config/waybar/ /etc/xdg/waybar

# Enable hypr*
systemctl --user enable hypridle
systemctl --user status hypridle

systemctl --user enable hyprpaper
systemctl --user status hyprpaper
