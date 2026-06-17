## Install 'yay'

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

## Installing Essentials/Tools
sudo pacman -S neovim
sudo pacman -S yadm

## Installing Apps
curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
git clone https://aur.archlinux.org/1password.git
cd 1password/
makepkg -si
cd
