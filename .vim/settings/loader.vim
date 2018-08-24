source ~/.vim/settings/options.vim
source ~/.vim/settings/mappings.vim
source ~/.vim/settings/commands.vim

if filereadable(expand('~/.vim/settings/options.local.vim'))
  source ~/.vim/settings/options.local.vim
endif
