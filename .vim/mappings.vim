let mapleader = " "

noremap Q <Nop>
noremap <F1> <Nop>

noremap <S-l> gt
noremap <S-h> gT

noremap <Leader>tl :tabmove +1<CR>
noremap <Leader>th :tabmove -1<CR>
noremap <Leader>tL :tabmove <CR>
noremap <Leader>tH :tabmove 0<CR>

noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

vnoremap < <gv
vnoremap > >gv

" next paragraph beginning
noremap <Leader>jj })
" previous paragraph beginning
noremap <Leader>kk {(
" next paragraph end
noremap <Leader>J }}k
" previous paragraph end
noremap <Leader>K {k
" current paragraph beginning
noremap <Leader>jk }k
" current paragraph end
noremap <Leader>kj {j

nmap <silent> <Leader>ra :TestSuite<CR>
nmap <silent> <Leader>rd :TestSuite %:p:h<CR>
nmap <silent> <Leader>rf :TestFile<CR>
nmap <silent> <Leader>rn :TestNearest<CR>
nmap <silent> <Leader>rl :TestLast<CR>
nmap <silent> <Leader>rv :TestVisit<CR>

noremap <Leader>sj :SplitjoinJoin<CR>
noremap <Leader>ss :SplitjoinSplit<CR>

noremap <Leader>os :VimFilerSplit -horizontal -find -force-quit<CR>
noremap <Leader>ov :VimFilerSplit -find -force-quit<CR>
noremap <Leader>oe :VimFilerExplorer -find<CR>

noremap <Leader>of :CtrlPBufTag<CR>
noremap <Leader>ot :CtrlPTag<CR>
noremap <Leader>oq :CtrlPQuickfix<CR>

noremap <Leader>ee :Extr<CR>

autocmd FileType vimfiler call s:set_vimfiler_mappings()
func! s:set_vimfiler_mappings()
  nmap <buffer><CR>     <Plug>(vimfiler_cd_or_edit)
  nmap <buffer>q        <Plug>(vimfiler_hide)
  nmap <buffer><tab>    <Plug>(vimfiler_switch_to_another_vimfiler)
  nmap <buffer>j        <Plug>(vimfiler_loop_cursor_down)
  nmap <buffer>k        <Plug>(vimfiler_loop_cursor_up)
  nmap <buffer>l        <Plug>(vimfiler_smart_l)
  nmap <buffer>h        <Plug>(vimfiler_smart_h)
  nmap <buffer>gj       <Plug>(vimfiler_jump_last_child)
  nmap <buffer>gk       <Plug>(vimfiler_jump_first_child)
  nmap <buffer>o        <Plug>(vimfiler_expand_tree)
  nmap <buffer>O        <Plug>(vimfiler_expand_tree_recursive)
  nmap <buffer>s        <Plug>(vimfiler_split_edit_file)
  nmap <buffer><expr>t  vimfiler#do_switch_action('tabopen')
  nmap <buffer>v        <Plug>(vimfiler_toggle_mark_current_line)
  nmap <buffer>gs       <Plug>(vimfiler_toggle_safe_mode)
  nmap <buffer>r        <Plug>(vimfiler_rename_file)
  nmap <buffer>m        <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_move_file)
  nmap <buffer>y        <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_copy_file)
  nmap <buffer>d        <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_delete_file)
  nmap <buffer>nd       <Plug>(vimfiler_make_directory)
  nmap <buffer>nf       <Plug>(vimfiler_new_file)
  nmap <buffer>Y        <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_clipboard_copy_file)
  nmap <buffer>M        <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_clipboard_move_file)
  nmap <buffer>P        <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_clipboard_paste)
  nmap <buffer>yp       <Plug>(vimfiler_yank_full_path)
  nmap <buffer>cd       <Plug>(vimfiler_cd_input_directory)
  nmap <buffer>!        <Plug>(vimfiler_execute_shell_command)
  nmap <buffer>gf       <Plug>(vimfiler_find)
  nmap <buffer>gr       <Plug>(vimfiler_grep)
  nmap <buffer>g?       <Plug>(vimfiler_help)
endfunc

autocmd FileType agsv nnoremap <buffer> ot
  \ :exec 'tab split ' . ags#filePath(line('.'))<CR>
