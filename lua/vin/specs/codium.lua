local M = {}

---@type LazyPluginSpec
M.spec = {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    enabled = false,
}

return M.spec
