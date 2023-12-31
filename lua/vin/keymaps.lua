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

-- global diagnostic mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
set("n", "gl", vim.diagnostic.open_float)
set("n", "[d", vim.diagnostic.goto_prev)
set("n", "]d", vim.diagnostic.goto_next)
set("n", "<leader>xq", vim.diagnostic.setloclist)

-- lsp mappings
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.buf.* for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        set("n", "K", vim.lsp.buf.hover, opts)
        set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

        set("n", "gd", vim.lsp.buf.definition, opts)
        set("n", "gD", vim.lsp.buf.declaration, opts)
        set("n", "gi", vim.lsp.buf.implementation, opts)
        set("n", "gy", vim.lsp.buf.type_definition, opts)
        set("n", "gr", "<CMD>FzfLua lsp_references<CR>", opts)

        set({ "n", "v" }, "<leader>ca", "<CMD>FzfLua lsp_code_actions<CR>", opts)
        set("n", "<leader>cr", vim.lsp.buf.rename, opts)

        -- set("n", "<leader>cf", ":!stylua lua/**/*.lua<CR>", { desc = "Format" })
        set("n", "<leader>cf", function()
            vim.lsp.buf.format({ async = true })
        end, opts)

        set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
        end, opts)
    end,
})
