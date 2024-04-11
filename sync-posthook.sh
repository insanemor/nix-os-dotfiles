#!/bin/sh

# Post hooks to be called after a
# configuration sync

# Mainly just to reload stylix

# xmonad
pgrep xmobar &> /dev/null && echo "Killing old xmobar instances" && echo "Running killall xmobar" && killall xmobar &> /dev/null; # xmonad will restart xmobar
pgrep xmonad &> /dev/null && echo "Recompiling xmonad" && echo "Running xmonad --recompile && xmonad --restart" && xmonad --recompile && xmonad --restart;
pgrep .dunst-wrapped &> /dev/null && echo "Restarting dunst" && killall .dunst-wrapped && echo "Running dunst" && dunst &> /dev/null & disown;
pgrep xmonad &> /dev/null && echo "Reapplying background from stylix via feh" && echo "Running ~/.fehbg-stylix" && ~/.fehbg-stylix & disown;

# hyprland
pgrep Hyprland &> /dev/null && echo "Reloading hyprland" && hyprctl reload
pgrep .waybar-wrapped &> /dev/null && echo "Restarting waybar" && killall .waybar-wrapped && echo "Running waybar" && waybar &> /dev/null & disown;
pgrep fnott &> /dev/null && echo "Restarting fnott" && killall fnott && echo "Running fnott" && fnott &> /dev/null & disown;
pgrep Hyprland &> /dev/null && echo "Reapplying background from stylix via swaybg" && echo "Running ~/.swaybg-stylix" && ~/.swaybg-stylix & disown;

