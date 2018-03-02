fish:
	curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
	rm -f ~/.config/fish/config.fish && ln -s `pwd`/fish/config.fish ~/.config/fish/config.fish
	rm -f ~/.config/fish/fishfile && ln -s `pwd`/fish/fishfile ~/.config/fish/fishfile
	fish -c fisher

.PHONY: fish
