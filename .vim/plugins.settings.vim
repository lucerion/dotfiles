let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_use_caching = 0
let g:ctrlp_show_hidden = 0
" let g:ctrlp_extensions = ['git_branch']
if isdirectory(expand('~/.vim/bundle/ctrlp-cmatcher'))
  let g:ctrlp_match_func = { 'match' : 'matcher#cmatch' }
  let g:ctrlp_max_files = 0
  let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:1000'
endif

let g:ackprg = 'ag'
let g:ack_default_options = ' --vimgrep --silent --ignore=tmp --ignore=log'

let g:ags_agargs = {
  \ '--break'             : [ '', '' ],
  \ '--color'             : [ '', '' ],
  \ '--color-line-number' : [ '"1;30"', '' ],
  \ '--color-match'       : [ '"32;40"', '' ],
  \ '--color-path'        : [ '"1;31"', '' ],
  \ '--column'            : [ '', '' ],
  \ '--context'           : [ 'g:ags_agcontext', '-C' ],
  \ '--group'             : [ '', '' ],
  \ '--heading'           : [ '', '-H' ],
  \ '--max-count'         : [ 'g:ags_agmaxcount', '-m' ],
  \ }
highlight default link agsvFilePath Directory
highlight default link agsvLineNumMatch Keyword

" let g:tagbar_compact = 1

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_no_default_key_mappings = 1
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern = ' '
let g:vimfiler_time_format = '%Y-%m-%d %H:%M'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_readonly_file_icon = '×'
if isdirectory(expand('~/.vim/bundle/vimfiler.vim'))
  call vimfiler#custom#profile('default', 'context', { 'columns': 'size' })
endif

let g:user_emmet_leader_key = '<C-e>'

let g:find_by_regex_ignore = ['tmp', 'log']

" let g:vim_tags_auto_generate = 0
" let g:vim_tags_ctags_binary = 'ripper-tags'
" let g:vim_tags_project_tags_command = "{CTAGS} -R {DIRECTORY} -f .git/tags 2>/dev/null"

let g:extra_whitespace_ignored_filetypes = ['vimfiler', 'agsv']

let delimitMate_expand_cr = 1

let g:gitgutter_max_signs = 5000

let g:pasta_disabled_filetypes = ['agsv']

" let g:instant_markdown_autostart = 0
