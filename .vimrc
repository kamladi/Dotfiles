set nocompatible	"" Use Vim settings, not Vi settings

"" Enable filetypes
filetype plugin indent on

"" Theme/Colors
set t_Co=256
syntax enable
colorscheme solarized
set background=dark

"" Pathogen setup
execute pathogen#infect()

"" NERDTREE Config
"" Toggle NERDTREE with Ctrl-n
map <C-n> :NERDTREEToggle<CR>
""close vim if the only window left is NERDTREE
"" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"" Vim UI
set number 		"" show line numbers
set cul			"" highlight current line
set ruler		"" show cursor position all the time
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

"" key mappings for changing focus btwn windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
