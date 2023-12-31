local M = {}

---@type LazySpec
M.spec = {
    "utilyre/barbecue.nvim",
    enabled = false,
    name = "barbecue",
    version = "*",
    dependencies = { "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" },
    opts = {
        ---whether to show/use navic in the winbar
        ---@type boolean
        show_navic = false,

        ---whether to attach navic to language servers automatically
        ---@type boolean
        attach_navic = false,

        ---whether to create winbar updater autocmd
        ---@type boolean
        create_autocmd = true,

        ---buftypes to enable winbar in
        ---@type string[]
        include_buftypes = {},

        ---filetypes not to enable winbar in
        ---@type string[]
        exclude_filetypes = { "gitcommit", "toggleterm" },
    },
    config = function(_, opts)
        require("barbecue").setup(opts)
    end,
}

return M.spec
