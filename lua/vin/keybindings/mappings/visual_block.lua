local VisualBlockModeMappings = {}

VisualBlockModeMappings.no_leader = {
	-- Move text up and down
	-- TODO Implement `move_line_down` & `move_line_up`
	["J"] = { ":move '>+1<CR>gv-gv", WhichKeyIgnoreLabel },
	["K"] = { ":move '<-2<CR>gv-gv", WhichKeyIgnoreLabel },
}

return VisualBlockModeMappings
