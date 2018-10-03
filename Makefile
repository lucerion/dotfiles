.DEFAULT_GOAL := update
.PHONY: setup clean update i3config

SETUP_DIR ?= ~/

ifeq (${USER}, root)
CONFIGS = $(SETUP_DIR)/.config/vifm \
          $(SETUP_DIR)/.vim \
          $(SETUP_DIR)/.aliases \
          $(SETUP_DIR)/.Xresources \
          $(SETUP_DIR)/.zshrc
else
CONFIGS = $(SETUP_DIR)/.config/conky \
          $(SETUP_DIR)/.config/i3 \
          $(SETUP_DIR)/.config/vifm \
          $(SETUP_DIR)/.vim \
          $(SETUP_DIR)/.aliases \
          $(SETUP_DIR)/.tigrc \
          $(SETUP_DIR)/.Xresources \
          $(SETUP_DIR)/.zshrc
endif

$(SETUP_DIR)/.config:
	mkdir -p $@

$(SETUP_DIR)/.config/conky: .config/conky
	cp -r $< $@

$(SETUP_DIR)/.vim: .vim
	ln -si `pwd`/$< $@
	curl -fLo $</autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

$(SETUP_DIR)/.Xresources: .Xresources
	ln -si `pwd`/$< $@
	touch $(SETUP_DIR)/.Xresources.local
	xrdb -merge $@

$(SETUP_DIR)/%: %
	ln -si `pwd`/$< $@


setup: $(SETUP_DIR)/.config $(CONFIGS)

clean:
	for config in $(CONFIGS); do rm $$config; done

update:
	git pull origin master

i3config:
	cd $(SETUP_DIR)/.config/i3; [ -f config.local ] && cat config.base config.local > config || cat config.base > config
