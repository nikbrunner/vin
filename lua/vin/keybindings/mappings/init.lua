-- Declare global ignore label
WhichKeyIgnoreLabel = "which_key_ignore"

local Mappings = {
	normal = require("vin.keybindings.mappings.normal"),
	insert = require("vin.keybindings.mappings.insert"),
	visual = require("vin.keybindings.mappings.visual"),
	visual_block = require("vin.keybindings.mappings.visual_block"),
}

return Mappings
