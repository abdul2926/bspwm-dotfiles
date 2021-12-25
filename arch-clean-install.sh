#!/bin/sh

# Please run 'copy-dotfiles.sh' to install the dotfiles.
# This is a personal script to set up new systems.

while true; do
	read -p $'Please run \'copy-dotfiles.sh\' to install the dotfiles.\nThis is a personal script to set up new systems.\ncontinue anyways? Y/N: ' yn
	case $yn in
		[Yy]* ) break;;
		[Nn]* ) exit;;
		* ) exit;;
	esac
done

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root."
	exit
fi

# Copy config files
mkdir -p ~/.config/bspwm/
mkdir -p ~/.config/sxhkd/
mkdir -p ~/.config/picom/
mkdir -p ~/.config/kitty/
cp bspwm/bspwmrc ~/.config/bspwm/bspwmrc
cp sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
cp picom/picom.conf ~/.config/picom/picom.conf
cp kitty/kitty.conf ~/.config/kitty/kitty.conf

# Install pacman packages
yes | pacman -Syyu
yes | pacman -S sddm sxhkd bspwm thunar tumbler kitty vim git picom

# Install packages from aur
mkdir -p ~/Downloads
git clone https://aur.archlinux.org/librewolf-bin.git
gpg --receive-keys 031F7104E932F7BD7416E7F6D2845E1305D6E801
cd ~/Downloads/librewolf-bin
yes | makepkg -si
cd ~/Downloads/
git clone https://aur.archlinux.org/debtap.git
cd debtap/
yes | makepkg -si
cd ~/Downloads/
git clone https://aur.archlinux.org/pxplus-ibm-vga8.git
cd pxplus-ibm-vga8/
yes | makepkg -si

# Install misc packages
cd ~/Downloads/
wget https://support.vyprvpn.com/hc/article_attachments/360054448971/vyprvpn-linux-cli-1.8.amd64.deb
yes | debtap -U
yes | debtap vyprvpn-linux-cli-1.8.amd64.deb
yes | pacman -U vyprvpn-1.8-1-x86_64.pkg.tar.zst

# Enable installed services
systemctl enable sddm

