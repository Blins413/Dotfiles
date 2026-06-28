#!/bin/bash

#Set the background through the awww backend
awww img $1 -t grow --transition-duration 3 --transition-fps 120 --transition-pos top-right

#Run hellwal to generate the color pallettes
hellwal -i $1

#Write the current wallpaper file
printf '%s\n' "$1" > ~/.config/hypr/scripts/.current_wallpaper

#Apply themeing to discord/themecord
themecord -g

#Reload all hyprland elements
hyprctl reload

#Set the color of the icons in the wlogout menu
~/.config/hypr/scripts/colorize-icons.sh $(hellwal -i $1 --json | jq -r '.colors.color7')

#Reload the xdg-desktop-portal to force instant styling changes in Blueman
gsettings set org.gnome.desktop.interface gtk-theme "FlatColor"
