#!/bin/sh

# Run this to copy the configuration files
# NOTE: This will replace your configuration files if you already
# have some. 

while true; do
	read -p $'This will replace your existing configuration files.\nContinue anyways? y/N: ' yn
	case $yn in
		[Yy]* ) break;;
		[Nn]* ) exit;;
		* ) exit;;
	esac
done

# Copy config files
mkdir -p ~/.config/bspwm/
mkdir -p ~/.config/sxhkd/
mkdir -p ~/.config/picom/
mkdir -p ~/.config/kitty/
cp bspwm/bspwmrc ~/.config/bspwm/bspwmrc
cp sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
cp picom/picom.conf ~/.config/picom/picom.conf
cp kitty/kitty.conf ~/.config/kitty/kitty.conf

