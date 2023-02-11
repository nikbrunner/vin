local present, fterm = pcall(require, "FTerm")
if not present then
    return
end

vim.api.nvim_create_user_command("FTermOpen", fterm.open, { bang = true })
vim.api.nvim_create_user_command("FTermClose", fterm.close, { bang = true })
vim.api.nvim_create_user_command("FTermExit", fterm.exit, { bang = true })
vim.api.nvim_create_user_command("FTermToggle", fterm.toggle, {})

local gitui = fterm:new({
    ft = "fterm_gitui", -- You can also override the default filetype, if you want
    cmd = "lazygit",
    border = "rounded",
    dimensions = {
        height = 0.9,
        width = 0.9,
    },
    on_exit = function()
        local function refresh_all()
            require("neo-tree.sources.manager").refresh("filesystem")
            require("neo-tree.sources.manager").refresh("git_status")
            require("neo-tree.sources.manager").refresh("buffers")
        end

        refresh_all()
    end,
})

local M = {}

M.toggle = function()
    fterm.toggle()
end

M.toggle_gitui = function()
    gitui:toggle()
end

return M
