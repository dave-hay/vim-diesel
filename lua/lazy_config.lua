-- lua/lazy_config.lua
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Configure lazy.nvim
require("lazy").setup({
	-- Core plugins
	{ "folke/lazy.nvim" },

	-- LSP
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("plugins.mason-lspconfig")
		end,
	},
	{ "neovim/nvim-lspconfig" },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},
	{ "nvim-lua/plenary.nvim" },

	-- Autocomplete
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-calc",
			"saadparwaiz1/cmp_luasnip",
		},
	},

	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("plugins.luasnip")
		end,
	},

	-- Formatting
	{
		"mhartington/formatter.nvim",
		config = function()
			require("plugins.formatter")
		end,
	},
	{ "cohama/lexima.vim" },
	{ "sbdchd/neoformat" },

	-- Text Formatting
	{ "onsails/lspkind.nvim" },
	{ "godlygeek/tabular" },
	{ "b3nj5m1n/kommentary" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "andymass/vim-matchup" },
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.autopairs")
		end,
	},

	-- Add-Ons
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.telescope")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "v2.*",
		config = function()
			require("plugins.toggle_term")
		end,
	},
	{
		"michaelb/sniprun",
		build = "sh install.sh",
		config = function()
			require("plugins.snip_run")
		end,
	},

	{ "nvim-tree/nvim-web-devicons", lazy = true },

	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
	},
	{ "airblade/vim-gitgutter" },
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Appearance
	{
		"goolord/alpha-nvim",
		config = function()
			require("plugins.alpha")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.lualine")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{ "folke/tokyonight.nvim" },
})
