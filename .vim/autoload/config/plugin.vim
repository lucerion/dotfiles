func! config#plugin#loaded(plugin_name, ...) abort
  let l:loaded_flag = get(a:000, 0, '')
  let l:is_plugin_loaded = len(l:loaded_flag) ? exists(l:loaded_flag) : 1

  return exists('g:loaded_plug') && isdirectory(expand('~/.vim/plugins/' . a:plugin_name)) && l:is_plugin_loaded
endfunc
