local M = {}

---@type LazySpec
M.spec = {
    "nvim-pack/nvim-spectre",
    build = false,
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    keys = {
        {
            "<leader>sr",
            function()
                require("spectre").open()
            end,
            desc = "Replace in files (Spectre)",
        },
    },
}

return M.spec
