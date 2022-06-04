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

lua <<EOF
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end
  -- Setup nvim-cmp.
  local luasnip = require("luasnip")
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities
  }
EOF

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
nnoremap <leader>so :source %<CR>
nnoremap <leader>sa :w<CR>

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

" Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
