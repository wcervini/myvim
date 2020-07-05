#!/bin/sh
set -e

#cd ~/.vim
cat ~/myvim/myvim.vim > ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall 
echo "Installed the MyVim configuration successfully! Enjoy :-)"wq

