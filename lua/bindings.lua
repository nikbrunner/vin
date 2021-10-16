local wk = require("which-key")

local utils = require("bindings.utils")
local options = require("bindings.options");
local keymaps = require("bindings.keymaps")

vim.g.mapleader = " "

-- Overwrite base mappings
utils.setNvimKeyMap("n", keymaps.overwrites.normal, options.base)
utils.setNvimKeyMap("i", keymaps.overwrites.insert, options.base)
utils.setNvimKeyMap("v", keymaps.overwrites.visual, options.base)

-- Set WhichKey Mappings
wk.register(keymaps.whichKey.normal, options.whichKey.normal)

wk.register(
    keymaps.whichKey.normal.withLeader.single,
    options.whichKey.normal.withLeader
)

wk.register(
    keymaps.whichKey.normal.withLeader.groups,
    options.whichKey.normal.withLeader
)

wk.register(keymaps.whichKey.visual, options.whichKey.visual.withLeader)
