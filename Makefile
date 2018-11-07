.DEFAULT_GOAL := update
.PHONY: setup clean update backup restore i3config

SETUP_DIR ?= ~
BACKUP_DIR ?= ~/local_configs_backup

USER_CONFIGS = $(SETUP_DIR)/.config/conky \
							 $(SETUP_DIR)/.config/i3 \
							 $(SETUP_DIR)/.config/vifm \
							 $(SETUP_DIR)/.vim \
							 $(SETUP_DIR)/.aliases \
							 $(SETUP_DIR)/.tigrc \
							 $(SETUP_DIR)/.Xresources \
							 $(SETUP_DIR)/.zshrc

ROOT_CONFIGS = $(SETUP_DIR)/.config/vifm \
							 $(SETUP_DIR)/.vim \
							 $(SETUP_DIR)/.aliases \
							 $(SETUP_DIR)/.Xresources \
							 $(SETUP_DIR)/.zshrc

LOCAL_CONFIGS = .config/i3/config.local \
								.vim/settings/plugins/local.vim \
								.vim/settings/*.local.vim \
								.config/vifm/*.local \
								.Xresources.local

ifeq (${USER}, root)
CONFIGS = $(ROOT_CONFIGS)
else
CONFIGS = $(USER_CONFIGS)
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

backup:
	$(call copy, $(SETUP_DIR), $(BACKUP_DIR))

restore:
	$(call copy, $(BACKUP_DIR), $(SETUP_DIR))

i3config:
	cd $(SETUP_DIR)/.config/i3; [ -f config.local ] && cat config.base config.local > config || cp config.base config


define copy
	for config in $(LOCAL_CONFIGS); do \
		if [ -f $$config ]; then \
			mkdir -p $2/$$(dirname $$config) && cp $1/$$config $2/$$config; \
		fi \
	done
endef
