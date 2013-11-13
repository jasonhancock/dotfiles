#!/bin/bash

FILES=".bash_profile .bashrc .gvimrc .vimrc .rpmmacros .vagrant.d/Vagrantfile .vagrant.d/bootstrap.sh"

cd ~

for f in $FILES
do
    if [ -f ~/$f ]; then
        rm $f
    fi
    ln -s ~/development/dotfiles/$f ~/$f
done
