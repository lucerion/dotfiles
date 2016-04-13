let s:vundle_dir = expand('~/.vim/bundle/Vundle.vim')
let s:vundle_repository = 'https://github.com/VundleVim/Vundle.vim'

func! s:init_vundle()
  if !isdirectory(s:vundle_dir)
    return
  endif
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  source ~/.vim/plugins.vim
  if filereadable(expand('~/.vim/plugins.local.vim'))
    source ~/.vim/plugins.local.vim
  endif
  call vundle#end()
endfunc

filetype off
call s:init_vundle()

func! s:install_vundle()
  if isdirectory(s:vundle_dir)
    echom 'Vundle already installed'
  else
    exec '!git clone ' . s:vundle_repository . ' ' . s:vundle_dir
  endif
endfunc

func! s:gem_open(name)
  exec 'silent !gem open ' . a:name
  exec 'redraw!'
endfunc

func! s:gem_autocomplete(A, L, C)
  let l:all = split(system('gem list'), '\n')
  let l:filtered = filter(copy(l:all), 'v:val =~ a:A')
  return map(copy(l:filtered), 'substitute(v:val, " (.*)", "", "g")')
endfunc

comm! Restart source $MYVIMRC
comm! InstallVundle call s:install_vundle()
comm! -nargs=+ -complete=customlist,s:gem_autocomplete GemOpen call s:gem_open(<q-args>)
