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
"set ruler

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

" Changing cursor in different modes
let &t_SI.="\e[5 q"
let &t_SR.="\e[3 q"
let &t_EI.="\e[1 q"

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Map tabn, tabp, tabc to  tn, tp, tc
map <Leader>tn :tabn<cr>
map <Leader>tp :tabp<cr>
map <Leader>tc :tabc<cr>

" Map bn, bp, bd for buffers
map <Leader>bn :bn<cr>
map <Leader>bp :bp<cr>
map <Leader>bd :bd<cr>

" To get cool visuals with catppuccin
set termguicolors

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=1100

" Jump 10 lines up and down with ctrl-k and ctrl-j
nnoremap <C-k> 10k
nnoremap <C-j> 10j
nnoremap <C-h> 10h
nnoremap <C-l> 10l

" Make Vim use system clipboard by default
set clipboard=unnamedplus

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
Plug 'preservim/nerdtree'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-cursorword'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme = 'catppuccin_mocha'

" Set the catppuccin(there are frappe, mocha, latte and macchiato)
" colorscheme
colorscheme catppuccin_frappe

" NerdTree
nnoremap <C-t> :NERDTreeToggle<cr>
nnoremap <C-f> :NERDTreeFind<cr>
" nnoremap <leader>nf :NERDTreeFocus<CR>
let g:NERDTreeFileLines = 1

" coc.nvim
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
