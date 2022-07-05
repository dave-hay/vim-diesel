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
end

-- vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use({
		"williamboman/nvim-lsp-installer",
		"neovim/nvim-lspconfig",
	})

	use("neovim/nvim-lspconfig")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("cohama/lexima.vim")
	use("sbdchd/neoformat")
	-- Auto complete
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("onsails/lspkind.nvim")
	-- Snippits
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	-- comment
	use("tpope/vim-commentary/")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	-- use 'hrsh7th/cmp-vsnip'
	-- use 'hrsh7th/vim-vsnip'
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

	if packer_bootstrap then
		require("packer").sync()
	end
end)
