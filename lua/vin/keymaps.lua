local function set(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = opts.noremap == nil and true or opts.noremap
    opts.silent = opts.silent == nil and true or opts.silent
    vim.keymap.set(mode, lhs, rhs, opts)
end
local del = vim.keymap.del

-- Vin Group
set("n", "<leader>vP", "<cmd>Mason<CR>", { desc = "Package Manager - [Mason]" })
set("n", "<leader>vp", "<cmd>Lazy<CR>", { desc = "Plugin Manager - [LazyVim]" })
set("n", "<leader>vi", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
set("n", "<leader>vr", "<cmd>LspRestart<CR>", { desc = "Restart LSP Server" })
set("n", "<leader>vm", vim.cmd.messages, { desc = "Display messages" })

set("n", "<leader>cf", ":!stylua lua/**/*.lua<CR>", { desc = "Format" })

-- Tab Navigation
set({ "n", "v" }, "<S-Tab>", vim.cmd.tabprevious, { desc = "Previous Tab" })
set({ "n", "v" }, "<Tab>", vim.cmd.tabnext, { desc = "Next Tab" })

-- Easy Start and End of Line
set("n", "H", "^", { desc = "Move to Start of Line" })
set("n", "L", "$", { desc = "Move to End of Line" })

-- Combined commands
set("n", "vv", "^v$", { desc = "Select Line" })
set("n", "vA", "ggVG", { desc = "Select All" })
set("n", "yA", "ggVGy", { desc = "Copy All" })

-- Delete things without polluting clipboard
set("n", "x", '"_x', { desc = "Delete" })

-- Join lines while keeping position
set("n", "J", "mzJ`z", { desc = "Join Lines" })

-- Better up/down
set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set(
    { "n", "x" },
    "<Down>",
    "v:count == 0 ? 'gj' : 'j'",
    { expr = true, silent = true }
)
set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set(
    { "n", "x" },
    "<Up>",
    "v:count == 0 ? 'gk' : 'k'",
    { expr = true, silent = true }
)

set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
set(
    { "i", "n" },
    "<esc>",
    "<cmd>noh<cr><esc>",
    { desc = "Escape and clear hlsearch" }
)

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
set(
    "n",
    "<leader>ur",
    "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
    { desc = "Redraw / clear hlsearch / diff update" }
)

-- better indenting
set("v", "<", "<gv")
set("v", ">", ">gv")

-- Add undo break-points
set("i", ",", ",<c-g>u")
set("i", ".", ".<c-g>u")
set("i", ";", ";<c-g>u")

-- save file
set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- highlights under cursor
set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- prev/next
set("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
set("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
