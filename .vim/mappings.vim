func! s:vundle_init()
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  source ~/.vim/plugins.vim
  if filereadable(expand('~/.vim/plugins.local.vim'))
    source ~/.vim/plugins.local.vim
  endif
  call vundle#end()
endfunc


" vim options

set nocompatible
set shortmess+=I

set nobackup
set nowritebackup
set noswapfile
set autoread

set history=128
set undolevels=1024

set mouse=a
set backspace=indent,eol,start
set clipboard=unnamedplus

set t_Co=256
set background=dark

set laststatus=2
set statusline=%w%h\ %F\ %m\ %{fugitive#statusline()}\ %r%=%l-%v/%L
set showcmd
set ruler
set showmode

set number
set nowrap
set sidescroll=20
set cursorline

set incsearch
set hlsearch
set ignorecase
set smartcase

set showmatch

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set splitright

filetype off

call s:vundle_init()

syntax on
filetype plugin indent on

colorscheme molokai

augroup vimrc_auto_reload
  autocmd!
  autocmd BufWritePost vimrc,vimrc.local,plugins.vim,plugins.local.vim
    \ source $MYVIMRC
augroup END

augroup set_makeprg
  autocmd!
  autocmd FileType ruby setl makeprg=ruby\ %
  autocmd FileType html setl makeprg=google-chrome\ %
augroup END


" plugins options

let g:ctrlp_reuse_window = 'help\|quickfix'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_use_caching = 0
let g:ctrlp_show_hidden = 0
let g:ctrlp_extensions = ['git_branch']
let g:ctrlp_funky_syntax_highlight = 1

let g:ack_default_options =
  \ ' -s -H --nocolor --nogroup --nofollow --column --smart-case' .
  \ ' --ignore-dir=tmp --ignore-dir=log' .
  \ ' --ignore-file=match:/.gitignore/'

let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextTextOmniPrecedence = []

let g:tagbar_compact = 1

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_no_default_key_mappings = 1
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern = ''
let g:vimfiler_time_format = '%Y-%m-%d %H:%M'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_readonly_file_icon = 'x'
call vimfiler#custom#profile('default', 'context', { 'columns': 'size' })

let g:user_emmet_leader_key = '<C-e>'

let g:find_all_ignore = ['tmp']

let g:vim_tags_auto_generate = 0
let g:vim_tags_ctags_binary = 'ripper-tags'

let g:monster#completion#rcodetools#backend = 'async_rct_complete'

let g:extra_whitespace_ignored_filetypes = ['vimfiler']


" mappings

let mapleader = " "

nmap <F2> :VimFilerExplorer<CR>
nmap <F3> :TagbarToggle<CR>

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

noremap <Leader>gr :Ack!<Space>
noremap <Leader>gf :FindAll<Space>

noremap <Leader>gs :Gstatus<CR>

noremap <Leader>j :SplitjoinJoin<CR>
noremap <Leader>s :SplitjoinSplit<CR>

map <Leader>ra :RSpecRunAll<CR>
map <Leader>rd :RSpecRunCurrentDir<CR>
map <Leader>rf :RSpecRunCurrentFile<CR>
map <Leader>rl :RSpecRunNearest<CR>
map <Leader>rr :RSpecRunLast<CR>

noremap <Leader>os :VimFilerSplit -horizontal -find -force-quit<CR>
noremap <Leader>ov :VimFilerSplit -find -force-quit<CR>

noremap <Leader>of :CtrlPBufTag<CR>
noremap <Leader>ot :CtrlPTag<CR>

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
  nmap <buffer>?        <Plug>(vimfiler_help)
endfunc


if filereadable(expand('~/.vim/vimrc.local'))
  source ~/.vim/vimrc.local
endif
