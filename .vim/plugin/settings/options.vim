" ctrlp.vim
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_use_caching = 0
let g:ctrlp_show_hidden = 0
if exists('g:grep_program')
  let g:ctrlp_grep_command = g:grep_program . g:grep_options
endif

" ctrlp-py-matcher
if settings#plugin_manager#is_plugin_loaded('ctrlp-py-matcher')
  let g:ctrlp_match_func = { 'match' : 'pymatcher#PyMatch' }
  let g:ctrlp_max_files = 0
  let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:1000'
endif

" vim-ags
" removed: --filename, --numbers
let g:ags_agargs = {
  \ '--color-match':        ['"32;40"', ''],
  \ '--column':             ['', ''],
  \ '--color':              ['', ''],
  \ '--context':            ['g:ags_agcontext', '-C'],
  \ '--group':              ['', ''],
  \ '--heading':            ['', '-H'],
  \ '--color-path':         ['"1;31"', ''],
  \ '--color-line-number':  ['"1;30"', ''],
  \ '--max-count':          ['g:ags_agmaxcount', '-m'],
  \ '--break':              ['', ''],
  \ '--ignore':             ['tmp', ''],
  \ }

" tagbar
let g:tagbar_compact = 1

" vimfiler.vim
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_no_default_key_mappings = 1
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern = ' '
let g:vimfiler_time_format = '%Y-%m-%d %H:%M'
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_readonly_file_icon = '×'
if settings#plugin_manager#is_plugin_loaded('vimfiler.vim')
  call vimfiler#custom#profile('default', 'context', { 'columns': 'size', 'safe': 0 })
endif

" emmet-vim
let g:user_emmet_leader_key = '<C-e>'

" vim-tags
let g:vim_tags_auto_generate = 0
let g:vim_tags_ctags_binary = 'ripper-tags'
let g:vim_tags_use_language_field = 0

" vim-trailing-whitespace
let g:extra_whitespace_ignored_filetypes = ['vimfiler', 'agsv', 'far_vim', 'conque_term']

" delimitMate
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
let delimitMate_expand_inside_quotes = 1
augroup delimitMate_quotes
  autocmd!
  autocmd FileType ruby,eruby,haml,slim let delimitMate_quotes = "\" ' ` |"
augroup END

" vim-gitgutter
let g:gitgutter_max_signs = 5000
autocmd BufWritePost * GitGutter

" vim-pasta
let g:pasta_disabled_filetypes = ['vimfiler', 'agsv']

" splitjoin.vim
let g:splitjoin_ruby_hanging_args = 0

" vim-instant-markdown
let g:instant_markdown_autostart = 0

" vim-extradite
let g:extradite_showhash = 1

" vim-extract
let g:extract_hidden = 1

" vim-executor
let g:executor_reuse_buffer = 1

" unite.vim
let g:unite_enable_auto_select = 0
if settings#plugin_manager#is_plugin_loaded('unite.vim')
  call unite#custom#profile('default', 'context', {
    \   'direction':    'below',
    \   'prompt':       '> ',
    \   'prompt_focus': 1
    \ })
endif
if exists('g:grep_program')
  let g:unite_source_grep_command = g:grep_program
  let g:unite_source_grep_default_opts = g:grep_options
endif

" ale
let g:ale_sign_warning = '>'
let g:ale_echo_msg_format = '[%linter%] %severity%: %s'
let g:ale_linters = {
  \ 'ruby': ['ruby', 'rubocop', 'reek']
  \ }

" far.vim
let g:far#preview_window_height = 15
let g:far#file_mask_favorites = [
  \ '%',
  \ '**/*.*',
  \ '**/*.rb',
  \ '**/*.js',
  \ '**/*.coffee',
  \ '**/*.html',
  \ '**/*.erb',
  \ '**/*.haml',
  \ '**/*.slim',
  \ '**/*.css',
  \ '**/*.scss',
  \ '**/*.less',
  \ '**/*.vim',
  \ '**/*.exs',
  \ ]
if exists('g:grep_program')
  let g:far#source = g:grep_program
  let g:far#file_mask_favorites = [
    \ '%',
    \ '\.rb$',
    \ '\.js$',
    \ '\.coffee$',
    \ '\.html$',
    \ '\.erb$',
    \ '\.haml$',
    \ '\.slim$',
    \ '\.css$',
    \ '\.scss$',
    \ '\.less$',
    \ '\.vim$',
    \ '\.exs$'
    \ ]
endif