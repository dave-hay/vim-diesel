local utils = require("core.utils")

local groups = {
	packerSyncOnSave = { "BufWritePost packer_config.lua source <afile> | PackerSync" },
	neoformat = { "BufWritePre * silent! undojoin | Neoformat" },
}

for name, aucmd in pairs(groups) do
	utils.new_augroup(name, aucmd)
end
