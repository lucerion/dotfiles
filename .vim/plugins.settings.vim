filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
source ~/.vim/plugins.vim
call vundle#end()
syntax on
filetype plugin indent on

colorscheme molokai

let g:ctrlp_reuse_window = 'help\|quickfix'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_use_caching = 0
let g:ctrlp_show_hidden = 0

let g:ack_default_options =
  \ " -s -H --nocolor --nogroup --nofollow --column --smart-case --ignore-dir=tmp --ignore-file=match:/.gitignore/"

let g:SuperTabDefaultCompletionType = 'context'

let g:tagbar_compact = 1

let g:undotree_WindowLayout = 2

let g:git_branch_status_head_current = 1
let g:git_branch_status_text = ""
let g:git_branch_status_nogit = ""

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_no_default_key_mappings = 1
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern = ''
let g:vimfiler_time_format = '%Y-%m-%d %H:%M'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_readonly_file_icon = 'x'

let g:extra_whitespace_ignored_filetypes =
  \ ['vimfiler', 'vimfiler:default', 'vimfiler:explorer']

let g:user_emmet_leader_key = '<C-e>'

command! Ghist Extradite
