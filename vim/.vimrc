set nocompatible
set modelines=0


command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
        \ | diffthis | wincmd p | diffthis
let g:is_posix = 1
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
set sessionoptions-=options
set viewoptions-=options
set viminfo^=!
setglobal tags-=./tags tags-=./tags; tags^=./tags;

set complete-=i
set nrformats-=octal
set ttimeout
set ttimeoutlen=100

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

syntax on
filetype plugin indent on
set autoindent
set autoread
set hidden
set clipboard=unnamed

" UI
set number
set relativenumber
set ruler
set laststatus=2
set visualbell
set colorcolumn=80
set scrolloff=10
set display+=truncate

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set formatoptions=tcrqwn1j
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" Cursor motion
set matchpairs+=<:>
runtime! macros/matchit.vim
runtime! ftplugin/man.vim

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')? '<Bar>diffupdate' : ''<CR><CR><C-L>

let mapleader = " "
map <leader>q gqip

set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR> " Toggle tabs and EOL

nnoremap j gj
nnoremap k gk

" Color scheme 
set background=dark
:highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE
:highlight Pmenu ctermbg=Gray
:highlight PmenuSel ctermbg=LightGray
