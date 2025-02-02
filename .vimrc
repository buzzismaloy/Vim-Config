"------General------

" It includes determining the file type, downloading the corresponding plugins and indentation files.
filetype plugin indent on

" Set compatibility to Vim only
set nocompatible

" Show line numbers
set number

" Turn syntax highlighting on
syntax on

" Highlight current line
set cursorline
:highlight Cursorline cterm=bold ctermbg=DarkGray

" Status bar
" set laststatus=2

" Automatically wrap text that extends beyond the screen length
set wrap

" tabstop:	width of tab character
" softtabstop:	fine tunes the amount of whitespace to be added
" shiftwidth:	determines the amount of whitespace to add in normal mode
" textwidth:	text wrap width
" autoindent:	autoindent in new line
" smartindent:	like autoindent but also recognizes some C syntax to increase/reduce the indent 
"				where appropriate
set tabstop 	=4
set softtabstop =4
set shiftwidth 	=4
set textwidth 	=104
set autoindent
set smartindent

" Enable/Disable highlighting the max length of string
nnoremap <Leader>cc :set colorcolumn=105<cr>:highlight ColorColumn ctermbg=LightGray guibg=LightGray<cr>
nnoremap <Leader>ncc :set colorcolumn-=105<cr>:highlight ColorColumn NONE<cr>

" Show file stats
set ruler

" Encoding
set encoding=utf-8
scriptencoding utf-8

" Use highlighting when doing a search.
set hlsearch

" Enable smartcase search sensitivity
set ignorecase
set smartcase

" Show the matching part of pairs [] {} && ()
set showmatch

" Enable mouse
set mouse=a

"------Plugins------

"VimPlug
" :PlugInstall
" :PlugUpdate
" :PlugClean
" :PlugUpgrade
" :PlugStatus
" :PlugDiff
" :PlugSnapshot

" Automatically download vim-plug
if empty(glob('~/.vim/autoload/plug.vim')) " If there is no vim-plug
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " Create dir and download the vim plug
  " After that run PlugInstall command
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'vim-airline/vim-airline' 
call plug#end()

" Airline 
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#branch#enabled = 1
