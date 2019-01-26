func! config#plugin#loaded(plugin_name) abort
  return exists('g:loaded_plug') && isdirectory(expand('~/.vim/plugins/' . a:plugin_name))
endfunc
