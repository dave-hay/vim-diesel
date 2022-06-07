-- local Plug = vim.fn['plug#']
-- vim.call('plug#end')

-- require'alpha'.setup(require'alpha.themes.startify'.opts)
-- require'lspconfig'.pyright.setup{}
-- require'lspconfig'.tsserver.setup{}
-- require'lspconfig'.rust_analyzer.setup{}
-- require('tree-sitter-typescript').typescript
-- require('tree-sitter-typescript').tsx

-- require("config.nvim-cpm")
require("lualine").setup({
	options = {
		theme = "onedark",
	},
})

require("config.alpha-nvim")
require("config.nvim-tree-config")
