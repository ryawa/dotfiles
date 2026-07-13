" General
set nocompatible
set modelines=0
set viminfo^=!
set sessionoptions-=options
set viewoptions-=options
set wildmode=longest:full,full
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
set completeopt=menuone,popup,noselect,noinsert,fuzzy
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
set list
set listchars=tab:▸\ ,trail:-,nbsp:+,leadmultispace:│\ \ \ 

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Mappings
let mapleader = " "
nnoremap Y y$
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
xnoremap <expr> j v:count == 0 ? 'gj' : 'j'
xnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')? '<Bar>diffupdate'
            \ : ''<CR><CR><C-L>
nnoremap <leader>q gqip
nnoremap <leader>l :set list!<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>m :silent make \| cwindow \| redraw! <CR>
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>
nnoremap <silent> - :VimExplorer<CR>

" Commands
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
            \ | diffthis | wincmd p | diffthis
command! -nargs=+ Grep execute 'silent grep! <args>' | cwindow | redraw!
runtime! ftplugin/man.vim

" Color scheme
set background=dark
set termguicolors
let g:gruvbox_italic = 1
colorscheme gruvbox

packadd lsp
augroup MyLsp
    autocmd!
    autocmd User LspSetup call LspOptionsSet(#{
                \ semanticHighlight: v:true
                \ })
    autocmd User LspSetup call LspAddServer([#{
                \ name: 'clangd',
                \ filetype: ['c', 'cpp'],
                \ path: 'clangd',
                \ args: ['--background-index', '--header-insertion=never']
                \ }])
    autocmd User LspSetup call LspAddServer([#{
                \ name: 'jdtls',
                \ filetype: ['java'],
                \ path: 'jdtls',
                \ args: [
                \    '-data',
                \    expand('~/.cache/jdtls/' .. fnamemodify(getcwd(), ':t'))]
                \ }])
    autocmd User LspAttached call s:LspAttached()
    autocmd User LspDetached call s:LspDetached()
augroup END
function! s:LspAttached() abort
    nnoremap <buffer><silent> gd <Cmd>LspGotoDefinition<CR>
    nnoremap <buffer><silent> K  <Cmd>LspHover<CR>
    nnoremap <buffer><silent> [d <Cmd>LspDiag prev<CR>
    nnoremap <buffer><silent> ]d <Cmd>LspDiag next<CR>
    nnoremap <buffer><silent> <leader>rn <Cmd>LspRename<CR>
    nnoremap <buffer><silent> <leader>ca <Cmd>LspCodeAction<CR>
endfunction
function! s:LspDetached() abort
    silent! unmap <buffer> gd
    silent! unmap <buffer> K
    silent! unmap <buffer> [d
    silent! unmap <buffer> ]d
    silent! unmap <buffer> <leader>rn
    silent! unmap <buffer> <leader>ca
endfunction

augroup MarkdownCompletion
    autocmd!
    autocmd FileType markdown autocmd InsertCharPre <buffer> if v:char ==# '/' || v:char ==# '.' | call feedkeys("\<C-x>\<C-f>", 'n') | endif
    autocmd FileType markdown autocmd CompleteDone <buffer> if !empty(v:completed_item) && has_key(v:completed_item, 'word') && v:completed_item.word =~# '/$' | call feedkeys("\<C-x>\<C-f>", 'n') | endif
augroup END

set rtp+=/opt/homebrew/opt/fzf
