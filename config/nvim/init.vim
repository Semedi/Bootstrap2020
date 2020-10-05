" Don't try to be vi compatible
set nocompatible

"Pick a leader key
let mapleader = ","

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Turn on syntax highlighting
syntax on

"---------------------------------------------------
" PLUGIN
"---------------------------------------------------

call plug#begin('~/.vim/plugged')
" fuzzy search
Plug 'ctrlpvim/ctrlp.vim'

" tree navigation
Plug 'scrooloose/nerdtree'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git integration
Plug 'tpope/vim-fugitive'

" colorscheme & syntax
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'

Plug 'mileszs/ack.vim'

Plug 'neovim/nvim-lspconfig'

" custom
Plug 'hashivim/vim-terraform'
Plug 'ervandew/supertab'
call plug#end()

colorscheme onedark
set rtp+=$GOROOT/misc/vim


"LSP
lua << EOF
require'nvim_lsp'.pyls.setup{}
require'nvim_lsp'.rust_analyzer.setup{}
require'nvim_lsp'.gopls.setup{}
EOF

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>


" to review
"
" Enable deoplete autocompletion in Rust files
" let g:deoplete#enable_at_startup = 1

" customise deoplete
" maximum candidate window length
" call deoplete#custom#source('_', 'max_menu_width', 80)

" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>"

"" rustfmt on write using autoformat
"autocmd BufWrite * :Autoformat
"
""TODO: clippy on write
"autocmd BufWrite * :Autoformat

nnoremap <leader>c :!cargo clippy
"
nnoremap <leader>b :CtrlPBuffer<CR>

" Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#csv#column_display = 'Name'
let g:airline#extensions#branch#enabled = 1
let g:airline_theme='onedark'
"let g:airline#extensions#tagbar#enabled = 0

" Browse ocurrences
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>a yiw:Ack!<Space><c-r>0<CR>


" nvim terminal
augroup TerminalStuff
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
tnoremap <Esc> <C-\><C-n>

"auto resize panes:
"autocmd VimResized * wincmd =

"---------------------------------------------------
" NO PLUGIN
"---------------------------------------------------
"

"system clipboard
vnoremap Y "+y
vnoremap <C-x> d<CR>:let @+=@"<CR>

"buf navigation
nnoremap <Tab> :bn <CR>
nnoremap <S-Tab> :bp <CR>
nnoremap gb :ls<CR>:buffer<Space>

" For plugins to load correctly
filetype plugin indent on

set autoindent

" Security
set modelines=0

" Show line numbers
set number
set relativenumber

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
"set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Mouse
set mouse=a

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" Toggle tabs and EOL
map <leader>l :set list!<CR>

" Color scheme (terminal)
set t_Co=256
set background=dark
