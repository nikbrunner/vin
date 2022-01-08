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

-- VSCode like Control-p file navigation
keymap(
	"n",
	"<C-p>",
	"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	opts
)
keymap("n", "<C-e>", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<C-_>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<C-s>", "<cmd>Telescope lsp_document_symbols<cr>", opts)
keymap("n", "<C-q>", ":call ToggleQuickFix()<CR>", opts)
keymap("n", "<C-b>", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<C-g>", "<cmd>Telescope git_status<cr>", opts)
keymap("n", "<F8>", "<cmd>Telescope diagnostics<cr>", opts)
-- keymap("n", "<F9>", "<cmd>TodoTelescope<cr>", opts)

-- Navigate buffers
keymap("n", "<S-Tab>", ":bprevious<cr>", opts)
keymap("n", "<Tab>", ":bnext<cr>", opts)
keymap("n", "˙", ":tabprev<cr>", opts)
keymap("n", "¬", ":tabnext<cr>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- go prev
keymap("n", "[q", ":cprev<cr>zz", opts)
keymap("n", "[b", ":bprev<cr>zz", opts)
keymap("n", "[e", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>zz", opts)
keymap("n", "[g", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>zz", opts)

-- go next
keymap("n", "]q", ":cnext<cr>zz", opts)
keymap("n", "]b", ":bnext<cr>zz", opts)
keymap("n", "]e", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>zz", opts)
keymap("n", "]g", "<cmd>lua require 'gitsigns'.next_hunk()<cr>zz", opts)

-- Select line from beginning to end
keymap("n", "vv", "^v$", opts)

-- Select blocks
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
