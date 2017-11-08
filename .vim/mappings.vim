let mapleader = ' '

noremap Q <Nop>
noremap q <Nop>
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

" next paragraph begin
noremap <Leader>jj })
" next paragraph end
noremap <Leader>J }}k
" previous paragraph begin
noremap <Leader>kk {(
" previous paragraph end
noremap <Leader>K {k
" current paragraph begin
noremap <Leader>jk }k
" current paragraph end
noremap <Leader>kj {j

" vim-test
nmap <Leader>ra :TestSuite<CR>
nmap <Leader>rd :TestSuite %:p:h<CR>
nmap <Leader>rf :TestFile<CR>
nmap <Leader>rn :TestNearest<CR>
nmap <Leader>rl :TestLast<CR>
nmap <Leader>rv :TestVisit<CR>

" splitjoin.vim
noremap <Leader>sj :SplitjoinJoin<CR>
noremap <Leader>ss :SplitjoinSplit<CR>

" vimfiler.vim
noremap <Leader>os :VimFilerSplit -horizontal -find -force-quit<CR>
noremap <Leader>ov :VimFilerSplit -find -force-quit<CR>
noremap <Leader>oe :VimFilerExplorer -find -force-quit<CR>

autocmd FileType vimfiler call s:set_vimfiler_mappings()
func! s:set_vimfiler_mappings() abort
  nmap <buffer><CR>     <Plug>(vimfiler_cd_or_edit)
  nmap <buffer>q        <Plug>(vimfiler_hide)
  nmap <buffer><tab>    <Plug>(vimfiler_switch_to_another_vimfiler)
  nmap <buffer>j        <Plug>(vimfiler_loop_cursor_down)
  nmap <buffer>k        <Plug>(vimfiler_loop_cursor_up)
  nmap <buffer>l        <Plug>(vimfiler_smart_l)
  nmap <buffer>h        <Plug>(vimfiler_smart_h)
  nmap <buffer>gj       <Plug>(vimfiler_jump_last_child)
  nmap <buffer>gk       <Plug>(vimfiler_jump_first_child)
  nmap <buffer>gg       <Plug>(vimfiler_cursor_top)
  nmap <buffer>o        <Plug>(vimfiler_expand_tree)
  nmap <buffer>O        <Plug>(vimfiler_expand_tree_recursive)
  nmap <buffer><C-s>    <Plug>(vimfiler_split_edit_file)
  nmap <buffer><C-p>    <Plug>(vimfiler_preview_file)
  nmap <buffer><expr>t  vimfiler#do_switch_action('tabopen')
  nmap <buffer>i        <Plug>(vimfiler_cd_input_directory)
  nmap <buffer>cd       <Plug>(vimfiler_make_directory)
  nmap <buffer>cf       <Plug>(vimfiler_new_file)
  nmap <buffer>s        <Plug>(vimfiler_toggle_mark_current_line)
  nmap <buffer>r        <Plug>(vimfiler_rename_file)
  nmap <buffer>C        <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_copy_file)
  nmap <buffer>M        <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_move_file)
  nmap <buffer>D        <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_delete_file)
  nmap <buffer>dd       <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_clipboard_move_file)
  nmap <buffer>p        <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_clipboard_paste)
  nmap <buffer>yy       <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_clipboard_copy_file)
  nmap <buffer>yp       <Plug>(vimfiler_yank_full_path)
  nmap <buffer>!        <Plug>(vimfiler_execute_shell_command)
  nmap <buffer>gf       <Plug>(vimfiler_find)
  nmap <buffer>gr       <Plug>(vimfiler_grep)
  nmap <buffer>g?       <Plug>(vimfiler_help)
  nmap <buffer>*        <Plug>(vimfiler_set_current_mask)
  nmap <buffer>~        <Plug>(vimfiler_switch_to_home_directory)
  nmap <buffer>-        <Plug>(vimfiler_switch_to_project_directory)
endfunc

" ctrlp.vim
noremap <Leader>of :CtrlPBufTag<CR>
noremap <Leader>ot :CtrlPTag<CR>
noremap <Leader>ol :CtrlPLine<CR>

" vim-wordmotion
let g:wordmotion_mappings = {
  \ 'w':  '<Leader>w',
  \ 'b':  '<Leader>b',
  \ 'e':  '<Leader>e',
  \ 'ge': '<Leader>ge',
  \ 'aw': 'aw',
  \ 'iw': 'iw',
  \ '<C-R><C-W>': ''
  \ }

" vim-smartword
nmap Q :SmartWordToggle<CR>
let g:smartword_mappings = {
  \ 'w':  '<Leader>w',
  \ 'b':  '<Leader>b',
  \ 'e':  '<Leader>e',
  \ 'ge': '<Leader>ge'
  \ }

" sideways.vim
nmap <Leader>aj :SidewaysJumpLeft<CR>
nmap <Leader>ak :SidewaysJumpRight<CR>
nmap <Leader>aJ :SidewaysLeft<CR>
nmap <Leader>aK :SidewaysRight<CR>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" unite.vim
autocmd FileType unite call s:set_unite_mappings()
func! s:set_unite_mappings() abort
  iunmap <buffer><Tab>
  iunmap <buffer><C-p>
  iunmap <buffer><C-n>
  iunmap <buffer><CR>
  imap   <buffer><C-e> <Plug>(unite_move_head)
endfunc

" vim-ags
autocmd FileType agsv nnoremap <buffer> ot :exec 'tab split ' . ags#filePath(line('.'))<CR>

" far.vim
augroup FarMappings
  autocmd!
  autocmd FileType far_vim map <buffer><silent>q :q<CR>
  autocmd FileType far_vim map <buffer><silent>r Xi:Fardo<CR>I
augroup END
