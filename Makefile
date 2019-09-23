.DEFAULT_GOAL := update
.PHONY: setup clean update i3config backup restore

SETUP_DIR ?= ~
BACKUP_DIR ?= ~/local_configs_backup

USER_CONFIGS = \
	$(SETUP_DIR)/.config/conky \
	$(SETUP_DIR)/.config/i3 \
	$(SETUP_DIR)/.config/vifm \
	$(SETUP_DIR)/.vim \
	$(SETUP_DIR)/.aliases \
	$(SETUP_DIR)/.tigrc \
	$(SETUP_DIR)/.Xresources \
	$(SETUP_DIR)/.zshrc

ROOT_CONFIGS = \
	$(SETUP_DIR)/.config/vifm \
	$(SETUP_DIR)/.vim \
	$(SETUP_DIR)/.aliases \
	$(SETUP_DIR)/.Xresources \
	$(SETUP_DIR)/.zshrc

BACKUP_CONFIGS ?= \
	.config/i3/config.local \
	.vim/after/plugin/*.local.vim \
	.config/vifm/*.local \
	.Xresources.local \
	.shrc.local \
	.aliases.local

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

backup_local:
	$(call copy, $(SETUP_DIR), $(BACKUP_DIR))

restore_local:
	$(call copy, $(BACKUP_DIR), $(SETUP_DIR))

i3config:
	cd $(SETUP_DIR)/.config/i3; ([ -f config.local ] && cat config.base config.local > config) || cp config.base config


define copy
	for config in $(BACKUP_CONFIGS); do \
		[ -f $1/$$config ] && mkdir -p $2/$$(dirname $$config) && cp $1/$$config $2/$$config; \
	done
endef
