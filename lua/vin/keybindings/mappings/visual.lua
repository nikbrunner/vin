local groups = require("vin.keybindings.mappings.groups")

local M = {}

M.no_leader = {
    -- Better Indent
    ["<"] = { "<gv", WhichKeyIgnoreLabel },
    [">"] = { ">gv", WhichKeyIgnoreLabel },

    -- Move to beginning and end of line
    ["H"] = { "^", WhichKeyIgnoreLabel },
    ["L"] = { "$", WhichKeyIgnoreLabel },

    -- Move text up and down
    -- NOTE: This is no handled via https://github.com/booperlv/nvim-gomove/blob/main/lua/gomove/init.lua
    -- ["∆"] = { ":move '>+1<CR>gv-gv", WhichKeyIgnoreLabel },
    -- ["˚"] = { ":move '<-2<CR>gv-gv", WhichKeyIgnoreLabel },
}

M.with_leader = {
    -- Singles
    ["."] = { "<cmd>Alpha<cr>", "  Dashboard" },
    ["m"] = { Vin.cmds.zen.toggle_full_screen, "  Maximize Pane" },
    ["n"] = { ":nohl", WhichKeyIgnoreLabel },

    -- Tab navigation
    ["1"] = { "1gt", WhichKeyIgnoreLabel },
    ["2"] = { "2gt", WhichKeyIgnoreLabel },
    ["3"] = { "3gt", WhichKeyIgnoreLabel },
    ["4"] = { "4gt", WhichKeyIgnoreLabel },
    ["5"] = { "5gt", WhichKeyIgnoreLabel },
    ["6"] = { "6gt", WhichKeyIgnoreLabel },
    ["7"] = { "7gt", WhichKeyIgnoreLabel },
    ["8"] = { "8gt", WhichKeyIgnoreLabel },
    ["9"] = { "9gt", WhichKeyIgnoreLabel },

    -- Groups
    b = groups.buffer,
    P = groups.packer,
    s = groups.search,
    g = groups.git,
    i = groups.insert,
    l = groups.lsp,
    h = groups.harpoon,
    q = groups.quit,
    c = groups.copy,
    t = groups.tabs,
    T = groups.terra,
}
return M
