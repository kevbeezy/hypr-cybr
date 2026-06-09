# Hypr-Cybr

Personal dotfiles and configurations for a seamless desktop experience. Managed with GNU Stow.

> **WARNING:** The setup script will forcefully remove any conflicting dotfiles in your `~/.config` directory. Please ensure you back up your existing configurations before proceeding.

---

## Automated Installation

To instantly install all needed packages and link the dotfiles, run the included scripts:

```bash
# 1. Install all required packages
./install.sh

# 2. Automatically link dotfiles using GNU Stow
./setup.sh
```

## Manual Stowing

If you prefer to manually stow specific dotfiles instead of using the automated script, navigate to the repository root and pass your desired package to Stow.

```bash
cd ~/projects/hypr-cybr
stow -t ~ [package_name]
```
