----------------------------------------------------------
-- usein manager configuration file
-----------------------------------------------------------
-- inspo
-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/packer_init.lua

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path, })
	-- vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
end

----------------------------------------------------------
-- Autocommand that reloads neovim whenever you save the packer_init.lua file
----------------------------------------------------------
local acmd = require('core.utils')
local source_on_save = {
  {"BufWritePost", "packer_setup.lua", "source", "<afile>", "|", "PackerSync"},
  -- {"BufWritePost * FormatWrite"}
}
acmd.create_augroup(source_on_save, 'packer_user_config')

----------------------------------------------------------
-- Use a protected call so we don't error out on first use
----------------------------------------------------------
local status_ok, _ = pcall(require, "packer")
if not status_ok then
	return
end
	------------------------------------------------------
  -- Plugins below
	------------------------------------------------------
return require('packer').startup(function(use)
	use("wbthomason/packer.nvim") -- packer can manage itself
  use('lewis6991/impatient.nvim')

	-- lsp
	use({
		"williamboman/nvim-lsp-installer",
		"neovim/nvim-lspconfig",
	})

	-- Treesitter interface
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
    config = [[require('plugins/configs/treesitter')]]
	})

	------------------------------------------------------
	-- Autocomplete
	------------------------------------------------------
  use {
  'hrsh7th/nvim-cmp', -- Autocompletion plugin
    requires = {
  'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words.
  'hrsh7th/cmp-path',  -- nvim-cmp source for filesystem paths.
  'hrsh7th/cmp-cmdline', -- nvim-cmp source for vim's cmdline.
  "hrsh7th/cmp-calc",               -- nvim-cmp source for math calculation.
  "saadparwaiz1/cmp_luasnip",       -- luasnip completion source for nvim-cmp
    }
  }
  --use 'SirVer/ultisnips'

  use { -- Snippet Engine for Neovim written in Lua.
        'L3MON4D3/LuaSnip',
        requires = {
          "rafamadriz/friendly-snippets",   -- Snippets collection for a set of different programming languages for faster development.
        },
        config = [[require('plugins/configs/luasnip')]]
  }


	use("cohama/lexima.vim")
	use("sbdchd/neoformat")

----------------------------------------------------------
	-- Autocomplete
----------------------------------------------------------

	use("onsails/lspkind.nvim")

  -- Formatting
  use 'mhartington/formatter.nvim'

	-- comment
	use("b3nj5m1n/kommentary")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({
		"fatih/vim-go",
		run = ":GoUpdateBinaries",
	})
	-- auto pairs
	use{
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

	------------------------------------------------------
	-- Add-Ons
	------------------------------------------------------
  use{
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = [[require('plugins.configs.telescope')]]
  }
	use("airblade/vim-gitgutter")

	-- File tree
  use {
  'kyazdani42/nvim-tree.lua',
  requires = { 'kyazdani42/nvim-web-devicons' }, -- for file icons
    tag = 'nightly', -- optional, updated every week.
    config = [[require('plugins.configs.nvim-tree-config')]]
  }

  -- Tabs at top
  use {
  'romgrk/barbar.nvim',
  requires = {'kyazdani42/nvim-web-devicons'}
  }

	-- terminal
	use{"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
    require('toggleterm').setup()
  end}

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  -- use("lukas-reineke/indent-blankline.nvim")
	------------------------------------------------------
	-- Appearance
	------------------------------------------------------
	use('goolord/alpha-nvim')
	use("nvim-lualine/lualine.nvim")
  use 'folke/tokyonight.nvim'
	use("kyazdani42/nvim-web-devicons")

----------------------------------------------------------
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
----------------------------------------------------------
	if packer_bootstrap then
		require("packer").sync()
	end
end)


----------------------------------------------------------
-- Currently Unused
----------------------------------------------------------
-- coq completions
-- use({"ms-jpq/coq_nvim", branch = 'coq'})
-- use({"ms-jpq/coq.artifacts", branch = 'artifacts'})
-- use({"ms-jpq/coq.thirdparty", branch = '3p'})
--
-- markdown-preview
-- use{ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" }
-- Themes
-- use("joshdick/onedark.vim")
-- use("navarasu/onedark.nvim")
-- use 'morhetz/gruvbox'
