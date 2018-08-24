func! helpers#unite#grep(selected_symbols_count, input) abort
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
