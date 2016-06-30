#!/bin/sh

echo sudo apt-get install tmux zsh vim git python3 exuberant-ctags

# get external tools used

if [ ! -x ~/dotfiles ] ; then
    git clone https://github.com/saulpw/dotfiles.git ~/dotfiles
    git submodule update --init --recursive
fi

cd ~/dotfiles

git submodule update --recursive

# setup .vim dirs

mkdir -p ~/.vim/undo
mkdir -p ~/.vim/swp
mkdir -p ~/.vim/bundle

# install actual dot files

for i in .zshrc .vimrc .tmux.conf .ctags .gitconfig .screenrc .nethackrc .bash_aliases ; do
    ln -sf `pwd`/$i ~/
done

# install vim plugins

ln -sf `pwd`/Vundle.vim ~/.vim/bundle/Vundle.vim

ln -sf `pwd`/vim/colors ~/.vim/

vim +PluginInstall +qall

# change shell to zsh

echo chsh -s $(grep /zsh$ /etc/shells | tail -1)

