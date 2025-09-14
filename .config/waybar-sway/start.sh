#!/bin/bash

killall waybar
pkill waybar
sleep 0.5

waybar -c ~/.config/waybar-sway/config.jsonc -s ~/.config/waybar-sway/style.css &
