require'FTerm'.setup({
    dimensions  = {
        height = 0.5,
        width = 0.5,
        x = 0.5,
        y = 0.5
    },
    border = 'single' -- or 'double'
})

-- Keybinding
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Closer to the metal
map('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
