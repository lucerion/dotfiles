func! s:init_plugin_manager() abort
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

comm! GS exec 'Gstatus | resize ' . (&lines / (tabpagewinnr(tabpagenr(), '$') + 1))
comm! -nargs=? Grep exec 'Unite grep -input=' . (len(<q-args>) ? <q-args> : expand('<cword>'))
