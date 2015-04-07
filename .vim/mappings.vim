let mapleader = " "

nmap <F2>      :VimFilerExplorer<CR>
vmap <F2> <Esc>:VimFilerExplorer<CR>i
imap <F2> <Esc>:VimFilerExplorer<CR>i

nmap <F3>      :TagbarToggle<CR>
vmap <F3> <Esc>:TagbarToggle<CR>i
imap <F3> <Esc>:TagbarToggle<CR>i

noremap <S-l> gt
noremap <S-h> gT

noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

noremap <Leader>gr :Ack!<Space>
noremap <Leader>f :FindAll<Space>

noremap <Leader>gs :Gstatus<CR>

noremap <Leader>j :SplitjoinJoin<CR>
noremap <Leader>s :SplitjoinSplit<CR>

noremap <Leader>nw :WidenRegion<CR>

map <Leader>ra :call RunAllSpecs()<CR>
map <Leader>rd :call RunDirSpecs()<CR>
map <Leader>rf :call RunCurrentSpecFile()<CR>
map <Leader>rl :call RunNearestSpec()<CR>
map <Leader>rr :call RunLastSpec()<CR>

noremap <Leader>os :VimFilerSplit -horizontal -find -force-quit<CR>
noremap <Leader>ov :VimFilerSplit -find -force-quit<CR>

noremap <Leader>of :CtrlPBufTagAll<CR>
noremap <Leader>ot :CtrlPTag<CR>

autocmd FileType vimfiler call s:set_vimfiler_mappings()
func! s:set_vimfiler_mappings()
  nmap <buffer>q      <Plug>(vimfiler_hide)
  nmap <buffer><tab>  <Plug>(vimfiler_switch_to_another_vimfiler)
  nmap <buffer>j      <Plug>(vimfiler_loop_cursor_down)
  nmap <buffer>k      <Plug>(vimfiler_loop_cursor_up)
  nmap <buffer>l      <Plug>(vimfiler_smart_l)
  nmap <buffer>h      <Plug>(vimfiler_smart_h)
  nmap <buffer><CR>   <Plug>(vimfiler_cd_or_edit)
  nmap <buffer>gj     <Plug>(vimfiler_jump_last_child)
  nmap <buffer>gk     <Plug>(vimfiler_jump_first_child)
  nmap <buffer>o      <Plug>(vimfiler_expand_tree)
  nmap <buffer>O      <Plug>(vimfiler_expand_tree_recursive)
  nmap <buffer>s      <Plug>(vimfiler_split_edit_file)
  nmap <buffer>v      <Plug>(vimfiler_toggle_mark_current_line)
  nmap <buffer><expr>t vimfiler#do_switch_action('tabopen')
  nmap <buffer>?      <Plug>(vimfiler_help)
  nmap <buffer>gs     <Plug>(vimfiler_toggle_safe_mode)
  nmap <buffer>r      <Plug>(vimfiler_rename_file)
  nmap <buffer>m      <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_move_file)
  nmap <buffer>y      <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_copy_file)
  nmap <buffer>d      <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_delete_file)
  nmap <buffer>nd     <Plug>(vimfiler_make_directory)
  nmap <buffer>nf     <Plug>(vimfiler_new_file)
  nmap <buffer>Y      <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_clipboard_copy_file)
  nmap <buffer>M      <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_clipboard_move_file)
  nmap <buffer>P      <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_clipboard_paste)
  nmap <buffer>yp     <Plug>(vimfiler_yank_full_path)
  nmap <buffer>!      <Plug>(vimfiler_execute_shell_command)
  nmap <buffer>e      <Plug>(vimfiler_execute_external_filer)
  nmap <buffer>cd     <Plug>(vimfiler_cd_input_directory)
endfunc
