#!/bin/bash

# Dotfiles installer
# Creates symlinks from home directory to dotfiles in this repository

set -e

DOTFILES_DIR=$(dirname $(realpath $0))
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Function to create symlink with backup
link_file() {
    local src="$1"
    local dst="$2"
    
    # If destination exists and is not a symlink, back it up
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        echo "Backing up $dst to $BACKUP_DIR"
        mv "$dst" "$BACKUP_DIR/"
    fi
    
    # Create parent directory if needed
    mkdir -p "$(dirname "$dst")"
    
    # Create symlink
    echo "Creating symlink: $dst -> $src"
    ln -sfn "$src" "$dst"
}

# Link .config directories
link_file "$DOTFILES_DIR/.config/alacritty" "$HOME/.config/alacritty"
link_file "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
link_file "$DOTFILES_DIR/.config/zsh" "$HOME/.config/zsh"
link_file "$DOTFILES_DIR/.config/tmux/themes" "$HOME/.config/tmux/themes"
link_file "$DOTFILES_DIR/.config/tmux-sessionizer" "$HOME/.config/tmux-sessionizer"
link_file "$DOTFILES_DIR/.config/ghostty" "$HOME/.config/ghostty"
link_file "$DOTFILES_DIR/.config/sketchybar" "$HOME/.config/sketchybar"

# Link individual dotfiles
link_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
link_file "$DOTFILES_DIR/.config/tmux/current-theme.conf" "$HOME/.config/tmux/current-theme.conf"
link_file "$DOTFILES_DIR/.aerospace.toml" "$HOME/.aerospace.toml"
link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Link scripts (ensure ~/.local/bin is in PATH)
link_file "$DOTFILES_DIR/.local/bin/tmux-sessionizer" "$HOME/.local/bin/tmux-sessionizer"
link_file "$DOTFILES_DIR/.local/bin/theme" "$HOME/.local/bin/theme"

echo "Dotfiles installation complete!"
echo "Any existing files were backed up to $BACKUP_DIR"
