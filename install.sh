#! /bin/bash

PWD=$(pwd)

( git submodule init && git submodule update ) &&
echo "Initialized git submodules!" &&

( rm -f ~/.vimrc && ln -s $PWD/vim/vimrc ~/.vimrc ) &&
( rm -rf ~/.vim && ln -s $PWD/vim ~/.vim ) &&
echo "Linked vim config!" &&

( rm -f ~/.zshrc && ln -s $PWD/zsh/zshrc ~/.zshrc ) &&
echo "Linked zsh config!" &&

( rm -f ~/.tmux.conf && ln -s $PWD/tmux/tmux.conf ~/.tmux.conf) &&
echo "Linked tmux config!" &&

( vim +BundleInstall +qall ) &&
echo "Installed Vundles!" &&

echo "Successfully installed dotfiles!" ||
echo "Install failed"
