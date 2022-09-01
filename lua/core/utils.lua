local M = {}
local cmd = vim.cmd

function M.new_augroup(name, aucmd)
	cmd("augroup " .. name)
	cmd("autocmd!")
	cmd("autocmd " .. table.concat(aucmd))
	cmd("augroup END")
end

return M
