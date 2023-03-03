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
require("plugins.tokyo")
require("plugins.lualine")
vim.cmd([[colorscheme tokyonight]])
