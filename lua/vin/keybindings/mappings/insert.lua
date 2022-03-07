local InsertModeMappings = {}

InsertModeMappings.no_leader = {
	[","] = { ",<c-g>u", WhichKeyIgnoreLabel },
	["."] = { ".<c-g>u", WhichKeyIgnoreLabel },
	["="] = { "=<c-g>u", WhichKeyIgnoreLabel },
	["!"] = { "!<c-g>u", WhichKeyIgnoreLabel },
	["?"] = { "?<c-g>u", WhichKeyIgnoreLabel },
	["["] = { "[<c-g>u", WhichKeyIgnoreLabel },
	["("] = { "(<c-g>u", WhichKeyIgnoreLabel },
	["{"] = { "{<c-g>u", WhichKeyIgnoreLabel },
}

return InsertModeMappings
