" ------------------------------------------------------
" General
" ------------------------------------------------------
set noerrorbells
set nohlsearch
set scrolloff=8
set signcolumn=yes
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set relativenumber
set nu
set hidden " can navigate away from buffer and it doesn't delete
set noswapfile
set nobackup
set clipboard+=unnamedplus
set cc=80
set pumheight=5

" ------------------------------------------------------
" Plugins
" ------------------------------------------------------
call plug#begin(stdpath('data') . './plugged')

" ------------------------------------------------------
" Text editor ish (lsp, linting, etc.)
" ------------------------------------------------------
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'cohama/lexima.vim'
Plug 'sbdchd/neoformat'
" Auto complete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'
" Snippits
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'

" ------------------------------------------------------
" Appearance  
" ------------------------------------------------------
Plug 'goolord/alpha-nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'joshdick/onedark.vim'
Plug 'kyazdani42/nvim-web-devicons'

" ------------------------------------------------------
" Add-Ons
" ------------------------------------------------------
Plug 'nvim-lua/plenary.nvim'  " telescope dependency
Plug 'nvim-telescope/telescope.nvim'
" Github
Plug 'tpope/vim-fugitive' 
Plug 'tpope/vim-rhubarb'
" tree
Plug 'kyazdani42/nvim-tree.lua'

call plug#end()
set completeopt=menu,menuone,noselect

lua require('config.cmp')
" require("nvim-lsp-installer").setup{}
lua require('config')

" ------------------------------------------------------
" Appearance
" ------------------------------------------------------
" enables TRUECOLOR
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
syntax on
colorscheme onedark
highlight Normal guibg=none

" ------------------------------------------------------
" Neoformat
" ------------------------------------------------------
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_rust = ['rustfmt']
let g:neoformat_enabled_lua = ['stylua']
let g:neoformat_enabled_css = ['css-beautify']
let g:neoformat_enabled_html = ['html-beautify']
let g:neoformat_enabled_javascript = ['js-beautify']
let g:neoformat_enabled_json = ['prettier']
let g:neoformat_enabled_python = ['yapf']

" ------------------------------------------------------
" Key Mapping
" ------------------------------------------------------
let mapleader = " "
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
tnoremap <Esc> <C-\><C-n>
" http://vimcasts.org/episodes/neovim-terminal-mappings/

" move between panes
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>v <C-w>v <C-w>l :Alpha<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>qq :q<CR>
nnoremap <leader>so :source %<CR>
nnoremap <leader>ww :w<CR>

" Nvim Tree
nnoremap <C-1> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" alpha-nvim
nnoremap <leader>a :Alpha<CR>

" ------------------------------------------------------
" Auto-commands
" ------------------------------------------------------
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" ------------------------------------------------------
" Etc. - Need to install or delete
" ------------------------------------------------------
" From undo tree
" set undofir=~/.vim/undodir
" set undofile
