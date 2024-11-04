#!/bin/sh

sudo apt-get update -y && sudo apt-get install -y tmux zsh vim git python3 python3-pip exuberant-ctags

# get external tools used

if [ ! -x ~/dotfiles ] ; then
    git clone https://github.com/saulpw/dotfiles.git ~/dotfiles
fi

cd ~/dotfiles

git submodule update --init --recursive

# setup .vim dirs

mkdir -p ~/.vim/undo
mkdir -p ~/.vim/swp
mkdir -p ~/.vim/bundle

# install actual dot files

for i in zshrc vimrc tmux.conf ctags gitconfig pypirc nbrc ; do
    ln -sf `pwd`/$i ~/.$i
done

# setup vim plugins

ln -sf `pwd`/Vundle.vim ~/.vim/bundle/Vundle.vim

ln -sf `pwd`/vim/colors ~/.vim/

# change shell to zsh
chsh -s $(grep /zsh$ /etc/shells | tail -1)

# install vim plugins
vim +PluginInstall +qall
