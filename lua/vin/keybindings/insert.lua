local which_key_status_ok, which_key = pcall(require, "which-key")
if not which_key_status_ok then
	return
end

local which_key_options = require("vin.keybindings.whichkey.options")

local maps = {
	no_leader = {
		[","] = { ",<c-g>u", WhichKeyIgnoreLabel },
		["."] = { ".<c-g>u", WhichKeyIgnoreLabel },
		["="] = { "=<c-g>u", WhichKeyIgnoreLabel },
		["!"] = { "!<c-g>u", WhichKeyIgnoreLabel },
		["?"] = { "?<c-g>u", WhichKeyIgnoreLabel },
		["["] = { "[<c-g>u", WhichKeyIgnoreLabel },
		["("] = { "(<c-g>u", WhichKeyIgnoreLabel },
		["{"] = { "{<c-g>u", WhichKeyIgnoreLabel },
	},
}

which_key.register(maps.no_leader, which_key_options.insert.no_leader)
