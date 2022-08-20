require("impatient")
--
-- Plugins configs
--
require("mason").setup()
require("mason-lspconfig").setup()
-- require("nvim-lsp-installer").setup({ automatic_installation = true })
require("plugins.lsp_cmp")
require("plugins.neoformat")
-- theme
-- https://github.com/folke/tokyonight.nvim
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_transparent = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.cmd([[colorscheme tokyonight]])
require("lualine").setup({
	options = {
		theme = "onedark",
	},
})

-- if onedark wanted
-- require('onedark').setup { transparent = true }
-- require('onedark').load()
