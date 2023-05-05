local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {

	"  ██╗   ██╗██╗███╗   ███╗    ██████╗ ██╗███████╗███████╗███████╗██╗       ",
	"  ██║   ██║██║████╗ ████║    ██╔══██╗██║██╔════╝██╔════╝██╔════╝██║       ",
	"  ██║   ██║██║██╔████╔██║    ██║  ██║██║█████╗  ███████╗█████╗  ██║       ",
	"  ╚██╗ ██╔╝██║██║╚██╔╝██║    ██║  ██║██║██╔══╝  ╚════██║██╔══╝  ██║       ",
	"   ╚████╔╝ ██║██║ ╚═╝ ██║    ██████╔╝██║███████╗███████║███████╗███████╗  ",
	"    ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚═════╝ ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝  ",
}

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("Leader f f", "󰍉  Find file", ":Telescope find_files<CR>", nil),
	dashboard.button("Leader f r", "󰅐  Recent files", ":Telescope oldfiles<CR>", nil),
	dashboard.button("Leader f g", "󰓾  Project grep", ":Telescope live_grep<CR>", nil),
	dashboard.button("u", "󰚰  Update plugins", ":PackerSync<CR> <bar> :PackerCompile<CR>", nil),
	dashboard.button("e", "  New file", ":enew <CR>", nil),
	dashboard.button("q", "󰩈  Quit NVIM", ":qa<CR>", nil),
}

local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune(nil)
alpha.setup(dashboard.opts)

-- Send config to alpha
alpha.setup(dashboard.opts)
