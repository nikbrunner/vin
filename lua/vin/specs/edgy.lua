local M = {}

M.get_width = function(max_width)
    max_width = max_width or 40
    local relative_width = math.floor(vim.o.columns * 0.2)
    if relative_width > max_width then
        return max_width
    else
        return relative_width
    end
end

M.get_height = function(max_height)
    max_height = max_height or 10
    local relative_height = math.floor(vim.o.lines * 0.2)

    if relative_height > max_height then
        return max_height
    else
        return relative_height
    end
end

---@type LazySpec
M.spec = {
    "folke/edgy.nvim",
    event = "VeryLazy",
    init = function()
        vim.opt.laststatus = 3
        vim.opt.splitkeep = "screen"
    end,
    keys = {
        {
            "<leader>ue",
            function()
                require("edgy").toggle()
            end,
            desc = "Edgy Toggle Windows",
        },
    },
    ---@type Edgy.Config
    opts = {
        animate = { enabled = false },

        ---@type table<Edgy.Pos, {size:integer, wo?:vim.wo}>
        options = {
            left = { size = M.get_width() },
            bottom = { size = M.get_height() },
            right = { size = M.get_width() },
            top = { size = M.get_height() },
        },

        left = {
            {
                title = "Files",
                ft = "neo-tree",
                pinned = true,
                filter = function(buf, win)
                    local isFloat = vim.api.nvim_win_get_config(win).relative == ""
                    return isFloat and vim.b[buf].neo_tree_source == "filesystem"
                end,
            },
        },

        right = {
            {
                title = "Git",
                ft = "neo-tree",
                pinned = true,
                open = "Neotree position=right git_status",
                filter = function(buf, win)
                    local isFloat = vim.api.nvim_win_get_config(win).relative == ""
                    return isFloat and vim.b[buf].neo_tree_source == "git_status"
                end,
            },
            {
                title = "Neotest Summary",
                ft = "neotest-summary",
                width = 60,
            },
        },

        bottom = {
            "Trouble",
            {
                ft = "help",
                filter = function(buf)
                    return vim.bo[buf].buftype == "help"
                end,
                size = { height = 0.4 },
            },
            {
                ft = "spectre_panel",
                title = "Spectre",
                size = { height = 0.4 },
            },
            {
                ft = "bmessages_buffer",
                title = "Messages",
            },
            {
                ft = "qf",
                title = "QuickFix",
            },
            {
                title = "Neotest Output",
                ft = "neotest-output-panel",
            },
            {
                ft = "noice",
                size = { height = 0.4 },
                filter = function(_, win)
                    return vim.api.nvim_win_get_config(win).relative == ""
                end,
            },
        },
    },
}

return M.spec
