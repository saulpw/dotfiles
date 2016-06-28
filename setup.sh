#!/bin/sh

# sudo apt-get install rxvt-unicode-256color
# sudo apt-get install tmux zsh vim git python3

git clone https://github.com/saulpw/dotfiles.git ~/dotfiles

cd ~/dotfiles

# get external tools used

git submodule update --init --recursive

# setup .vim dirs

mkdir -p ~/.vim/undo
mkdir -p ~/.vim/swp
mkdir -p ~/.vim/bundle

# install actual dot files

ln -sf .zshrc .vimrc .tmux.conf ~/

# install vim plugins

ln -sf Vundle.vim ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

# change shell to zsh

chsh -s $(grep /zsh$ /etc/shells | tail -1)

