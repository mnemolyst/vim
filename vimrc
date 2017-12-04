set nocompatible
set shiftwidth=4
set tabstop=4
set autoindent
set autoread
set expandtab
set foldmethod=indent
set shell=/bin/bash
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2
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
set number
set relativenumber
set undofile
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch
syntax on
filetype plugin indent on

"helptags ~/.vim/bundle/vdebug/doc
helptags ~/.vim/bundle/vim-fugitive/doc

"function! Vdebug_config( )
	"let g:vdebug_options['path_maps']      =  {'/home/vagrant': '/Users/joshuasalisbury/Projects/rsi'}
	"let g:vdebug_options['timeout']        =  60
	"let g:vdebug_options['break_on_open']  =  0
"endf

function! Cp_filename( )
	call setreg('*', getreg('%'))
endf

function! MoveToPrevTab()
	"there is only one window
	if tabpagenr('$') == 1 && winnr('$') == 1
		return
	endif
	"preparing new window
	let l:tab_nr = tabpagenr('$')
	let l:cur_buf = bufnr('%')
	if tabpagenr() != 1
		close!
		if l:tab_nr == tabpagenr('$')
			tabprev
		endif
		sp
	else
		close!
		exe "0tabnew"
	endif
	"opening current buffer in new window
	exe "b".l:cur_buf
endfunc

function! MoveToNextTab()
	"there is only one window
	if tabpagenr('$') == 1 && winnr('$') == 1
		return
	endif
	"preparing new window
	let l:tab_nr = tabpagenr('$')
	let l:cur_buf = bufnr('%')
	if tabpagenr() < tab_nr
		close!
		if l:tab_nr == tabpagenr('$')
			tabnext
		endif
		sp
	else
		close!
		tabnew
	endif
	"opening current buffer in new window
	exe "b".l:cur_buf
endfunc

let mapleader = ','
nnoremap <leader>yf :call Cp_filename( )<CR>
nnoremap <leader>ta :tab sp<CR>:cd app<CR>:Ack<CR>:cd ..<CR>
nnoremap <leader>tb :tab sp<CR>:Ack<CR>
nnoremap <leader>ad :q<CR>:q<CR>gT
nnoremap <leader><space> :noh<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap / /\v
vnoremap / /\v

execute pathogen#infect()

"let g:toggl_api_token="054b30bd2f4f42dca37bc1b962e5a029"

colorscheme josh
