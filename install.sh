#!/bin/bash

FILES=".bash_profile .bashrc .gvimrc .vimrc .rpmmacros .vagrant.d/Vagrantfile .vagrant.d/bootstrap.sh .composer/auth.json"

cd ~

for f in $FILES
do
    if [ -f ~/$f ]; then
        rm $f
    fi

    DIR=`dirname $f`
    if [ "$DIR" != "." ]; then
        if [ ! -d "$DIR" ]; then
            mkdir -p ~/$DIR
        fi
    fi

    ln -s ~/development/dotfiles/$f ~/$f
done
