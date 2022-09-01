-- https://gist.github.com/shaeinst/bbf37c5da437706e7749504c6b685abd#file-configs-lua
--
local set = vim.opt
local cmd = vim.cmd -- execute Vim commands
local b = vim.bo
-- local fn    = vim.fn            -- call Vim functions
local g = vim.g -- global variables
-- local w = vim.wo
-- local exec  = vim.api.nvim_exec -- execute Vimscript
local utils = require("core.utils")

------------------------------------------------------
-- global options
------------------------------------------------------
set.hlsearch = false
set.signcolumn = "yes"
set.scrolloff = 8
set.sidescrolloff = 2 -- keep 30 columns visible left and right of the cursor at all times
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.smartindent = true
set.relativenumber = true
set.nu = true -- shows line number
set.swapfile = false
set.pumheight = 4 -- max items in popup menu
set.clipboard:append("unnamedplus") -- copy to clipboard
set.syntax = "on"
set.completeopt = "menu,menuone,noselect"
set.colorcolumn = "80"
set.mouse = ""
set.wrap = false
-- set.smarttab = false
-- remove white space on save
cmd([[au BufWritePre * :%s/\s\+$//e]])
------------------------------------------------------
-- new
------------------------------------------------------
set.termguicolors = true
set.syntax = "on"
set.smartcase = true
------------------------------------------------------
-- buffer
------------------------------------------------------
b.autoindent = true
b.smartindent = true
------------------------------------------------------
-- already default
------------------------------------------------------
g.gitgutter_map_keys = 0
-- set.hidden = true -- can navigate away from buffer and it doesn't delete
-- set.nobackup = true
-- set.errorbells = false
--
