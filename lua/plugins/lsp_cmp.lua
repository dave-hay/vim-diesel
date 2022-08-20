-- load nvim-cmp config
require("plugins.cmp")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local util = require("lspconfig/util")
local lspconfig = require("lspconfig")

--
local servers = {
	"pyright",
	"rust_analyzer",
	"marksman",
	"vimls",
	"bashls",
	"dockerls",
	-- "tailwindcss",
	"taplo",
	"html",
	"ccls",
	"jsonls",
	"quick_lint_js",
	"svelte",
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end
------------------------------------------------------
-- if typescript doesnt work
require("lspconfig")["tsserver"].setup({
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript.jsx", "javascriptreact" },
})
------------------------------------------------------

require("lspconfig")["sumneko_lua"].setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
require("lspconfig")["gopls"].setup({
	capabilities = capabilities,
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
})
