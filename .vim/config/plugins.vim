if filereadable(expand('~/.vim/autoload/plug.vim'))
  call plug#begin('~/.vim/plugins')
  for plugin in split(expand('~/.vim/config/plugins/*.vim'), '\n')
    silent exec 'source ' . plugin
  endfor
  call plug#end()
endif
