if lucerion#plugin#loaded('srcery-vim')
  colorscheme srcery
  let [g:srcery_bold, g:srcery_italic, g:srcery_underline] = [0, 0, 0]
endif

if executable('ag')
  let g:grep_program = 'ag'
  let g:grep_options = ' --vimgrep --hidden --silent'

  exec 'set grepprg=' . fnameescape(g:grep_program . g:grep_options)
endif

set statusline=%w%h\ %F\ %m
if lucerion#plugin#loaded('vim-fugitive')
  set statusline+=\ %{fugitive#statusline()}
endif
if lucerion#plugin#loaded('vim-smartword')
  set statusline+=\ %{smartword#status()}
endif
set statusline+=\ %r%=%l-%v/%L

" ctrlp.vim
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_use_caching = 0
let g:ctrlp_show_hidden = 1
if exists('g:grep_program')
  let g:ctrlp_grep_command = g:grep_program . g:grep_options
endif

" ctrlp-py-matcher
if lucerion#plugin#loaded('ctrlp-py-matcher')
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
if lucerion#plugin#loaded('vimfiler.vim')
  call vimfiler#custom#profile('default', 'context', { 'columns': 'size', 'safe': 0 })
endif

" emmet-vim
let g:user_emmet_leader_key = '<C-e>'

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

" vim-smartword
let g:smartword_enabled = 1

" unite.vim
let g:unite_enable_auto_select = 0
if lucerion#plugin#loaded('unite.vim')
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
  \ 'ruby': ['ruby', 'rubocop', 'reek'],
  \ 'elixir': ['credo', 'dialyxir'],
  \ 'javascript': ['eslint']
  \ }
let g:ale_fixers = {
  \ 'ruby': ['rubocop'],
  \ 'elixir': ['mix_format'],
  \ 'javascript': ['eslint'],
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
