local M = {}

M.no_leader = {
	[","] = { ",<c-g>u", WhichKeyIgnoreLabel },
	["."] = { ".<c-g>u", WhichKeyIgnoreLabel },
	["="] = { "=<c-g>u", WhichKeyIgnoreLabel },
	["!"] = { "!<c-g>u", WhichKeyIgnoreLabel },
	["?"] = { "?<c-g>u", WhichKeyIgnoreLabel },
	["["] = { "[<c-g>u", WhichKeyIgnoreLabel },
	["("] = { "(<c-g>u", WhichKeyIgnoreLabel },
	["{"] = { "{<c-g>u", WhichKeyIgnoreLabel },
}

return M
