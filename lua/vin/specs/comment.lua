local M = {}

---@type LazySpec
M.spec = {
    "echasnovski/mini.comment",
    version = "*",
    event = "BufEnter",
    config = function(_, opts)
        require("mini.comment").setup(opts)
    end,
}

return M.spec
