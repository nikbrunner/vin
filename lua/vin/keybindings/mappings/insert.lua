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
	["<C-e>"] = { "<cmd>Telescope symbols<CR>", "Insert Symbol" },
}

return M
