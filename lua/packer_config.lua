-----------------------------------------------------------
-- Plugin Configs
-----------------------------------------------------------
-- inspo
-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/packer_init.lua

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = nil

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
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- packer can manage itself
	use("lewis6991/impatient.nvim")

	-- lsp
	use({
		"williamboman/mason.nvim",
	})

	use({ "williamboman/mason-lspconfig.nvim", config = "require('plugins.mason-lspconfig')" })

	use({
		"neovim/nvim-lspconfig",
	})

	-- Treesitter interface
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = "require('plugins.treesitter')" })
	use("nvim-lua/plenary.nvim")

	------------------------------------------------------
	-- Autocomplete
	------------------------------------------------------
	use({
		"hrsh7th/nvim-cmp", -- Autocompletion plugin
		requires = {
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
			"hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words.
			"hrsh7th/cmp-path", -- nvim-cmp source for filesystem paths.
			"hrsh7th/cmp-cmdline", -- nvim-cmp source for vim's cmdline.
			"hrsh7th/cmp-calc", -- nvim-cmp source for math calculation.
			"saadparwaiz1/cmp_luasnip", -- luasnip completion source for nvim-cmp
		},
	})
	--use 'SirVer/ultisnips'

	use({ -- Snippet Engine for Neovim written in Lua.
		"L3MON4D3/LuaSnip",
		requires = {
			"rafamadriz/friendly-snippets", -- Snippets collection for a set of different programming languages for faster development.
		},
		config = [[require('plugins.luasnip')]],
	})

	-- Formatting
	use({ "mhartington/formatter.nvim", config = "require('plugins.formatter')" })
	use("cohama/lexima.vim")
	use("sbdchd/neoformat")

	----------------------------------------------------------
	-- Text Formatting
	----------------------------------------------------------
	use("onsails/lspkind.nvim")

	use("godlygeek/tabular")

	-- comment
	use("b3nj5m1n/kommentary")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	use("andymass/vim-matchup") -- Highlights other HTML tag

	use({
		"windwp/nvim-autopairs",
		config = "require('plugins.autopairs')",
		--[[ config = function()
			require("nvim-autopairs").setup({})
		end, ]]
	})

	------------------------------------------------------
	-- Add-Ons
	------------------------------------------------------
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = "require('plugins.telescope')",
	})

	-- need for lazygit
	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		config = "require('plugins.toggle_term')",
	})

	use({
		"michaelb/sniprun",
		run = "sh install.sh",
		config = "require('plugins.snip_run')",
	})

	-- debugger
	--[[ use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }) ]]

	use({ "nvim-tree/nvim-web-devicons", config = "require('plugins.devicons-config')" })
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
	})
	use("airblade/vim-gitgutter")
	-- File tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" }, -- for file icons
		-- tag = "nightly", -- optional, updated every week.
		-- config = [[require('plugins.nvim-tree-config')]],
	})

	------------------------------------------------------
	-- Appearance
	------------------------------------------------------
	use({ "goolord/alpha-nvim", config = "require('plugins.alpha')" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
		config = "require('plugins.lualine')",
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	use("folke/tokyonight.nvim")
	-- Automatically set up your configuration after cloning packer.nvim. Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)

----------------------------------------------------------
-- Currently Unused
----------------------------------------------------------
--
-- markdown-preview
-- use{ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" }
-- Themes
-- use("joshdick/onedark.vim")
-- use 'morhetz/gruvbox'
-- Tabs at top
-- use({ "romgrk/barbar.nvim", requires = { "kykzdani42/nvim-web-devicons" } })
-- use({ "karb94/neoscroll.nvim", config = "require('plugins.neoscroll')" })
-- terminal

--[[ use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	}) ]]
-- config = "require('plugins.todo_comments')",
-- use({ "fatih/vim-go", run = ":GoUpdateBinaries" })
