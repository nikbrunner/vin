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
    n = { vim.cmd.nohl, WhichKeyIgnoreLabel },
    l = { vim.cmd.vs, WhichKeyIgnoreLabel },
    j = { vim.cmd.sp, WhichKeyIgnoreLabel },
    ["<CR>"] = { vim.cmd.wa, "Save All (:wa)" },
    f = { "<cmd>Telescope find_files<CR>", "Find File" },
    [" "] = { "<cmd>Telescope buffers<CR>", "Buffers" },
    ["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Grep in File" },
    [":"] = { "<cmd>Telescope commands<CR>", "Commands" },
    ["`"] = { "<cmd>e #<CR>", "Switch to Other Buffer" },

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
    -- Groups
    a = groups.action,
    b = groups.buffer,
    c = groups.copy,
    d = groups.diagnostics,
    e = groups.explorer,
    g = groups.git,
    m = groups.marks,
    s = groups.search,
    t = groups.tabs,
    v = groups.vin,
    w = groups.windows,
    x = groups.problems,
    q = groups.quit,
    S = groups.session,
}
return M
