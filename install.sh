#!/bin/bash
sudo pacman -Syy

sudo pacman -S --noconfirm git

# packages

sudo pacman -S --noconfirm neovim vim tmux fish starship

# node.js
yay -S --noconfirm nodenv nodenv-node-build
npm install --global yarn

# copy
mkdir ~/.config
cp -r fish ~/.config/
cp -r nvim ~/.config/
cp starship/starship.toml ~/.config

cp git/.gitconfig ~/
cp git/.gitignore_global ~/

cp tmux/.tmux.comf ~/
