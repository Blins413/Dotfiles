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



## Installing Environment Apps

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

##Notify of Manual Adjustments
echo "~/.config/quickshell/hyprquickpaper/config.json will need adjusting to the appropriate user"
