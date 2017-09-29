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


func! s:smartword_toggle() abort
  if !exists('g:smartword_mode')
    let g:smartword_mode = 1
  else
    let g:smartword_mode = !g:smartword_mode
  endif

  let l:actions = {
    \ 'w': '<Plug>(smartword-w)',
    \ 'b': '<Plug>(smartword-b)',
    \ 'e': '<Plug>(smartword-e)',
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

func! SmartWordStatus() abort
  return '[SmartWord: ' . (get(g:, 'smartword_mode', 0) ? 'on' : 'off') . ']'
endfunc


comm! GS exec 'Gstatus | resize ' . (&lines / (tabpagewinnr(tabpagenr(), '$') + 1))
comm! -nargs=? Grep exec 'Unite grep -input=' . (len(<q-args>) ? <q-args> : expand('<cword>'))
comm! SmartWordToggle call s:smartword_toggle()
