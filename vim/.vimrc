" General
set nocompatible
set modelines=0
set viminfo^=!
set sessionoptions-=options
set viewoptions-=options
set ttimeout
set ttimeoutlen=100
set autoread
set encoding=utf-8
set clipboard=unnamed
set hidden
let g:is_posix = 1

syntax on
filetype plugin indent on

" Editor behavior
set autoindent
set complete-=i
set nrformats-=octal
setglobal tags-=./tags tags-=./tags; tags^=./tags;
set matchpairs+=<:>
runtime! macros/matchit.vim

" Undo
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" UI
set number
set relativenumber
set ruler
set laststatus=2
set visualbell
set colorcolumn=80
set scrolloff=10
set display+=truncate

" Whitespace
set wrap
let &showbreak = "+++ "
set linebreak
set breakindent
set formatoptions=tcrqwn1j
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set listchars=tab:▸\ ,eol:¬

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Mappings
let mapleader = " "
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
nnoremap j gj
nnoremap k gk
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')? '<Bar>diffupdate'
            \ : ''<CR><CR><C-L>
nnoremap <leader>q gqip
nnoremap <leader>l :set list!<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>

" Commands
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
            \ | diffthis | wincmd p | diffthis
runtime! ftplugin/man.vim

" Color scheme
set background=dark
highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE
highlight Pmenu ctermbg=Gray
highlight PmenuSel ctermbg=LightGray

packadd lsp
call LspAddServer([#{
	\    name: 'clangd',
	\    filetype: ['c', 'cpp'],
	\    path: 'clangd',
	\    args: ['--background-index']
	\  }])

set rtp+=/opt/homebrew/opt/fzf
