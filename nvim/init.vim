

set autoindent
set history=50
set ruler

" Show incomplete commands in Vim window
set showcmd

" Display matches for a search pattern while typing
set incsearch

" turn on syntax highlighting and highlight search results
syntax on 
set hlsearch

" turn on filetype detection, plugins for filetype, indents for filetypes
filetype plugin indent on 

set relativenumber
set number

" Use the system clipboard
set clipboard=unnamed

" from primeagen
set termguicolors
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set scrolloff=8
set tabstop=4 softtabstop=4
set hidden
set smartindent
set undodir=~/.vim/undodir
set undofile

" give more space for displaying messages
set cmdheight=2


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50


" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" set leader
let mapleader = " "

" bind file save/update
nnoremap <leader>fs :update<cr>


" define plugins for vim-plug
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'haishanh/night-owl.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
call plug#end()

colorscheme night-owl

" enable lightline theme with nightowl
let g:lightline = {
      \ 'colorscheme': 'nightowl',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


let g:completion_matching_stategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.hls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.svelte.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.elmls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.denols.setup{ on_attach=require'completion'.on_attach }

" config from nvim-lua/completion
set completeopt=menuone,noinsert,noselect
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>grr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>grn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>gh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>gsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>


lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" function to set linebreak/wrap on initiatializing Goyo
function! s:goyo_enter()
  set linebreak
  set wrap
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()

