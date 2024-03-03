local M = {}

---@type LazyPluginSpec
M.spec = {
    "luukvbaal/statuscol.nvim",
    branch = "0.10",
    event = "BufEnter",
    enabled = function()
        return vim.fn.has("nvim-0.10") == 1
    end,
    opts = function()
        local builtin = require("statuscol.builtin")

        return {
            relculright = true,
            ft_ignore = { "neo-tree" },
            segments = {
                { sign = { namespace = { "gitsigns" } } },
                { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
                { sign = { namespace = { "diagnostic" } } },
                { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
        }
    end,
}

return M.spec
