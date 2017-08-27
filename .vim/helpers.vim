func! s:init_plugin_manager()
  if !filereadable(expand('~/.vim/autoload/plug.vim'))
    return
  endif
  call plug#begin('~/.vim/plugins')
  source ~/.vim/plugins.vim
  if filereadable(expand('~/.vim/plugins.local.vim'))
    source ~/.vim/plugins.local.vim
  endif
  call plug#end()
endfunc

call s:init_plugin_manager()

func! s:grep_command(pattern)
  let l:pattern = len(a:pattern) ? a:pattern : expand('<cword>')
  exec 'Unite grep -input=' . l:pattern
endfunc

comm! GS exec 'Gstatus | resize 20'
comm! -nargs=? Grep call s:grep_command(<q-args>)
