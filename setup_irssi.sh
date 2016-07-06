#!/bin/sh

#wget https://scripts.irssi.org/scripts/cap_sasl.pl -O ~/dotfiles/bin/

mkdir -p ~/.irssi/scripts/autorun

ln -sf ~/dotfiles/bin/cap_sasl.pl ~/.irssi/scripts/autorun/

ln -sf ~/dotfiles/irssi.config ~/.irssi/config

