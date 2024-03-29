zsh:
	git submodule init `pwd`/zsh/zsh-snap
	git submodule update `pwd`/zsh/zsh-snap
	echo "[[ \044- == *i* ]] && source `pwd`/zsh/zshrc" >> ~/.zshrc

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
	defaults write NSGlobalDomain com.apple.mouse.scaling -1
	defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

update:
	git submodule update --remote

all: zsh vim tmux

mac: all karabiner defaults

.PHONY: zsh vim tmux karabiner defaults
