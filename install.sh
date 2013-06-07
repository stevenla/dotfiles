#! /bin/sh
git submodule init &&
git submodule update &&
rm -f ~/.vimrc &&
ln -s ~/.vim/vimrc ~/.vimrc &&
echo "Successfully installed vimrc" ||
echo "Install failed"
