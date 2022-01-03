#!/bin/sh

sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted
sudo apt update

sudo apt install -y vim-gtk blueman arandr i3 kitty rxvt-unicode-256color xclip pavucontrol
sudo apt install -y libdvdnav4 libdvdread4 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly libdvd-pkg
sudo apt install -y ubuntu-restricted-extras libavcodec-extra ffmpeg
sudo apt install -y tmux tmate mosh zsh vim git python3 exuberant-ctags cryptmount 

ln -sf /mnt/journal/gnupg ~/.gnupg

# can be run before checkout
mkdir -p ~/dotfiles
cd ~/dotfiles

for i in XCompose Xdefaults xinitrc xinputrc xsession Xmodmap ; do
ln -sf `pwd`/$i ~/.$i
done

mkdir -p ~/.i3
ln -sf `pwd`/i3-config ~/.i3/config
ln -sf `pwd`/i3status.conf ~/.i3status.conf

mkdir -p ~/.config/kitty
ln -sf `pwd`/kitty.conf ~/.config/kitty/kitty.conf
