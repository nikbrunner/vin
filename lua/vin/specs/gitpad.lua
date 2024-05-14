local M = {}

---@type LazyPluginSpec
M.spec = {
    "yujinyuz/gitpad.nvim",
    opts = {
        on_attach = function(bufnr)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<Cmd>wq<CR>", { noremap = true, silent = true })
        end,
    },
    config = function(_, opts)
        require("gitpad").setup(opts)
    end,
    keys = {
        {
            "<leader>pp",
            function()
                require("gitpad").toggle_gitpad()
            end,
            desc = "[P]roject",
        },
        {
            "<leader>pb",
            function()
                require("gitpad").toggle_gitpad_branch()
            end,
            desc = "[B]ranch",
        },
        {
            "<leader>pd",
            function()
                local date_filename = "daily-" .. os.date("%Y-%m-%d.md")
                require("gitpad").toggle_gitpad({ filename = date_filename })
            end,
            desc = "[D]aily",
        },
        {
            "<leader>pf",
            function()
                local filename = vim.fn.expand("%:p") -- or just use vim.fn.bufname()
                if filename == "" then
                    vim.notify("empty bufname")
                    return
                end
                filename = vim.fn.pathshorten(filename, 2) .. ".md"
                require("gitpad").toggle_gitpad({ filename = filename })
            end,
            desc = "[F]ile",
        },
    },
}

return M.spec
