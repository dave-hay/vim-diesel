-- load nvim-cmp config
require("plugins.cmp")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local util = require("lspconfig/util")
local lspconfig = require("lspconfig")

--
local servers = {
	"bashls",
	-- "ccls",
	-- "clangd",
	-- "cssls",
	-- "dockerls",
	"html",
	-- "jsonls",
	"marksman",
	"pyright",
	"quick_lint_js",
	-- "tailwindcss",
	"rust_analyzer",
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end
------------------------------------------------------
-- if typescript doesnt work
require("lspconfig")["ts_ls"].setup({
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript.jsx", "javascriptreact" },
})
------------------------------------------------------
require("lspconfig")["lua_ls"].setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "hs", "spoon" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false, -- stops, "Do you need to configure your work environment as 'luaassert'" https://github.com/neovim/nvim-lspconfig/issues/1700
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
require("lspconfig")["html"].setup({
	configurationSection = { "html", "css", "javascript" },
	embeddedLanguages = {
		css = true,
		javascript = true,
	},
	provideFormatter = true,
	filetypes = { "html", "css", "javascript", "svelte", "vue" },
})
-- require("lspconfig")["svelte"].setup({ filetypes = { "svelte", "html" } })
