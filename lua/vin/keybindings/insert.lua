local which_key = protected_require("which-key")
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
