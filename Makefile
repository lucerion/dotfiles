.DEFAULT_GOAL := update

CONFIGS = .i3 .vifm .vim .Xresources .aliases .conky.conf .zshrc


setup:
	for config in $(CONFIGS); do ln -si `pwd`/$$config ~/; done

clean:
	for config in $(CONFIGS); do rm ~/$$config; done

update:
	git pull origin master
