set nocompatible	" Use Vim settings, not Vi settings

" Pathogen setup
execute pathogen#infect()

" Enable filetypes
filetype plugin indent on

" Theme/Colors
set t_Co=256
syntax enable
colorscheme Tomorrow-Night-Eighties

" Vim UI
set number 		 " show line numbers
set relativenumber
set cul			 " highlight current line
set showmatch	 " show matching brackets
set incsearch	 " do incremental searching
set hlsearch     " highlight search results
set laststatus=2 " always show status line
set scrolloff=3  " show context above/below cursorline
set nowrap       " prevent text wrapping

" Text Formatting/Layout
set autoindent		" auto-indent
set tabstop=4		" tab spacing
set shiftwidth=4	" indent/outdent by 4 columns
set shiftround		" always indent/outdent to nearest tabstop

" Auto/Smart Indentation
set expandtab
set smarttab

" autocomplete config
set wildmenu 
set wildmode=longest,list,full

" yank and paste with the system clipboard
set clipboard=unnamed

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Write the old file out when switching between files
set autowrite

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" Set <Leader> to ,
let mapleader = ","

" Type semicolon instead of colon for normal mode commands
nnoremap ; :

" Switching between splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"" open new split panes to right/bottom
set splitbelow
set splitright

" Moving splits
nnoremap <leader>wh <C-w>H
nnoremap <leader>wj <C-w>J
nnoremap <leader>wk <C-w>K
nnoremap <leader>wl <C-w>L
" Swap left/right or top/bottom split
nnoremap <leader>ws <C-w>R
" Move to next split
nnoremap <Tab> <C-w>w

" jump 10 spaces down/up
noremap <Space> 10j
noremap <BS> 10k

" Use Enter/Shift-Enter to insert newlines (before/after)
" in Normal Mode
nmap <CR> o<Esc>

" Type underscore to clear highlighted search results
nnoremap <silent> _ :nohl<CR>

" Ctrl-Tab rotates btwn buffers (recently edited files)
nmap <C-Tab> :bnext

" plugin shortcuts
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <slient> <leader>r :TagbarToggle<CR>

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
" patch for airline symbol spacing issue
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif
let g:airline_symbols.space = "\ua0"
" let airline use old vim-powerline symbols
let g:airline_powerline_fonts = 1
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_supress_report = 1
