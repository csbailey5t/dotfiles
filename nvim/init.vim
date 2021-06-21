
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

" Always split down and right
set splitright
set splitbelow

" for gui neovim
set guifont=Fira\ Code:h16

" settings for neovide
let g:neovide_cursor_vfx_mode = "railgun"

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

" window movement
nnoremap <leader>wj <C-W>j
nnoremap <leader>wk <C-W>k
nnoremap <leader>wl <C-W>l
nnoremap <leader>wh <C-W>h

" make it easier to get out terminal mode
tnoremap <Esc> <C-\><C-n>

" define plugins for vim-plug
call plug#begin('~/.vim/plugged')

" Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'

" Telescope and dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/nvim-compe'

" Plug 'haishanh/night-owl.vim'
" Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'folke/tokyonight.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'

Plug 'hoob3rt/lualine.nvim'

Plug 'kyazdani42/nvim-web-devicons' 
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

" colorscheme night-owl
colorscheme tokyonight

" enable italics in embark
" let g:embark_terminal_italics = 1


lua require'lualine'.setup{	options = { theme = 'tokyonight' } }


" let g:completion_matching_stategy_list = ['exact', 'substring', 'fuzzy']
" lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.hls.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.svelte.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.elmls.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.denols.setup{ on_attach=require'completion'.on_attach }

lua require'lspconfig'.pyls.setup{} 
lua require'lspconfig'.tsserver.setup{} 

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:false
let g:compe.source.treesitter = v:true

" config for completion
set completeopt=menuone,noselect
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" mappings from nvim-compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>grr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>grn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>gh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>fo :lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>gsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>

" telescope config
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" function to set linebreak/wrap on initiatializing Goyo
function! s:goyo_enter()
  set linebreak
  set wrap
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()

" keymaps and settings for nvim-tree
" https://github.com/kyazdani42/nvim-tree.lua
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }

highlight NvimTreeFolderIcon guibg=blue
