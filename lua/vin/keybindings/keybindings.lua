--[[
  INFO
  These are my keybindings without a leader key.
  I tried to map these also via WhichKey, but this resulted in a performance regression.
]]
--
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- go prev
keymap("n", "[q", ":cprev<CR>zz", opts)
keymap("n", "[b", ":bprev<CR>zz", opts)
keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev()<CR>zz", opts)
keymap("n", "[g", "<cmd>lua require 'gitsigns'.prev_hunk()<CR>zz", opts)

-- go next
keymap("n", "]q", ":cnext<CR>zz", opts)
keymap("n", "]b", ":bnext<CR>zz", opts)
keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next()<CR>zz", opts)
keymap("n", "]g", "<cmd>lua require 'gitsigns'.next_hunk()<CR>zz", opts)

-- Select line from beginning to end
keymap("n", "vv", "^v$", opts)

-- Select blocks
-- TODO These seem do not work anymore
keymap("n", "v{", "^vf{%", opts)
keymap("n", "v[", "^vf[%", opts)
keymap("n", "v(", "^vf(%", opts)

-- Delete blocks
keymap("n", "d{", "^vf{%d", opts)
keymap("n", "d[", "^vf[%d", opts)
keymap("n", "d(", "^vf(%d", opts)

-- Yank blocks
keymap("n", "y{", "^vf{%y", opts)
keymap("n", "y[", "^vf[%y", opts)
keymap("n", "y(", "^vf(%y", opts)

-- INSERT MODE --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "=", "=<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)
keymap("i", "[", "[<c-g>u", opts)
keymap("i", "(", "(<c-g>u", opts)
keymap("i", "{", "{<c-g>u", opts)

-- VISUAL MODE --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Go to Line Start and End
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)

-- Move text up and down
keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)
keymap("v", "p", '"_dP', opts)

keymap("v", "<C-a>", "<C-a>gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
