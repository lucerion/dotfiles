.DEFAULT_GOAL := update
.PHONY: setup clean update vim i3

ifeq (${USER}, root)
CONFIGS = ~/.config/vifm ~/.vim ~/.aliases ~/.Xresources ~/.zshrc
else
CONFIGS = ~/.config/conky ~/.config/i3 ~/.config/vifm ~/.vim ~/.aliases ~/.iex.exs ~/.tigrc ~/.Xresources ~/.zshrc
endif


~/.config/conky: .config/conky
	mkdir -p $(dir $@)
	cp -r $< $@

~/.config/%: .config/%
	mkdir -p $(dir $@)
	ln -si `pwd`/$< $@

~/.vim: .vim
	ln -si `pwd`/$< $@
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

~/.Xresources: .Xresources
	ln -si `pwd`/$< $@
	touch ~/.Xresources.local
	xrdb -merge $@

~/%: %
	ln -si `pwd`/$< $@


setup: $(CONFIGS)

clean:
	for config in $(CONFIGS); do rm $$config; done

update:
	git pull origin master

i3:
	cd ~/.config/i3; [ -f config.local ] && cat config.base config.local > config || cat config.base > config
