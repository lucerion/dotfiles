if filereadable(expand('~/.vim/autoload/plug.vim'))
  call plug#begin('~/.vim/plugins')
  for plugins_file in split(expand('~/.vim/settings/plugins/*.vim'), '\n')
    silent exec 'source ' . plugins_file
  endfor
  call plug#end()
endif

source ~/.vim/settings/options.vim
source ~/.vim/settings/mappings.vim
source ~/.vim/settings/commands.vim

if filereadable(expand('~/.vim/settings/options.local.vim'))
  source ~/.vim/settings/options.local.vim
endif
