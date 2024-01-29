local M = {}

---@LazySpec
M.spec = {
    "nmac427/guess-indent.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("guess-indent").setup({})
    end,
}

return M.spec
