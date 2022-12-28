require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"cpp",
		"css",
		"dockerfile",
		"go",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"python",
		"rust",
		"sql",
		"typescript",
		"vim",
		"vue",
		"yaml",
		"zig",
	},
	auto_install = true,
	ignore_install = { "agda", "beancount", "pug", "swift" },
	highlight = {
		enable = true, -- enable = true (false will disable the whole extension)
		-- disable = { "c", "rust" },  -- list of language that will be disabled
		custom_captures = {
			-- Highlight the @foo.bar capture group with the "Identifier" highlight group.
			-- ["foo.bar"] = "Identifier",
		},
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})
