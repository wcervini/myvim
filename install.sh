#!/bin/sh
set -e

#cd ~/.vim
cat ~/myvim/myvim.vim > ~/.vimrc
cp ~/myvim/.bashaliases > ~/.bash_aliases
source ~/.bash_aliases
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
echo "Installed the MyVim configuration successfully! Enjoy :-)"wq

