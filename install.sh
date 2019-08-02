#!/bin/bash

UNAME=$(uname)
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

git config --global core.excludesfile ~/development/dotfiles/.gitignore_global

# VSCode settings
if [ "$UNAME" == "Darwin" ]; then
  VSCODE_SETTINGS="$HOME/Library/Application Support/Code/User/settings.json"
  if [ -f "$VSCODE_SETTINGS" ] ; then
      rm -f "$VSCODE_SETTINGS"
  fi
  D=$(dirname "$VSCODE_SETTINGS")
  mkdir -p "$D"
  ln -s $HOME/development/dotfiles/settings.json "$D/settings.json"
fi

