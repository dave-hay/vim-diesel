-- https://gist.github.com/shaeinst/6dbf903c6ebad09a184a7aee672f4903#file-lspstatus-lua

require('lsp-status').status()
require('lsp-status').register_progress()
require('lsp-status').config({
    indicator_errors = '✗',
    indicator_warnings = '⚠',
    indicator_info = '',
    indicator_hint = '',
    indicator_ok = '✔',
    current_function = true,
    diagnostics = false,
    select_symbol = nil,
    update_interval = 100,
    status_symbol = ' 🇻',
})
