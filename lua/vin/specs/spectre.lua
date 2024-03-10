local M = {}

---@type LazyPluginSpec
M.spec = {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    event = "BufRead",
    opts = {
        open_cmd = "noswapfile vnew",
    },
    keys = {
        {
            "<leader>ar",
            function()
                require("spectre").open()
            end,
            desc = "Search & [R]eplace",
        },
        {
            "<leader>aR",
            mode = { "v" },
            function()
                local function get_visual_selection()
                    vim.cmd('noau normal! "vy"')

                    return vim.fn.getreg("v")
                end

                require("spectre").open({
                    search_text = get_visual_selection(),
                })
            end,
            desc = "Search & [R]eplace (visual selection)",
        },
    },
}

return M.spec
