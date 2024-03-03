local M = {}

---TODO: The git marker is on a different column, when there is no fold marker. Solve this.
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
            bt_ignore = { "nofile", "terminal" },
            segments = {
                {
                    text = {
                        function(args)
                            args.fold.close = " "
                            args.fold.open = " "
                            args.fold.sep = "▕ "
                            return builtin.foldfunc(args)
                        end,
                    },
                    click = "v:lua.ScFa",
                },
                { text = { "%s" }, click = "v:lua.ScSa" },
                {
                    text = { builtin.lnumfunc, " " },
                    condition = { true, builtin.not_empty },
                    click = "v:lua.ScLa",
                },
            },
        }
    end,
}

return M.spec
