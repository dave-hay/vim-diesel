--[[ local utils = require("core.utils")

utils.new_augroup("snipRunTerm", "TermOpen * setlocal nonu") ]]

require("sniprun").setup({
	display = { "Terminal" },
})
