local saga = require 'lspsaga'

saga.init_lsp_saga {
  border_style = "round"
}

vim.api.nvim_set_keymap('n', 'gR', ':Lspsaga lsp_finder<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'gh', ':Lspsaga hover_doc<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'gp', ':Lspsaga preview_definition<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F2>', ':Lspsaga rename<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<M-CR>', ':Lspsaga code_action<CR>', { silent = true })
vim.api.nvim_set_keymap('v', '<M-CR>', ':Lspsaga range_code_action<CR>', { silent = true })
