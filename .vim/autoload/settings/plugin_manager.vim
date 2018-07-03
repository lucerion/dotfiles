func! settings#plugin_manager#init() abort
  if !filereadable(expand('~/.vim/autoload/plug.vim'))
    return
  endif

  call plug#begin('~/.vim/plugins')
    for l:plugin_file in split(globpath(expand('~/.vim/bundle'), '*.vim'), '\n')
      silent exec 'source ' . l:plugin_file
    endfor
  call plug#end()
endfunc

func! settings#plugin_manager#is_plugin_loaded(plugin_name, ...) abort
  let l:loaded_flag = get(a:000, 0, '')
  let l:is_plugin_loaded = len(l:loaded_flag) ? exists(l:loaded_flag) : 1

  return exists('g:loaded_plug') && isdirectory(expand('~/.vim/plugins/' . a:plugin_name)) && l:is_plugin_loaded
endfunc
