
--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup Which-Key with config
require("vin.keybindings.whichkey.config")

-- Setup bindings for modes
require("vin.keybindings.normal")
require("vin.keybindings.insert")
require("vin.keybindings.visual")
require("vin.keybindings.visual_block")
