#!/bin/sh

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

for i in .zshrc .vimrc .tmux.conf .gitconfig .screenrc .nethackrc ; do
    ln -sf `pwd`/$i ~/
done

# install vim plugins

ln -sf `pwd`/Vundle.vim ~/.vim/bundle/Vundle.vim

ln -sf `pwd`/vim/colors ~/.vim/

vim +PluginInstall +qall

# change shell to zsh

chsh -s $(grep /zsh$ /etc/shells | tail -1)

