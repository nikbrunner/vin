local utils = require("vin.core.utils")

local M = {}

M.get_diff_to_master = function()
	vim.cmd("DiffviewOpen origin/" .. utils.get_master_branch_name() .. "...HEAD")
end

return M
