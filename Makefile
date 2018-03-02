fish:
	rm -f ~/.config/fish/config.fish
	rm -f ~/.config/fish/fishfile
	ln -s `pwd`/fish/config.fish ~/.config/fish/config.fish
	ln -s `pwd`/fish/fishfile ~/.config/fish/fishfile
	curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
	fish -c fisher

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

all: fish zsh vim tmux

.PHONY: fish zsh vim tmux
