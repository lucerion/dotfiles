func! helpers#init_plugin_manager() abort
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

func! helpers#is_plugin_loaded(plugin_name, ...) abort
  let l:loaded_flag = get(a:000, 0, '')
  let l:is_plugin_loaded = len(l:loaded_flag) ? exists(l:loaded_flag) : 1

  return exists('g:loaded_plug') && isdirectory(expand('~/.vim/plugins/' . a:plugin_name)) && l:is_plugin_loaded
endfunc

func! helpers#unite_grep(selected_symbols_count, input) abort
  if a:selected_symbols_count >= 1
    try
      let l:register_previous_value = @z
      normal! gv"zy
      let l:input = @z
    finally
      let @z = l:register_previous_value
    endtry
  else
    let l:input = empty(a:input) ? expand('<cword>') : a:input
  endif

  silent exec 'Unite grep -input=' . escape(l:input, ' \\.')
endfunc

func! helpers#smartword_toggle() abort
  if !exists('g:smartword_mode')
    let g:smartword_mode = 1
  else
    let g:smartword_mode = !g:smartword_mode
  endif

  let l:actions = {
    \ 'w':  '<Plug>(smartword-w)',
    \ 'b':  '<Plug>(smartword-b)',
    \ 'e':  '<Plug>(smartword-e)',
    \ 'ge': '<Plug>(smartword-ge)',
    \ }

  for [l:motion, l:action] in items(l:actions)
    for l:mode in ['n', 'v', 'o']
      let l:mapping = get(g:smartword_mappings, l:motion)
      if !empty(l:mapping)
        if g:smartword_mode
          exec l:mode.'map' l:mapping l:action
        else
          exec l:mode.'unmap' l:mapping
        end
      end
    endfor
  endfor
endfunc

func! helpers#smartword_status() abort
  return '[SmartWord: ' . (get(g:, 'smartword_mode', 0) ? 'on' : 'off') . ']'
endfunc
