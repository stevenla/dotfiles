#! /bin/bash

PWD=$(pwd)

( curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher ) &&
( rm -f ~/.config/fish/config.fish && ln -s $PWD/fish/config.fish ~/.config/fish/config.fish ) &&
( rm -f ~/.config/fish/fishfile && ln -s $PWD/fish/fishfile ~/.config/fish/fishfile ) &&
( fisher ) &&
echo "Installed fisherman!" &&

( git clone https://github.com/robbyrussell/oh-my-zsh.git $PWD/zsh/oh-my-zsh) &&
( git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $PWD/zsh/custom/plugins/zsh-syntax-highlighting) &&
( rm -f ~/.zshrc && ln -s $PWD/zsh/zshrc ~/.zshrc ) &&
echo "Linked zsh config!" &&

( rm -f ~/.vimrc && ln -s $PWD/vim/vimrc ~/.vimrc ) &&
( rm -rf ~/.vim && ln -s $PWD/vim ~/.vim ) &&
echo "Linked vim config!" &&

( rm -f ~/.tmux.conf && ln -s $PWD/tmux/tmux.conf ~/.tmux.conf) &&
echo "Linked tmux config!" &&

( vim +PlugInstall +qa ) &&
echo "Installed Vundle!" &&

echo "Successfully installed dotfiles!" ||
echo "Install failed"
