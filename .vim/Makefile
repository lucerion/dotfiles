.DEFAULT_GOAL := setup

PLUGINS_DIR = ~/.vim/bundle
VUNDLE_DIR = ~/.vim/bundle/Vundle.vim
VUNDLE_REPOSITORY = https://github.com/VundleVim/Vundle.vim

VIM_DIR = ~/.vim
NEOVIM_DIR = ~/.config/neovim


setup:
	mkdir -p $(PLUGINS_DIR)
	if [ ! -d $(VUNDLE_DIR) ]; then git clone $(VUNDLE_REPOSITORY) $(VUNDLE_DIR); fi
	if [ -n $(nvim) ]; then ln -s $(VIM_DIR) $(NEOVIM_DIR); ln -s vimrc init.vim; fi

clean:
	if [ -n $(nvim) ]; then rm $(NEOVIM_DIR); rm init.vim; fi
