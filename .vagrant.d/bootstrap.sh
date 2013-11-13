#!/usr/bin/env bash

# TODO: update to support other distros
export DEBIAN_FRONTEND=noninteractive
apt-get update > /dev/null
apt-get -y install vim

wget -q -O /home/vagrant/.vimrc https://raw.github.com/jasonhancock/dotfiles/master/.vimrc
