#!/bin/zsh

set -e # Exit if a command exists with a non-zero status


echo "Creating symlinks..."
ln -sf ~/.dotfiles/tmux ~/.config/tmux
ln -sf ~/.dotfiles/alacritty ~/.config/alacritty
ln -sf ~/.dotfiles/starship.toml ~/.config/starship.toml
ln -sf ~/.dotfiles/nvim ~/.config/nvim
# ln -sf ~/.dotfiles/.zprofile ~/.zprofile
ln -sf ~/.dotfiles/zsh ~/.config/zsh
ln -sf ~/.dotfiles/aerospace.toml ~/.config/aerospace.toml

echo "Dotfiles installation complete! Restart your terminal for changes to take effect."
