-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- packer can manage itself

	-- lsp
	use({
		"williamboman/nvim-lsp-installer",
		"neovim/nvim-lspconfig",
	})

	-- Treesitter interface
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("cohama/lexima.vim")
	use("sbdchd/neoformat")

	-- Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			-- Snippits
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"saadparwaiz1/cmp_luasnip",
		},
	})

	use("onsails/lspkind.nvim")

	-- comment
	use("tpope/vim-commentary/")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({
		"fatih/vim-go",
		run = ":GoUpdateBinaries",
	})
	-- auto pairs
	use("windwp/nvim-autopairs")

	------------------------------------------------------
	-- Add-Ons
	------------------------------------------------------
	-- telescope dependency
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	-- " Github
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use("airblade/vim-gitgutter")
	-- " tree
	use("kyazdani42/nvim-tree.lua")
	-- " term
	use("akinsho/toggleterm.nvim")
	-- " markdown-preview
	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })

	------------------------------------------------------
	-- Appearance
	------------------------------------------------------
	use("goolord/alpha-nvim")
	use("nvim-lualine/lualine.nvim")
	use("joshdick/onedark.vim")
	-- use 'morhetz/gruvbox'
	use("kyazdani42/nvim-web-devicons")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
