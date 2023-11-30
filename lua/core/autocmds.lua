local utils = require("core.utils")


local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

local groups = {
	packerSyncOnSave = { "BufWritePost packer_config.lua source <afile> | PackerSync" },
	-- formatter = { "BufWritePost * FormatWrite" },
}

for name, aucmd in pairs(groups) do
	utils.new_augroup(name, aucmd)
end
