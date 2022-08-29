require("impatient")
--
-- Plugins configs
--
require("mason").setup()
require("mason-lspconfig").setup()
require("plugins.lsp_cmp")
require("plugins.neoformat")
-- require("plugins.formatter")
-- theme
require("lualine").setup({
	options = {
		theme = "tokyonight",
	},
})

-- tokyonight
-- https://github.com/folke/tokyonight.nvim
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_transparent = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.cmd("colorscheme tokyonight")
