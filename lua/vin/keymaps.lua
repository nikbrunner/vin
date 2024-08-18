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

set("n", "<C-s>", vim.cmd.wa, { desc = "Save" })
set("n", "<C-q>", function()
    vim.cmd.q({ bang = true })
end, { desc = "Quit" })
set("i", "<C-s>", "<ESC>:wa<CR>", { desc = "Save and Escape" })

set("n", "vA", "ggVG", { desc = "Select All" })
set("n", "yA", "ggVGy", { desc = "Copy All" })

set("n", "x", '"_x', { desc = "Delete without yanking" })

-- Join lines while keeping position
set("n", "J", "mzJ`z", { desc = "Join Lines" })

-- Resize splits with shift + arrow
set({ "n", "v", "x" }, "<S-Down>", "<cmd>resize -2<cr>", { desc = "Resize Split Down" })
set({ "n", "v", "x" }, "<S-Up>", "<cmd>resize +2<cr>", { desc = "Resize Split Up" })

set("n", "M", lib.ui.maximize_window, { desc = "Maximize Window" })

set({ "n", "v", "x" }, "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Resize Split Left" })
set({ "n", "v", "x" }, "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Resize Split Right" })

-- Better up/down
set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

set("n", "go", "<cmd>e #<cr>", { desc = "[G]o to [O]ther File" })

-- Clear search with <esc>
set("n", "<esc>", function()
    vim.cmd.nohlsearch()
    vim.cmd.wa()
    require("mini.notify").clear()
end, { desc = "Escape and clear hlsearch" })

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

set("n", "<leader>g.", function()
    local git_root = require("vin.lib.git").find_git_root()
    if git_root then
        vim.cmd("cd " .. git_root)
        vim.notify("Changed directory to " .. git_root, vim.log.levels.INFO, { title = "Git Root" })
    else
        vim.notify("No Git root found", vim.log.levels.ERROR, { title = "Git Root" })
    end
end, { desc = "CD Git Root" })

set("n", "<leader>ur", function()
    -- Reload the config file and colorscheme
    package.loaded["vin.config"] = nil
    vim.cmd.colorscheme(require("vin.config").colorscheme)
    vim.cmd("norm zz:e!<CR>zz")
end, { desc = "[R]edraw" })

set("n", "<leader>ub", function()
    local background = vim.opt.background:get()
    local colorscheme = vim.g.colors_name or "default"

    if background == "dark" then
        vim.opt.background = "light"
        require("vin.lib.ui").handle_colors(config, colorscheme, "light")
        vim.notify("Background set to light", vim.log.levels.INFO, { title = "Background" })
    else
        vim.opt.background = "dark"
        require("vin.lib.ui").handle_colors(config, colorscheme, "dark")
        vim.notify("Background set to dark", vim.log.levels.INFO, { title = "Background" })
    end
end, { desc = "Toggle [B]ackground" })

set("n", "<leader>ui", vim.show_pos, { desc = "[I]nspect Position" })

set("n", "<leader>uc", function()
    local defaultLevel = 0
    local currentLevel = vim.o.conceallevel
    local nextLevel = currentLevel == 0 and 3 or defaultLevel
    vim.o.conceallevel = nextLevel
    vim.notify("Conceal level set to " .. nextLevel, vim.log.levels.INFO, { title = "Conceal" })
end, { desc = "Toggle [C]onceal (0, 3)" })

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
end, { desc = "Toggle Specific [C]onceal Level" })

set("n", "<leader>ud", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled({}))
end, { desc = "Toggle [D]iagnostics" })

set("n", "<leader>us", function()
    if vim.o.spell then
        vim.o.spell = false
        vim.notify("Spell check disabled", vim.log.levels.WARN, { title = "Spell Check" })
    else
        vim.o.spell = true
        vim.notify("Spell check enabled", vim.log.levels.INFO, { title = "Spell Check" })
    end
end, { desc = "Toggle [S]pell" })

set("n", "z=", function()
    require("fzf-lua").spell_suggest({ winopts = { height = 0.35, width = 0.65 } })
end, { desc = "[S]pelling Suggestions" })

set("n", "<leader>uw", function()
    if vim.o.wrap then
        vim.o.wrap = false
        vim.notify("Text wrapping disabled", vim.log.levels.WARN, { title = "Text Wrapping" })
    else
        vim.o.wrap = true
        vim.notify("Text wrapping enabled", vim.log.levels.INFO, { title = "Text Wrapping" })
    end
end, { desc = "Toggle Text [W]rapping" })

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
end, { desc = "Toggle [L]ine Numbers" })

-- prev/next
set("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
set("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

set("n", "<S-Tab>", vim.cmd.tabprevious, { desc = "Previous Tab" })
set("n", "<Tab>", vim.cmd.tabnext, { desc = "Next Tab" }) -- attention: this will block native binding <ctrl-i>
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
set("n", "<leader>vp", "<cmd>Lazy<CR>", { desc = "[P]lugin Manager - [LazyVim]" })
set("n", "<leader>vP", "<cmd>Mason<CR>", { desc = "[P]ackage Manager - [Mason]" })
set("n", "<leader>vl", "<cmd>LspInfo<CR>", { desc = "[L]SP Info" })
set("n", "<leader>vL", "<cmd>LspRestart<CR>", { desc = "Restart [L]SP " })

-- [C] Action Group
set({ "n", "v" }, "<leader>cc", function()
    lib.copy.list_paths()
end, { desc = "[C]opy" })

set("n", "<leader>cll", lib.log.log_symbol, { desc = "[L]og" })
set("n", "<leader>cld", lib.log.delete_logs, { desc = "[D]elete" })

-- Only native Vim lsp keymaps are defined here.
-- Lsp Mappings which are depended on a plugin are defined in the plugin spec file with the same event name.
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- See `:help vim.lsp.buf for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        set("n", "K", vim.lsp.buf.hover, opts)
        set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

        set("n", "gD", function()
            vim.cmd.vsplit()
            vim.lsp.buf.definition()
            vim.cmd("norm zz")
        end, vim.tbl_extend("keep", opts, { desc = "Go to Definition in Split" }))

        set("n", "gi", vim.lsp.buf.implementation, opts)
        set("n", "gy", vim.lsp.buf.type_definition, opts)

        set("n", "g.", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Action" }))

        set("n", "cn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "[C]hange [N]ame" }))
        set("n", "<leader>cn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Re[n]ame" }))

        set("n", "gl", vim.diagnostic.open_float, { desc = "Open Diagnostic" })

        set("n", "<leader>uh", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
        end, { desc = "Toggle Inlay [H]ints" })
    end,
})
