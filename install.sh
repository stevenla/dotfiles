#! /bin/bash

PWD=$(pwd)

( curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher ) &&
( rm -f ~/.config/fish/config.fish && ln -s $PWD/fish/config.fish ~/.config/fish/config.fish ) &&
( rm -f ~/.config/fish/fishfile && ln -s $PWD/fish/fishfile ~/.config/fish/fishfile ) &&
echo "Installed fisherman!" &&

( rm -f ~/.zshrc && ln -s $PWD/zsh/zshrc ~/.zshrc ) &&
echo "Linked zsh config!" &&

( rm -f ~/.vimrc && ln -s $PWD/vim/vimrc ~/.vimrc ) &&
( rm -rf ~/.vim && ln -s $PWD/vim ~/.vim ) &&
echo "Linked vim config!" &&

( rm -f ~/.tmux.conf && ln -s $PWD/tmux/tmux.conf ~/.tmux.conf) &&
echo "Linked tmux config!" &&

( git clone https://github.com/gmarik/vundle.git vim/bundle/vundle ) &&
( vim +BundleInstall +qall ) &&
echo "Installed Vundle!" &&

echo "Successfully installed dotfiles!" ||
echo "Install failed"
