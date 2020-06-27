#!/bin/sh
set -e

cd ~/.vim
cat ~/.vim/myvim.vim > ~/.vimrc
echo "Installed the MyVim configuration successfully! Enjoy :-)"