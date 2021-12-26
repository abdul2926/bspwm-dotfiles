#!/bin/sh
# author: abdul2926

mkdir -p bspwm
cp ~/.config/bspwm/bspwmrc bspwm/bspwmrc
mkdir -p kitty
cp ~/.config/kitty/kitty.conf kitty/kitty.conf
mkdir -p picom
cp ~/.config/picom/picom.conf picom/picom.conf
mkdir -p sxhkd
cp ~/.config/sxhkd/sxhkdrc sxhkd/sxhkdrc
mkdir -p polybar
cp ~/.config/polybar/launch.sh polybar/launch.sh
cp ~/.config/polybar/config.ini polybar/config.ini
cp ~/.config/polybar/colors.ini polybar/colors.ini
