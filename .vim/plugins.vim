Plug 'roosta/vim-srcery'
Plug 'airblade/vim-rooter'
Plug 'Shougo/vimfiler.vim'
" Plug 'Shougo/neossh.vim'
Plug 'Shougo/unite.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'gabesoft/vim-ags'
" Plug 'majutsushi/tagbar'
if v:version >= 800 || has('nvim')
  Plug 'w0rp/ale'
else
  Plug 'vim-syntastic/syntastic'
endif
Plug 'othree/vim-autocomplpop'
Plug 'vim-scripts/cmdline-completion'
Plug 'google/vim-searchindex'
" Plug 'szw/vim-tags'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'tyru/caw.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'sickill/vim-pasta'
Plug 'AndrewRadev/whitespaste.vim'
Plug 'tpope/vim-endwise'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ck3g/vim-change-hash-syntax', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
Plug 'lucerion/vim-i18n-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim', 'javascript', 'coffee'] }
Plug 'tpope/vim-rvm'
" Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'lucerion/vim-rubygems'
Plug 'janko-m/vim-test'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'gregsexton/MatchTag', { 'for': 'html' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/committia.vim'
Plug 'int3/vim-extradite'
Plug 'lucerion/vim-trailing-whitespace'
Plug 'kshenoy/vim-signature'
" Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }
Plug 'lucerion/vim-extract'
Plug 'brooth/far.vim'
Plug 'pelodelfuego/vim-swoop'
Plug 'osyo-manga/vim-over'
Plug 'mkitt/tabline.vim'
Plug 'bogado/file-line'
Plug 'michaeljsmith/vim-indent-object'
Plug 'gorkunov/smartpairs.vim'
Plug 'AndrewRadev/dsf.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/deleft.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'kana/vim-smartword'
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'lucerion/vim-executor'
Plug 'lucerion/vim-reload'
Plug 'vim-utils/vim-husk'
" Dependencies
Plug 'Shougo/vimproc.vim', {'do' : 'make'}  " vimfiler, neossh
Plug 'MarcWeber/vim-addon-mw-utils'         " snipmate
Plug 'tomtom/tlib_vim'                      " snipmate
Plug 'vim-scripts/l9'                       " vim-autocomplpop
Plug 'lucerion/vim-buffr'                   " vim-extract, vim-executor
Plug 'kana/vim-textobj-user'
" Plug 'edsono/vim-matchit'                   " vim-ruby-refactoring
