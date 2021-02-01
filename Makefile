zsh:
	rm -f ~/.zshrc
	ln -s `pwd`/zsh/zshrc ~/.zshrc

vim:
	rm -f ~/.vimrc
	rm -rf ~/.vim
	ln -s `pwd`/vim/vimrc ~/.vimrc
	ln -s `pwd`/vim ~/.vim
	vim +PlugInstall +qa

tmux:
	rm -f ~/.tmux.conf
	ln -s `pwd`/tmux/tmux.conf ~/.tmux.conf

karabiner:
	mkdir -p ~/.config
	ln -s `pwd`/karabiner ~/.config

defaults:
	defaults write .GlobalPreferences com.apple.mouse.scaling -1

all: zsh vim tmux

mac: all karabiner defaults

.PHONY: zsh vim tmux karabiner defaults
