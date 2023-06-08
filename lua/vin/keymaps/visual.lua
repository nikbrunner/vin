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
    n = { vim.cmd.nohlsearch, "No Highlight Search (:nohlsearch)" },
    f = { cmds.telescope.builtin("find_files"), "Find File" },
    [";"] = {
        function()
            vim.cmd("Neotree left close")
            vim.cmd("Neotree right close")
            vim.cmd("Dashboard")
        end,
        "Dashboard",
    },
    ["`"] = { "<cmd>e #<CR>", "Alternative File" },
    ["<CR>"] = {
        function()
            vim.notify("Saved All", vim.log.levels.INFO, { title = "Vin" })
            vim.cmd.wa()
        end,
        "Save All (:wa)",
    },
    [" "] = { cmds.telescope.builtin("buffers"), "Buffers" },
    [":"] = { cmds.telescope.builtin("commands"), "Commands" },
    ["/"] = { cmds.telescope.builtin("current_buffer_fuzzy_find"), "Find in File" },
    ["<TAB>"] = {
        "<cmd>Telescope telescope-tabs list_tabs theme=ivy<CR>",
        "Switch to Tabs",
    },

    -- Groups
    a = groups.action,
    e = groups.explorer,
    c = groups.copy,
    d = groups.diagnostics,
    g = groups.git,
    i = groups.insert,
    m = groups.marks,
    s = groups.search,
    u = groups.ui,
    O = groups.obsidian,
    t = groups.tabs,
    v = groups.vin,
    w = groups.windows,
    q = groups.quit,
    S = groups.session,
}

return M
