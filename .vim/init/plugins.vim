if filereadable(expand('~/.vim/autoload/plug.vim'))
  call plug#begin('~/.vim/plugins')
  for plugins_file in split(expand('~/.vim/init/plugins/*.vim'), '\n')
    silent exec 'source ' . plugins_file
  endfor
  call plug#end()
endif
