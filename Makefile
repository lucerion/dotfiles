.DEFAULT_GOAL := update

CONFIGS = .i3 .vifm .vim .Xresources .aliases .conky.conf .iex .tigrc .zshrc


setup:
	for config in $(CONFIGS); do ln -si `pwd`/$$config ~/; done
	ln -si `pwd`/libinput-gestures.conf ~/.config
	cp .conky.conf ~/.conky.conf
	touch ~/.Xresources.local

clean:
	for config in $(CONFIGS); do rm ~/$$config; done

update:
	git pull origin master


i3.merge:
	cd .i3; [ -f ./config.local ] && cat config.base config.local > config || cat config.base > config

i3.clean:
	cd .i3; rm config


vim.setup:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
