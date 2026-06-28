## This file is for installing all relevant files for the linux desktop environment
## 
## After installing this file, the config files must be cloned from the repository to complete installation

## Install 'yay'
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -Syu

## Installing Essentials/Tools
sudo pacman -S neovim
sudo pacman -S yadm
sudo pacman -S quickshell
yay -S hellwal
sudo pacman -S ttf-nerd-fonts-symbols noto-fonts-emoji
sudo pacman -S bluez bluez-utils
sudo systemctl enable bluetooth
sudo pacman -S blueman
sudo pacman -S pulseaudio pulseaudio-bluetooth pamixer
yay -S gtk-theme-flat-color-git nwg-look
yay -S BeautyLine
sudo pacman -S ttf-jetbrains-mono-nerd
yay -S walker-bin
yay -S elephant-desktopapplications elephant-providerlist elephant-cal elephant-calcc
yay -S pwvucontrol
yay -S hyprlock
sudo pacman -S networkmanager network-manager-applet nm-connection-editor
yay -S swaync

## Installing Environment Apps
sudo pacman -S waybar
yay -S wlogout
yay -S pyprland
yay -S vesktop-bin
yay -S themecord
sudo pacman -S thunar

##Wallpaper Picker
sudo pacman -S awww
sudo pacman -S imagemagick
sudo pacman -S jq

## Installing Apps
curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
git clone https://aur.archlinux.org/1password.git
cd 1password/
makepkg -si
cd

## Disable IWCTL and enable Network Manager
sudo systemctl disable --now iwd.service
sudo systemctl enable --now NetworkManager.service

##Notify of Manual Adjustments
echo "~/.config/quickshell/hyprquickpaper/config.json will need adjusting to the appropriate user"
echo "/usr/share/themes/FlatColor/gtk-3.20 | gtk-3.0 | gtk 2.0 will all need to have the source file for color adjusted"
echo "nwg-look - update the widgets theme/icons theme/cursor theme and font"
echo "add the autologin files to /etc/sddm.conf.d/autlogin.conf"
