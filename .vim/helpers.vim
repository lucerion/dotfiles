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


func! s:gem_open(name)
  silent exec '!gem open ' . a:name
  exec 'redraw!'
endfunc

func! s:gem_autocomplete(A, L, C)
  let l:all = systemlist('gem list')
  let l:filtered = filter(copy(l:all), 'v:val =~ a:A')
  return map(copy(l:filtered), 'substitute(v:val, " (.*)", "", "g")')
endfunc


func! s:grep_command(pattern)
  let l:pattern = len(a:pattern) ? a:pattern : expand('<cword>')
  exec 'Unite grep -input=' . l:pattern
endfunc


comm! -nargs=+ -complete=customlist,s:gem_autocomplete GemOpen call s:gem_open(<q-args>)
comm! GS exec 'Gstatus | resize 20'
comm! -nargs=? Grep call s:grep_command(<q-args>)
