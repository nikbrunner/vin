local which_key_status_ok, which_key = pcall(require, "which-key")
if not which_key_status_ok then
    return
end

local mappings = require("vin.keybindings.mappings")
local options = require("vin.keybindings.options")
local config = require("vin.keybindings.config")

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup Which-Key with Config
which_key.setup(config)

-- Register Mappings for ..
-- Normal Mode
which_key.register(mappings.normal.no_leader, options.normal.no_leader)
which_key.register(mappings.normal.with_leader, options.normal.with_leader)

-- Visual Mode
which_key.register(mappings.visual.no_leader, options.visual.no_leader)
which_key.register(mappings.visual.with_leader, options.visual.with_leader)

-- Insert Mode
which_key.register(mappings.insert.no_leader, options.insert.no_leader)

-- Visual Block Mode
which_key.register(mappings.visual_block.no_leader, options.visual.no_leader)
