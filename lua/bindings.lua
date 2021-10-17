local wk = require("which-key")

local options = require("bindings.options");
local keymaps = require("bindings.keymaps")

vim.g.mapleader = " "

-- NOTE Which Key Maps __Without__ Leader
wk.register(keymaps.noLeader.normal, options.whichKey.normal)
wk.register(keymaps.noLeader.insert, options.whichKey.insert)
wk.register(keymaps.noLeader.visual, options.whichKey.visual)

-- NOTE Which Key Maps __With__ Leader
wk.register(keymaps.withLeader.normal.single, options.whichKey.normal.withLeader)
wk.register(keymaps.withLeader.normal.groups, options.whichKey.normal.withLeader)
wk.register(keymaps.withLeader.visual.groups, options.whichKey.visual.withLeader)
