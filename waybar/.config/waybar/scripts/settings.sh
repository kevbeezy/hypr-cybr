#!/bin/bash
source ~/.bashrc

option=$(printf "Hypr\nWaybar\nKitty\nSwayNC\nRofi\nFish\nStarship" | rofi -dmenu -p "Edit Config:")

case "$option" in
    "Hypr") hypr_option=$(printf "Hyprland\nHypridle\nHyprlock\nHyprpaper" | rofi -dmenu -p "Hypr Configs:") ;;
    "Waybar") waybar_options=$(printf "config.jsonc\nstyle.css\nsettings.sh" | rofi -dmenu "Waybar Configs:") ;;
    "Kitty") kitty -e $EDITOR "$HOME/.config/kitty/kitty.conf" ;;
    "SwayNC") swaync_options=$(printf "config.json\nstyle.css" | rofi -dmenu -p "SwayNC Options") ;;
    "Rofi") kitty -e $EDITOR "$HOME/.config/rofi/config.rasi" ;;
    "Fish") kitty -e $EDITOR "$HOME/.config/fish/" ;;
    "Starship") kitty -e $EDITOR "$HOME/.config/starship.toml" ;;
esac

case "$hypr_option" in
    "Hyprland") kitty -e $EDITOR "$HOME/.config/hypr/hyprland.lua" ;;
    "Hypridle") kitty -e $EDITOR "$HOME/.config/hypr/hypridle.conf" ;;
    "Hyprlock") kitty -e $EDITOR "$HOME/.config/hypr/hyprlock.conf" ;;
    "Hyprpaper") kitty -e $EDITOR "$HOME/.config/hypr/hyprpaper.conf" ;;
esac

case "$waybar_options" in
    "config.jsonc") kitty -e $EDITOR "$HOME/.config/waybar/config.jsonc" ;;
    "style.css") kitty -e $EDITOR "$HOME/.config/waybar/style.css" ;;
    "settings.sh") kitty -e $EDITOR "$HOME/.config/waybar/scripts/settings.sh"
esac

case "$swaync_options" in
    "config.json") kitty -e $EDITOR "$HOME/.config/swaync/config.json" ;;
    "style.css") kitty -e $EDITOR "$HOME/.config/swaync/style.css" ;;
esac
