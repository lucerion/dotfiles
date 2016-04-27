PLUGINS_DIR = ~/.vim/bundle
VUNDLE_DIR = ~/.vim/bundle/Vundle.vim
VUNDLE_REPOSITORY = https://github.com/VundleVim/Vundle.vim

setup:
	mkdir -p $(PLUGINS_DIR)
	if [ ! -d $(VUNDLE_DIR) ]; then git clone $(VUNDLE_REPOSITORY) $(PLUGINS_DIR); fi
