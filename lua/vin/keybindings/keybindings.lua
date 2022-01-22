--[[
  INFO
  These are my keybindings without a leader key.
  I tried to map these also via WhichKey, but this resulted in a performance regression.
]]
--
local commands = require("vin.keybindings.commands")

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL MODE --
-- disable Q
keymap("n", "Q", "<Nop>", opts)

-- Go to Line Start and End
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)

-- Better j and k
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Better n and N (Keep Search Hit in the middle)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- TODO Why cant i use direct functions here?
keymap(
	"n",
	"<C-p>",
	"<cmd>lua require('vin.keybindings.commands').fzf.find_files_without_preview()<CR>",
	opts
)
keymap(
	"n",
	"<C-e>",
	"<cmd>lua require('vin.keybindings.commands').fzf.find_buffers()<CR>",
	opts
)
keymap(
	"n",
	"<C-_>",
	"<cmd>lua require('vin.keybindings.commands').fzf.find_in_file()<CR>",
	opts
)
keymap("n", "<C-q>", ":call ToggleQuickFix()<CR>", opts)
keymap("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", opts)
keymap(
	"n",
	"<C-g>",
	"<cmd>lua require('vin.keybindings.commands').fzf.find_modified_files_with_preview()<CR>",
	opts
)
keymap(
	"n",
	"<C-f>",
	"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
	opts
)

keymap(
	"n",
	"gm",
	"<cmd>lua require('vin.keybindings.commands').fzf.find_modified_files_with_preview()<CR>",
	opts
)

-- Navigate buffers
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "˙", ":tabprev<CR>", opts)
keymap("n", "¬", ":tabnext<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- go prev
keymap("n", "[q", ":cprev<CR>zz", opts)
keymap("n", "[b", ":bprev<CR>zz", opts)
keymap("n", "[e", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>zz", opts)
keymap("n", "[g", "<cmd>lua require 'gitsigns'.prev_hunk()<CR>zz", opts)

-- go next
keymap("n", "]q", ":cnext<CR>zz", opts)
keymap("n", "]b", ":bnext<CR>zz", opts)
keymap("n", "]e", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>zz", opts)
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
