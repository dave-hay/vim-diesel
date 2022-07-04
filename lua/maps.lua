local map = vim.api.nvim_set_keymap

map("n", "<Space>", "", {})
vim.g.mapleader = " "

options = { noremap = true }

-- map("n", "<leader>", "", options)

map("n", "<leader>wq", ":wq<CR>", options)
map("n", "<leader>qq ", ":q!<CR>", options)
map("n", "<leader>so ", ":source %<CR>", options)
map("n", "<leader>ww ", ":w<CR>", options)

--  move between panes

map("n", "<leader>h", "<C-w>h", options)
map("n", "<leader>j", "<C-w>j", options)
map("n", "<leader>k", "<C-w>k", options)
map("n", "<leader>l", "<C-w>l", options)
map("n", "<leader>vv", "<C-w>v", options)
map("n", "<leader>va", "<C-w>v <C-w>l :Alpha<CR>", options)
map("n", "<leader>hm", ":Alpha<CR>", options)
-- Term
-- http://vimcasts.org/episodes/neovim-terminal-mappings/
-- tnoremap <Esc> <C-\><C-n>
-- map(<C-`> :ToggleTerm<CR> , options)
-- tnoremap <C-`> <C-\><C-n> :ToggleTerm<CR> , options)
-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", options)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", options)
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", options)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", options)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", options)

-- Nvim Tree
map("n", "<C-1>", ":NvimTreeToggle<CR>", options)
map("n", "<leader>r", ":NvimTreeRefresh<CR>", options)
map("n", "<leader>n", ":NvimTreeFindFile<CR>", options)

-- wrap string in X
map("n", "<leader>wd", 'vEdi ""<esc>hp', options)
map("n", "<leader>ws", "vEdi ''<esc>hp", options)
map("n", "<leader>wp", "vEdi ()esc>hp", options)
map("n", "<leader>wc", "vEdi {}<esc>hp ", options)
map("n", "<leader>wb", "vEdi []<esc>hp ", options)
