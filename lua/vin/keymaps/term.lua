local cmds = require("vin.cmds")

local M = {}

M.no_leader = {
    ["<F5>"] = { cmds.term.toggle, "Term" },
}

return M
