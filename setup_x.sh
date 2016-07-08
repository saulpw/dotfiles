#!/bin/sh

echo sudo apt-get install rxvt-unicode-256color xclip

mkdir -p ~/dotfiles
cd ~/dotfiles

for i in .XCompose .Xdefaults .xinitrc .xinputrc ; do
ln -sf `pwd`/$i ~/
done

mkdir ~/.i3
ln -sf `pwd`/i3-config ~/.i3/config
ln -sf `pwd`/.i3status.conf ~/

