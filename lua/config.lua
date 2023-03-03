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
		-- ... your lualine config
		theme = "tokyonight",
		-- ... your lualine config
	},
})

-- theme
require("plugins.tokyo")
vim.cmd([[colorscheme tokyonight]])
