#!/bin/bash

killall waybar
pkill waybar
sleep 0.5

waybar -c ~/.config/waybar-niri/config.jsonc -s ~/.config/waybar-niri/style.css &
