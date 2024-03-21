-- Utilities for creating configurations

local util = require("formatter.util")
-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
local f = {}

function f.prettierd()
	return {
		exe = "prettierd",
		args = { util.escape_path(util.get_current_buffer_file_path()) },
		stdin = true,
	}
end

function f.beautysh()
	local shiftwidth = vim.opt.shiftwidth:get()
	local expandtab = vim.opt.expandtab:get()

	if not expandtab then
		shiftwidth = 0
	end

	return {
		exe = "beautysh",
		args = {
			"-i",
			shiftwidth,
			util.escape_path(util.get_current_buffer_file_path()),
		},
	}
end

function f.gofmt()
	return {
		exe = "gofmt",
		args = {
			"-w",
			util.escape_path(util.get_current_buffer_file_path()),
		},
	}
end

require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		go = { f.gofmt },
		javascript = { f.prettierd },
		javascriptreact = { f.prettierd },
		json = {
			require("formatter.filetypes.json").prettier,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		markdown = { f.prettierd },
		python = {
			require("formatter.filetypes.python").black,
		},
		sh = { f.beautysh },
		svelte = {
			require("formatter.filetypes.svelte").prettier,
		},
		typescript = { f.prettierd },
		typescriptreact = { f.prettierd },
		zsh = { f.beautysh },
		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
