execute pathogen#infect()
set shiftwidth=4
set tabstop=4
set autoindent
set noexpandtab
set foldmethod=indent
set shell=/bin/bash
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set nocompatible
set modelines=0
set encoding=utf-8
set scrolloff=3
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set backspace=indent,eol,start
set relativenumber
set undofile
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch
nnoremap / /\v
vnoremap / /\v
syntax on
filetype plugin indent on
colorscheme gruvbox

helptags ~/.vim/bundle/vdebug/doc

function! Vdebug_config( )
	let g:vdebug_options['path_maps']      =  {'home/vagrant': '/Users/joshuasalisbury/Projects/rsi'}
	let g:vdebug_options['timeout']        =  60
	let g:vdebug_options['break_on_open']  =  0
endf

function! Cp_filename( )
	call setreg('*', getreg('%'))
endf

let mapleader = ','
nnoremap <leader>yf :call Cp_filename( )<CR>
nnoremap <leader><space> :noh<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
