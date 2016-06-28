#!/bin/sh

# sudo apt-get install rxvt-unicode-256color

ln -sf .XCompose .Xdefaults .xinitrc .xinputrc ~/

mkdir ~/.i3
ln -sf i3-config ~/.i3/config
ln -sf .i3status.conf ~/

