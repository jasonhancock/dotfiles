#!/bin/bash

FILES=".bash_profile .bashrc .gvimrc .vimrc"

cd ~

for f in $FILES
do
    if [ -f ~/$f ]; then
        rm $f
    fi
    ln -s ~/development/dotfiles/$f
done
