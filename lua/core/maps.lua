local map = vim.keymap.set

map("n", "<Space>", "", {})
vim.g.mapleader = " "

local options = { noremap = true }
local silent = { noremap = true, silent = true }
--
-- save / close
--
map("n", "<leader>wq", ":wq<CR>", options)
map("n", "<leader>qq", ":q!<CR>", options)
map("n", "<leader>so", ":source %<CR>", options)
map("n", "<leader>ww", ":w<CR>", options)
--
--  move between panes
--
map("n", "<leader>h", "<C-w>h", options)
map("n", "<leader>j", "<C-w>j", options)
map("n", "<leader>k", "<C-w>k", options)
map("n", "<leader>l", "<C-w>l", options)
map("n", "<leader>vv", "<C-w>v", options)
map("n", "<leader>va", "<C-w>v <C-w>l :Alpha<CR>", options)
-- map("n", "<leader>hm", ":Alpha<CR>", options)
--
-- dap
map("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", silent)
map("n", "<F11>", "<Cmd>lua require'dap'.continue()<CR>", silent)
map("n", "<F12>", "<Cmd>lua require'dap'.step_into()<CR>", silent)
map("n", "<Leader>b", "<Cmd>require'dap'.toggle_breakpoint()<CR>", silent)
map("n", "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", silent)
map(
	"n",
	"<Leader>lp",
	"<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	silent
)
map("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", silent)
map("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", silent)
--
-- Term
-- http://vimcasts.org/episodes/neovim-terminal-mappings/
--
map("n", "<C-t>", ":ToggleTerm<CR>", silent)
map("t", "<C-t>", "<C-\\><C-n> :ToggleTerm<CR>", silent)
-- map("t", "<C-`>", "<C-\\><C-n> :ToggleTerm<CR>", silent)
--
-- Telescope
--
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", options)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", options)
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", options)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", options)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", options)

--
-- Nvim Tree
--
map("n", "<C-s>", ":NvimTreeToggle<CR>", options)
map("n", "<leader>r", ":NvimTreeRefresh<CR>", options)
map("n", "<leader>n", ":NvimTreeFindFile<CR>", options)

--
-- wrap string in X
--
map("n", "<leader>wd", 'vEdi ""<esc>hp', options)
map("n", "<leader>ws", "vEdi ''<esc>hp", options)
map("n", "<leader>wt", "vEdi ``<esc>hp", options)
map("n", "<leader>wp", "vEdi ()esc>hp", options)
map("n", "<leader>wc", "vEdi {}<esc>hp ", options)
map("n", "<leader>wb", "vEdi []<esc>hp ", options)

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
