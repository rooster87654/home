" Use vim settings, rather then vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible    " required by vundle
filetype off        " required by vundle

set expandtab    " dont use tabs

" set nowrap        " don't wrap lines
set softtabstop=2     " a tab is four spaces
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

set nolist	" don't show invisible characters by default,
                " but it is enabled for some file types (see later)

set hidden

set pastetoggle=<F2>

nnoremap ; :

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let g:syntastic_html_tidy_blocklevel_tags = [
\  'app-page',
\  'button',
\  'core-drawer-panel',
\  'core-icon',
\  'core-icon-button',
\  'core-list',
\  'core-header-panel',
\  'core-toolbar',
\  'dom-module',
\  'paper-tabs',
\  'paper-tab',
\  'paper-shadow',
\  'paper-button',
\  'paper-icon-button',
\  'template'
\]

let g:syntastic_html_tidy_ignore_errors = [ 
\ '<body> proprietary attribute "unresolved"',
\ '<div> proprietary attribute "flex"',
\ '<div> proprietary attribute "fullbleed"',
\ '<div> proprietary attribute "layout"',
\ '<div> proprietary attribute "horizontal"',
\ '<div> proprietary attribute "vertical"',
\]


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized' 

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'rust-lang/rust.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
call glaive#Install()
Glaive codefmt plugin[mappings]
" Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"
filetype plugin indent on    " required

let g:rustfmt_autosave = 1
let g:rustfmt_command = 'rustfmt +stable'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-d> :NERDTreeToggle<CR>
map <C-e> :NERDTreeFind<CR>

set wildignore+=*/.idea/*,*/.git/*,*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*     " MacOSX/Linux

let g:ctrlp_map = '<c-n>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_mruf_case_sensitive = 1
let g:loaded_syntastic_javascript_jshint_checker = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump = 2
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_html_checkers = []
let g:syntastic_ignore_files = ['*.html']
let g:syntastic_disabled_filetypes=['html']

let NERDTreeQuitOnOpen = 1

let g:typescript_indent_disable = 1

" Some settings to enable the theme:
syntax enable     " Use syntax highlighting


autocmd bufreadpre *.ts setlocal textwidth=100

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,typescript,ts AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
