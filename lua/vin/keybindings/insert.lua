local which_key_status_ok, which_key = pcall(require, "which-key")
if not which_key_status_ok then
	return
end

local which_key_options = require("vin.keybindings.whichkey.options")

local maps = {
	[","] = { ",<c-g>u", WhichKeyIgnoreLabel },
	["."] = { ".<c-g>u", WhichKeyIgnoreLabel },
	["="] = { "=<c-g>u", WhichKeyIgnoreLabel },
	["!"] = { "!<c-g>u", WhichKeyIgnoreLabel },
	["?"] = { "?<c-g>u", WhichKeyIgnoreLabel },
	["["] = { "[<c-g>u", WhichKeyIgnoreLabel },
	["("] = { "(<c-g>u", WhichKeyIgnoreLabel },
	["{"] = { "{<c-g>u", WhichKeyIgnoreLabel },
}

which_key.register(maps, which_key_options.insert)
