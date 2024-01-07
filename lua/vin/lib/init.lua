local M = {}

---@class VinLib
M = {
    copy = require("vin.lib.copy"),
    log = require("vin.lib.log"),
    component = require("vin.lib.component"),
    tmux = require("vin.lib.tmux"),
    branch_notes = require("vin.lib.branch_notes"),
}

return M
