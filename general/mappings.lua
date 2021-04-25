-- leader
vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', 'Q', '<NOP>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader><C-r>', ':source ~/.config/nvim/init.vim<CR>\\ :echo "NeoVim Config reloaded!"<CR>', { noremap = true })

-- New splits
vim.api.nvim_set_keymap('n', '<leader>l', ':vsp<CR><C-W><C-l>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':sp<CR><C-W><C-j>', { noremap = true, silent = true })

-- Nav splits
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Resize panes
vim.api.nvim_set_keymap('n', 'H', ':vertical:resize +10<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'J', ':resize +10<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', ':resize -10<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', ':vertical:resize -10<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>=', '<C-w>=', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', '<C-w>x', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>m', '<C-w>\\|<C-w>_', { noremap = true, silent = true })

-- tabs
vim.api.nvim_set_keymap('n', '<TAB>', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':tabprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>-', ':tabm -1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>+', ':tabm +1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>to', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true })

-- Go to tab by number
vim.api.nvim_set_keymap('n', '<leader>1', '1gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', '2gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', '3gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', '4gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5', '5gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>6', '6gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>7', '7gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>8', '8gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>9', '9gt', { noremap = true, silent = true })

-- Switch between two buffers
vim.api.nvim_set_keymap('n', '<leader><leader>', '<C-^>', { noremap = true, silent = true })

-- Escape
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', { noremap = true, silent = true })

-- easy log
vim.api.nvim_set_keymap('n', 'cll', 'oconsole.log("LINE: <C-r>=line(\'.\')<Esc>",);<Esc>O<Esc>jf,a ', { noremap = true, silent = true })

-- Refactor Add Braces to convert function to explicit return 
vim.api.nvim_set_keymap('n', '<leader>rab', 'f(da(i{}<Esc>i<CR><Esc>Oreturn <Esc>p:w<CR>', { noremap = true, silent = true })

-- Refactor Remove Braces to convert function to implicit return
vim.api.nvim_set_keymap('n', '<leader>rrb', 'f(da(kf{va{p:w<CR>', { noremap = true, silent = true })

-- Select Block starting with curly brace or parenthesis
vim.api.nvim_set_keymap('n', 'v{', '^vf{%', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'v(', '^vf(%', { noremap = true, silent = true })
