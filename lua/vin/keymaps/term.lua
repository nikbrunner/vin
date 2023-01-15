local M = {}

M.no_leader = {
    ["<C-/>"] = { Vin.cmds.term.toggle, "Toggle Term" },
    ["<C-g>"] = { Vin.cmds.term.toggle_gitui, "GitUi" },
}

return M
