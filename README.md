# Hypr-Cybr

Personal dotfiles and configurations for a seamless desktop experience. Managed with GNU Stow.

> **WARNING:** The setup script will forcefully remove any conflicting dotfiles in your `~/.config` directory. Please ensure you back up your existing configurations before proceeding.

> **NOTE:** I recommend editting these configs to match your hardware setup. Run `hyprctl monitors` in the terminal.
>
> ```bash
> hypr/.config/hypr/modules/monitors.lua
> hypr/.config/hypr/modules/winrules.lua
> hypr/.config/hypr/hyprlock.conf
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

**Example:** Stowing only the Starship prompt configuration:

```bash
cd ~/projects/hypr-cybr
stow -t ~ starship
```
