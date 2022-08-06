-- https://sbulav.github.io/vim/neovim-setting-up-luasnip/
local ls = require("luasnip")

-- Every unspecified option will be set to the default.
ls.config.set_config({
	history = true,
	-- Update more often, :h events for more info.
	updateevents = "TextChanged,TextChangedI",
})

--[[ ls.snippets = {
	html = {},
} ]]

-- enable html snippets in javascript/javascript(REACT)
-- https://github.com/L3MON4D3/LuaSnip/issues/132#issuecomment-1101731222
ls.filetype_extend("javascript", { "html" })
ls.filetype_extend("javascriptreact", { "html" })
ls.filetype_extend("typescriptreact", { "html" })
require("luasnip/loaders/from_vscode").lazy_load()
