#!/usr/bin/env bash

# Set the target directory
TARGET="$HOME"

# Array of your exact folder names
PACKAGES=(
    "cava"
    "fastfetch"
    "fish"
    "hypr"
    "kitty"
    "rofi"
    "swaync"
    "waybar"
    "yazi"
)

# Ensure the script is running from the hypr-cybr directory
cd "$(dirname "$0")" || exit

echo "Starting GNU Stow overwrite process..."

for pkg in "${PACKAGES[@]}"; do
    if [ -d "$pkg" ]; then
        # 1. Forcefully remove the existing directory in ~/.config to prevent conflicts
        if [ -e "$TARGET/.config/$pkg" ]; then
            echo "Removing existing system config for $pkg..."
            rm -rf "$TARGET/.config/$pkg"
        fi
        
        # 2. Stow the package
        echo "Stowing $pkg..."
        stow -R -v -t "$TARGET" "$pkg"
    else
        echo "Warning: Directory '$pkg' not found in repo. Skipping."
    fi
done

echo "Done! All dotfiles have been successfully overwritten and linked."
