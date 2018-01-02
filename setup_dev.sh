#!/bin/bash

mkdir -p ~/git/
cd ~/git
for repo in devotees/meta saulpw/visidata saulpw/vgit ; do
    git clone https://github.com/$repo
done

git clone https://gitlab.com/Kefala/devnotes


