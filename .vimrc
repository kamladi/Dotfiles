set nocompatible	"" Use Vim settings, not Vi settings

"" Pathogen setup
execute pathogen#infect()

"" Enable filetypes
filetype plugin indent on

"" Theme/Colors
set t_Co=256
syntax enable
colorscheme Tomorrow-Night-Eighties

"" Vim UI
set number 		"" show line numbers
set cul			"" highlight current line
"" set ruler		"" show cursor position all the time
set showmatch	"" show matching brackets
set incsearch	"" do incremental searching

"" Text Formatting/Layout
set autoindent		"" auto-indent
set tabstop=4		"" tab spacing
set shiftwidth=4	"" indent/outdent by 4 columns
set shiftround		"" always indent/outdent to nearest tabstop

"" Auto/Smart Indentation
set expandtab
set smarttab

"" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"" Write the old file out when switching between files
set autowrite

"" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

"" keyboard shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>

"" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
set laststatus=2 "" shows vim-airline all the time
"" let airline use custom powerline symbols
let g:airline_powerline_fonts = 1
"" patch for airline symbol spacing issue
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif
let g:airline_symbols.space = "\ua0"
