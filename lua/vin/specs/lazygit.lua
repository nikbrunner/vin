local M = {}

-- TODO:  Make this work. Press e to edit the file in the current nvim instance
-- [(O)pen file and (e)dit file in the current nvim instance? · Issue #67 · kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim/issues/67)

---@type LazyPluginSpec
M.spec = {
    "kdheepak/lazygit.nvim",
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    config = function()
        vim.g.lazygit_floating_window_winblend = 10 -- transparency of floating window
        vim.g.lazygit_floating_window_scaling_factor = 1 -- scaling factor for floating window
        vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } -- customize lazygit popup window border characters
        vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
        vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed
    end,
}

return M.spec
