---@diagnostic disable: undefined-field
local lib = require("vin.lib")
local config = require("vin.config")

local function set(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = opts.noremap == nil and true or opts.noremap
    opts.silent = opts.silent == nil and true or opts.silent
    vim.keymap.set(mode, lhs, rhs, opts)
end

set("n", "Q", "<nop>")

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "<C-o>", "<C-o>zz", { desc = "Move back in jump list" })
set("n", "<C-i>", "<C-i>zz", { desc = "Move forward in jump list" })

set("n", "vA", "ggVG", { desc = "Select All" })
set("n", "yA", "ggVGy", { desc = "Copy All" })

set("n", "x", '"_x', { desc = "Delete without yanking" })

-- Join lines while keeping position
set("n", "J", "mzJ`z", { desc = "Join Lines" })

-- Resize splits with shift + arrow
set({ "n", "v", "x" }, "<S-Down>", "<cmd>resize -2<cr>", { desc = "Resize Split Down" })
set({ "n", "v", "x" }, "<S-Up>", "<cmd>resize +2<cr>", { desc = "Resize Split Up" })
set({ "n", "v", "x" }, "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Resize Split Left" })
set({ "n", "v", "x" }, "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Resize Split Right" })

-- Better up/down
set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Alternate File" })

-- Clear search with <esc>
set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- indenting and reselect
set("v", "<", "<gv")
set("v", ">", ">gv")

set("i", ",", ",<c-g>u")
set("i", ".", ".<c-g>u")
set("i", ";", ";<c-g>u")

-- Center screen when using <C-u> and <C-d>
set({ "n", "i", "c" }, "<C-u>", "<C-u>zz", { desc = "Scroll Up" })
set({ "n", "i", "c" }, "<C-d>", "<C-d>zz", { desc = "Scroll Down" })

-- Center screen when going to next/previous search result
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("n", "<leader>ur", ":e!<CR>", { desc = "Redraw / clear hlsearch / diff update" })

set("n", "<leader>ub", function()
    local background = vim.opt.background:get()

    if background == "dark" then
        vim.opt.background = "light"
        vim.notify("Background set to light", vim.log.levels.INFO, { title = "Background" })
    else
        vim.opt.background = "dark"
        vim.notify("Background set to dark", vim.log.levels.INFO, { title = "Background" })
    end
end, { desc = "Toggle Background" })

set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

set("n", "<leader>uc", function()
    local defaultLevel = 0
    local currentLevel = vim.o.conceallevel
    local nextLevel = currentLevel == 0 and 3 or defaultLevel
    vim.o.conceallevel = nextLevel
    vim.notify("Conceal level set to " .. nextLevel, vim.log.levels.INFO, { title = "Conceal" })
end, { desc = "Toggle Conceal (0, 3)" })

set("n", "<leader>uC", function()
    local defaultLevel = 0
    vim.ui.select({ 0, 1, 2, 3 }, {
        promt = "Select Conceal Level",
    }, function(selected)
        if selected ~= nil then
            vim.opt.conceallevel = selected or defaultLevel
            vim.notify("Conceal level set to " .. selected, vim.log.levels.INFO, { title = "Conceal" })
        end
    end)
end, { desc = "Toggle specific conceal level" })

set("n", "<leader>ud", function()
    if vim.diagnostic.is_disabled() then
        vim.diagnostic.enable()
        vim.notify("Diagnostics enabled", vim.log.levels.INFO, { title = "Diagnostics" })
    else
        vim.diagnostic.disable()
        vim.notify("Diagnostics disabled", vim.log.levels.WARN, { title = "Diagnostics" })
    end
end, { desc = "Toggle Diagnostics" })

set("n", "<leader>us", function()
    if vim.o.spell then
        vim.o.spell = false
        vim.notify("Spell check disabled", vim.log.levels.WARN, { title = "Spell Check" })
    else
        vim.o.spell = true
        vim.notify("Spell check enabled", vim.log.levels.INFO, { title = "Spell Check" })
    end
end, { desc = "Toggle Spell" })

set("n", "z=", function()
    require("fzf-lua").spell_suggest({ winopts = { height = 0.35, width = 0.65 } })
end, { desc = "Spelling Suggestions" })

set("n", "<leader>uw", function()
    if vim.o.wrap then
        vim.o.wrap = false
        vim.notify("Text wrapping disabled", vim.log.levels.WARN, { title = "Text Wrapping" })
    else
        vim.o.wrap = true
        vim.notify("Text wrapping enabled", vim.log.levels.INFO, { title = "Text Wrapping" })
    end
end, { desc = "Toggle Text Wrapping" })

