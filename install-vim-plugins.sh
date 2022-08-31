#!/bin/bash

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
git clone https://github.com/rodjek/vim-puppet.git ~/.vim/bundle/vim-puppet
git clone https://github.com/hashivim/vim-terraform.git ~/.vim/bundle/vim-terraform
git clone https://github.com/posva/vim-vue.git ~/.vim/bundle/vim-vue
git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform
