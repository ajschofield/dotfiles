#!/bin/bash
# Fedora Workstation - Setup
# Author: Alex Schofield (@ajschofield)
#
# This script sets up dotfiles and configuration files on a new system.

set -e  # Exit immediately if something fails

# Get sudo privileges before continuing...
sudo -v
echo "We should be good to go!"

# Update everything before continuing
echo "Fetching new updates and installing..."
sudo dnf update -y

# Install the bare essentials
sudo dnf install -y rust cargo neovim sway kitty curl git zsh

# Install lvim (taken from lunarvim.org/docs/installation)

if [ ! -f ~/.local/bin/lvim ]; then
    LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
fi

# Install oh-my-posh

if [ ! -f ~/.local/bin/oh-my-posh ]; then
    curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin
fi

# Clone the dotfiles repository
DOT_DIR="$HOME/.dotfiles"
if [ -d "$DOT_DIR" ]; then
    echo "Dotfiles directory already exists. Pulling latest changes..."
    git -C "$DOT_DIR" pull
else
    echo "Dotfiles directory doesn't exist. Cloning..."
    git clone https://github.com/ajschofield/dotfiles "$DOT_DIR"
fi

# Apply the configurations using symlinks
echo "Applying configurations..."

# nvim/lvim configuration
LVIM_SRC="$DOT_DIR/lvim"
LVIM_DEST="$HOME/.config/lvim"
if [ -d "$LVIM_SRC" ]; then
    echo "Linking lvim configuration..."
    rm -rf "$LVIM_DEST"  # Remove the existing directory/file if present
    ln -sf "$LVIM_SRC" "$LVIM_DEST"
else
    echo "Warning: $LVIM_SRC does not exist. Skipping lvim configuration."
fi

# Kitty configuration
KITTY_SRC="$DOT_DIR/kitty"
KITTY_DEST="$HOME/.config/kitty"
if [ -d "$KITTY_SRC" ]; then
    echo "Linking kitty configuration..."
    rm -rf "$KITTY_DEST"
    ln -sf "$KITTY_SRC" "$KITTY_DEST"
else
    echo "Warning: $KITTY_SRC does not exist. Skipping kitty configuration."
fi

# zsh configuration
ZSH_SRC="$DOT_DIR/zsh/.zshrc"
ZSH_DEST="$HOME/.zshrc"
if [ -f "$ZSH_SRC" ]; then
    echo "Linking zsh configuration..."
    rm -f "$ZSH_DEST"
    ln -sf "$ZSH_SRC" "$ZSH_DEST"
else
    echo "Warning: $ZSH_SRC does not exist. Skipping zsh configuration."
fi

echo "Configurations have been installed."
