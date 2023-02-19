local cmds = require("vin.cmds")

local M = {}

M.no_leader = {
    ["<C-'>"] = { cmds.term.toggle, "Term" },
}

return M
