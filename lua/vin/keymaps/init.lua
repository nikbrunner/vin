local which_key_status_ok, which_key = pcall(require, "which-key")
if not which_key_status_ok then
    return
end

-- Global WhichKeyIgnore label
WhichKeyIgnoreLabel = "which_key_ignore"

local options = require("vin.keymaps.options")

local normal = require("vin.keymaps.normal")
local insert = require("vin.keymaps.insert")
local visual = require("vin.keymaps.visual")
local term = require("vin.keymaps.term")
local visual_block = require("vin.keymaps.visual_block")

--Remap space as leader key
-- QUESTION: Is this the best way to do this?
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })

-- Register Mappings for ..
-- Normal Mode
which_key.register(normal.no_leader, options.normal.no_leader)
which_key.register(normal.with_leader, options.normal.with_leader)

-- Visual Mode
which_key.register(visual.no_leader, options.visual.no_leader)
which_key.register(visual.with_leader, options.visual.with_leader)

-- Insert Mode
which_key.register(insert.no_leader, options.insert.no_leader)

-- Visual Block Mode
which_key.register(visual_block.no_leader, options.visual.no_leader)

which_key.register(term.no_leader, options.term.no_leader)
