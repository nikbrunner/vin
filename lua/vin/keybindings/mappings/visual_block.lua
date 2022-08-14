local M = {}

M.no_leader = {
    -- Move text up and down
    -- NOTE: This is no handled via https://github.com/booperlv/nvim-gomove/blob/main/lua/gomove/init.lua
    -- ["J"] = { ":move '>+1<CR>gv-gv", WhichKeyIgnoreLabel },
    -- ["K"] = { ":move '<-2<CR>gv-gv", WhichKeyIgnoreLabel },
}

return M