set("n", "<leader>ul", function()
    local areNumbersEnabled = vim.opt.number:get()
    local areRelativeNumbersEnabled = vim.opt.relativenumber:get()

    if areRelativeNumbersEnabled then
        vim.opt.relativenumber = false
        vim.opt.number = true
        vim.notify("Normal line numbers enabled", vim.log.levels.INFO, { title = "Line Numbers" })
    elseif areNumbersEnabled then
        vim.opt.number = false
        vim.opt.relativenumber = true
        vim.notify("Relative line numbers enabled", vim.log.levels.INFO, { title = "Line Numbers" })
    end
end, { desc = "Toggle Line Numbers (Relative vs. Normal" })

-- prev/next
set("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
set("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

-- global diagnostic mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
set("n", "gl", vim.diagnostic.open_float, { desc = "Open Diagnostic" })

set("n", "[d", function()
    vim.diagnostic.goto_prev()
end, { desc = "Previous Diagnostic" })
set("n", "]d", function()
    vim.diagnostic.goto_next()
end, { desc = "Next Diagnostic" })

set("n", "[w", function()
    vim.diagnostic.goto_prev({ severity = "WARN" })
end, { desc = "Warning" })
set("n", "]w", function()
    vim.diagnostic.goto_next({ severity = "WARN" })
end, { desc = "Warning" })

set("n", "[e", function()
    vim.diagnostic.goto_prev({ severity = "ERROR" })
end, { desc = "Error" })
set("n", "]e", function()
    vim.diagnostic.goto_next({ severity = "ERROR" })
end, { desc = "Error" })

-- set("n", "H", vim.cmd.tabprevious, { desc = "Previous Tab" })
-- set("n", "L", vim.cmd.tabnext, { desc = "Next Tab" })
for i = 1, 9 do
    set("n", "<leader>" .. i, function()
        local existing_tab_count = vim.fn.tabpagenr("$")

        if existing_tab_count < i then
            vim.cmd("tablast")
            vim.cmd("tabnew")
        else
            vim.cmd(i .. "tabnext")
        end
    end, { desc = WhichKeyIgnoreLabel })
end

-- Vin Group
set("n", "<leader>vp", "<cmd>Lazy<CR>", { desc = "Plugin Manager - [LazyVim]" })
set("n", "<leader>vP", "<cmd>Mason<CR>", { desc = "Package Manager - [Mason]" })
set("n", "<leader>vi", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
set("n", "<leader>vr", "<cmd>LspRestart<CR>", { desc = "Restart LSP Server" })

-- Copy Group
set("n", "<leader>acf", lib.copy.fullPath, { desc = "Full Path" })
set("n", "<leader>acr", lib.copy.relativePath, { desc = "Relative Path" })
set("n", "<leader>acn", lib.copy.fileName, { desc = "Name of file" })

-- Log Group
set("n", "<leader>all", lib.log.log_symbol, { desc = "[L]og" })
set("n", "<leader>ald", lib.log.delete_logs, { desc = "[D]elete" })

set("n", "<leader>sc", lib.component.find_and_open_files, { desc = "[C]omponent" })
set("n", "gC", lib.component.find_and_open_component_file, { desc = "[C]omponent under cursor" })

-- Tmux Group
set("n", "<leader>tc", lib.tmux.start_custom_tmux_session, { desc = "[C]reate Session" })
set("n", "<leader>ts", lib.tmux.switch_tmux_session, { desc = "Switch [S]ession" })
set("n", "<leader>tw", lib.tmux.switch_tmux_window, { desc = "Switch [W]indows" })
set("n", "<leader>tt", lib.tmux.switch_nvim_instance, { desc = "Switch Neovim [I]nstance" })
-- set("n", "<leader>.q", lib.tmux.kill_tmux_session, { desc = "Quit TMUX Session" }) -- TODO: replace with repo-runner

set("n", config.branch_notes.mappings.toggle_note, function()
    lib.branch_notes.open_branch_note(config)
end, { desc = "Toggle Branch Note" })

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

        set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("keep", opts, { desc = "Go to Definition" }))

        set("n", "gD", function()
            vim.cmd.vsplit()
            vim.lsp.buf.definition()
        end, vim.tbl_extend("keep", opts, { desc = "Go to Definition in Split" }))

        set("n", "gi", vim.lsp.buf.implementation, opts)
        set("n", "gy", vim.lsp.buf.type_definition, opts)

        set("n", "gr", "<CMD>Trouble lsp_references<CR>", opts)
        set("n", "gR", function()
            require("fzf-lua").lsp_references({
                jump_to_single_result = true,
                winopts = {
                    height = 0.95,
                    width = 0.75,
                    preview = {
                        layout = "vertical",
                        vertical = "up:65%",
                    },
                },
            })
        end, opts)

        set({ "n", "v" }, "<leader>aa", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code [A]ction" }))
        set({ "n", "v" }, "<M-CR>", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code [A]ction" }))

        set("n", "<leader>an", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Re[n]ame" }))
    end,
})
