func! settings#smartword#toggle() abort
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

func! settings#smartword#status() abort
  return '[SmartWord: ' . (get(g:, 'smartword_mode', 0) ? 'on' : 'off') . ']'
endfunc
