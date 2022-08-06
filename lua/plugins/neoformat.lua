local g = vim.g -- global variables

g.neoformat_json_prettierd = {
   'exe': 'prettierd',
}

--[[ local prettier = {
  formatCommand = 'prettierd "${INPUT}"',
  formatStdin = true,
  env = {
    string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json')),
  },
} ]]
