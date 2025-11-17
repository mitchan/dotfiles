#!/bin/bash

killall polybar
pkill polybar
sleep 0.5

polybar -c ~/.config/polybar/polybar.ini bar1 &
