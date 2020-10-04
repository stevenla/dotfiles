zsh:
	rm -rf `pwd`/zsh/oh-my-zsh
	rm -rf `pwd`/zsh/custom/plugins/zsh-syntax-highlighting
	rm -f ~/.zshrc
	git clone https://github.com/robbyrussell/oh-my-zsh.git `pwd`/zsh/oh-my-zsh
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git `pwd`/zsh/custom/plugins/zsh-syntax-highlighting
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
