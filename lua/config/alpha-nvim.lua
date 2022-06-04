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
	dashboard.button("SPC f f", "  > Find file", ":Leaderf file --popup<CR>"),
	dashboard.button("SPC f r", "  > Recent files", ":Leaderf mru --popup<CR>"),
	dashboard.button("SPC f g", "  > Project grep", ":Leaderf rg --popup<CR>"),
	dashboard.button("u", "  > Update plugins", ":PlugUpdate<CR>"),
	dashboard.button("e", "  > New file", ":enew <CR>"),
	dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- button("e", "  New file", "<cmd>ene <CR>"),
-- button("SPC f f", "  Find file"),
-- button("SPC f h", "  Recently opened files"),
-- button("SPC f r", "  Frecency/MRU"),
-- button("SPC f g", "  Find word"),
-- button("SPC f m", "  Jump to bookmarks"),
-- button("SPC s l", "  Open last session"),
