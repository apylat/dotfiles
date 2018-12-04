"==================Plugins vim-plug=======================
call plug#begin('~/.vim/plugged')

" Utilites
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'chriskempson/base16-vim'
Plug 'tomtom/tcomment_vim'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'

"Git support
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Generic programing support
Plug('tpope/vim-endwise')
Plug('w0rp/ale')
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" autocompletion
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" JavaScript support
Plug('pangloss/vim-javascript')
Plug('mxw/vim-jsx')

" CSS support
Plug('hail2u/vim-css3-syntax')

"html support
Plug 'mattn/emmet-vim'

" Ruby, Rails support
Plug('vim-ruby/vim-ruby')
Plug('tpope/vim-rails')
Plug('tpope/vim-bundler')

" Testing
Plug 'janko-m/vim-test'

call plug#end()


"===================== General settigs==================
nnoremap <space> <nop>
" use the space key as our leader. put this near the top of your vimrc

let mapleader = "\<space>"

" For auto indent
filetype plugin indent on

"syntax highlighting
syntax on

" Use vim, not vi api
set nocompatible

" No backup files
set nobackup

" No write backup
set nowritebackup

" No swap file
set noswapfile

" Command history
set history=1000

" Remove escape delay http://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0

" Always show cursor
set ruler

" Show incomplete commands
set showcmd

" Incremental searching (search as you type)
set incsearch

" Highlight search matches
set hlsearch

" Ignore case in search if term(s) are lowercase
set ignorecase

" Search with case sensitivity if term(s) are upper or mixed case
set smartcase

" Turn word wrap off
set nowrap

set autoindent

set smartindent

" Enable highlighting of the current line
set cursorline

" Enable highlighting of the current column
set cursorcolumn


" Auto remove trailing blank spaces on each save
autocmd BufWritePre * :%s/\s\+$//e

" Allow backspace to delete end of line, indent and start of line characters
set backspace=indent,eol,start

" Access colors present in 256 colorspace
let base16colorspace=256
set t_Co=256

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Always show statusline
set laststatus=2

" Always display the tabline, even if there is only one tab
" set showtabline=2

" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode

" Enable mouse
set mouse=a

" set number of lines
set nu!

" tabs settinngs
set ts=2
set sts=0
set sw=2

" Tabs settins
" Convert tabs to spaces, all file types
set expandtab

" Set tab size in spaces (this is for manual indenting)
set tabstop=2

" The number of spaces inserted for a tab (used for auto indenting)
set shiftwidth=2

" Turn on line numbers
set number

" UTF encoding
set encoding=utf-8

set spelllang=en

" Autoload files that have changed outside of vim
set autoread

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Ensure Vim doesn't beep at you every time you make a mistype
set visualbell

" Visual autocomplete for command menu (e.g. :e ~/path/to/file)
set wildmenu

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Redraw only when we need to (i.e. don't redraw when executing a macro)
set lazyredraw

" Highlight a matching [{()}?P] when cursor is placed on start/end character
set showmatch

" Complete files like a shell.
set wildmode=list:longest

" Show 3 lines of context around the cursor.
set scrolloff=3

" Set the terminal's title
set title

set clipboard+=unnamed

"=================Key Mappings======================

" Save current file
nnoremap <Leader>w :w<CR>

" Quit
nnoremap <Leader>q :q<CR>

"=================Plugins Settings==================

" fzf
set rtp+=~/.fzf

" Fuzzy-find with fzf
nmap <C-p> :FZ<cr>

"=======================Nnerdtree====================
let NERDTreeShowHidden=1
let NERDTreeWinSize=50
map <C-\> :NERDTreeToggle<CR>

"=================vim-tmux-navigator=================
" Disable default mappings
let g:tmux_navigator_no_mappings = 1

" Windows navigation mapping
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

" Ale settings
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

" Lightlene settings
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
    return expand('%')
endfunction

" indentLine settings
let g:indentLine_char = '▏'

" Deoplete autocomplete settings
let g:deoplete#enable_at_startup = 1

" vim-javascript settings
let g:javascript_plugin_jsdoc = 1

" vim-jsx settings
let g:vim_jsx_pretty_colorful_config = 1
let g:jsx_ext_required = 0
