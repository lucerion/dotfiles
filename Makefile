.DEFAULT_GOAL := update

CONFIGS = .config/i3 .config/vifm .vim .Xresources .aliases .iex.exs .tigrc .zshrc
ROOT_CONFIGS = .config/vifm .vim .Xresources .aliases .zshrc

ifeq (${USER}, root)
setup:
	for config in $(ROOT_CONFIGS); do ln -si `pwd`/$$config ~/$$config; done
	$(MAKE) xresources

clean:
	for config in $(ROOT_CONFIGS); do rm ~/$$config; done
else
setup:
	for config in $(CONFIGS); do ln -si `pwd`/$$config ~/$$config; done
	cp -i `pwd`/.conky.conf ~/.conky.conf
	$(MAKE) xresources

clean:
	for config in $(CONFIGS); do rm ~/$$config; done
endif

update:
	git pull origin master


i3.merge:
	cd .config/i3; [ -f ./config.local ] && cat config.base config.local > config || cat config.base > config

i3.clean:
	cd .config/i3; rm config


vim.setup:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


xresources:
	touch ~/.Xresources.local
	cd ~/; xrdb -merge .Xresources
