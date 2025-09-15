#!/bin/bash

killall waybar
pkill waybar
sleep 0.5

waybar -c ~/.config/waybar-hypr/config.jsonc -s ~/.config/waybar-hypr/style.css &
