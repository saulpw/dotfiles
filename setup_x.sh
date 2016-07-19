#!/bin/sh

sudo apt-get install rxvt-unicode-256color xclip

mkdir -p ~/dotfiles
cd ~/dotfiles

for i in XCompose Xdefaults xinitrc xinputrc xsession ; do
ln -sf `pwd`/$i ~/.$i
done

mkdir -p ~/.i3
ln -sf `pwd`/i3-config ~/.i3/config
ln -sf `pwd`/i3status.conf ~/.i3status.conf

