#! /bin/bash

$PWD=$(pwd)

echo "Initializing git submodules..." &&
( git submodule init && git submodule update ) &&

echo "Linking vim config..." &&
( rm -f ~/.vimrc && ln -s $PWD/vim/vimrc ~/.vimrc ) &&
( rm -f ~/.vim && ln -s $PWD/vim ~/.vim ) &&

echo "Linking zsh config..." &&
( rm -f ~/.zshrc && ln -s $PWD/zsh/zshrc ~/.zshrc ) &&

echo "Linking tmux config..." &&
( rm -f ~/.tmux.conf && ln -s $PWD/tmux/tmux.conf ~/.tmux.conf) &&

echo "Linking powerline..." &&
( rm -f ~/.config/powerline && ln -s $PWD/powerline ~/.config/powerline) &&

echo "Successfully installed dotfiles!" ||
echo "Install failed"
