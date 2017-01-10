#! /bin/bash

PWD=$(pwd)

( git clone https://github.com/robbyrussell/oh-my-zsh.git $PWD/zsh/oh-my-zsh) &&
( git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $PWD/zsh/custom/plugins/zsh-syntax-highlighting) &&

( rm -f ~/.vimrc && ln -s $PWD/vim/vimrc ~/.vimrc ) &&
( rm -rf ~/.vim && ln -s $PWD/vim ~/.vim ) &&
echo "Linked vim config!" &&

( rm -f ~/.zshrc && ln -s $PWD/zsh/zshrc ~/.zshrc ) &&
echo "Linked zsh config!" &&

( rm -f ~/.tmux.conf && ln -s $PWD/tmux/tmux.conf ~/.tmux.conf) &&
echo "Linked tmux config!" &&

( git clone https://github.com/gmarik/vundle.git vim/bundle/vundle ) &&
( vim +BundleInstall +qall ) &&
echo "Installed Vundle!" &&

echo "Successfully installed dotfiles!" ||
echo "Install failed"
