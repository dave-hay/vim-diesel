require("mason-lspconfig").setup({
	-- Here you can specify which LSP servers you want to have installed by default
	ensure_installed = {
		-- LSPs
		"bashls",
		"html",
		"marksman",
		"pyright",
		"tsserver",
		"lua_ls",
		"rust_analyzer",
		-- Formatters
		--[[ "beautysh",
		"black",
		"marksman",
		"prettier",
		"prettierd",
		"stylua", ]]
	},
	-- Add any other configuration options for mason-lspconfig here
})

-- Setup LSP servers using nvim-lspconfig
--[[ local lspconfig = require('lspconfig')

  lspconfig.pyright.setup{}  -- Example for Python
  lspconfig.tsserver.setup{} -- Example for TypeScript ]]
-- Add more LSP server configurations here
