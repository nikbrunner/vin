local which_key_status_ok, which_key = pcall(require, "which-key")
if not which_key_status_ok then
	return
end

local which_key_options = require("vin.keybindings.whichkey.options")

local visualBlockMappings = {
	-- Move text up and down
	-- TODO Implement `move_line_down` & `move_line_up`
	["J"] = { ":move '>+1<CR>gv-gv", WhichKeyIgnoreLabel },
	["K"] = { ":move '<-2<CR>gv-gv", WhichKeyIgnoreLabel },
}

which_key.register(visualBlockMappings, which_key_options.visual)
