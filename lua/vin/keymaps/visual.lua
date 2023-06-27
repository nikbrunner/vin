local cmds = require("vin.cmds")
local groups = require("vin.keymaps.groups")

local M = {}

M.no_leader = {
    -- Better Indent
    ["<"] = { "<gv", WhichKeyIgnoreLabel },
    [">"] = { ">gv", WhichKeyIgnoreLabel },
    -- Move to beginning and end of line
    ["H"] = { "^", WhichKeyIgnoreLabel },
    ["L"] = { "$", WhichKeyIgnoreLabel },

    ["J"] = { ":m '>+1<CR>gv=gv", WhichKeyIgnoreLabel },
    ["K"] = { ":m '<-2<CR>gv=gv", WhichKeyIgnoreLabel },
}

M.with_leader = {
    -- Singles
    n = { vim.cmd.nohlsearch, WhichKeyIgnoreLabel },
    f = { cmds.telescope.builtin("find_files"), "Find Files" },
    ["/"] = { cmds.telescope.builtin("current_buffer_fuzzy_find"), "Find in File" },
    [" "] = { cmds.telescope.builtin("buffers"), "Buffers" },
    [":"] = { cmds.telescope.builtin("commands"), "Commands" },
    ["`"] = { "<cmd>e #<CR>", "Alternative File" },
    [";"] = {
        function()
            vim.cmd("Neotree left close")
            vim.cmd("Neotree right close")
            vim.cmd("Dashboard")
        end,
        "Dashboard",
    },
    ["<CR>"] = {
        function()
            vim.notify("Saved All", vim.log.levels.INFO, { title = "Vin" })
            vim.cmd.wa()
        end,
        "Save All (:wa)",
    },
    ["<TAB>"] = {
        "<cmd>Telescope telescope-tabs list_tabs theme=ivy<CR>",
        "Switch to Tabs",
    },

    -- Groups
    O = groups.obsidian,
    S = groups.session,
    a = groups.action,
    c = groups.copy,
    d = groups.diagnostics,
    e = groups.explorer,
    s = groups.search,
    g = groups.git,
    i = groups.insert,
    m = groups.marks,
    q = groups.quit,
    t = groups.tabs,
    u = groups.ui,
    v = groups.vin,
    w = groups.windows,
}

return M
