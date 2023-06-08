local cmds = require("vin.cmds")
local groups = require("vin.keymaps.groups")

local M = {}

M.no_leader = {
    g = groups.g,

    -- disable Q
    Q = { "<Nop>", WhichKeyIgnoreLabel },

    -- Trigger Hover Doc
    K = { "<cmd>Lspsaga hover_doc<CR>", "Hover Doc" },

    -- Better n and N (Keep Search Hit in the middle)
    n = { "nzzzv", WhichKeyIgnoreLabel },
    N = { "Nzzzv", WhichKeyIgnoreLabel },

    -- Better j and k
    j = { "gj", WhichKeyIgnoreLabel },
    k = { "gk", WhichKeyIgnoreLabel },

    J = { "mzJ`z", WhichKeyIgnoreLabel },

    -- Easier Start and Beginng of line
    H = { "^", WhichKeyIgnoreLabel },
    L = { "$", WhichKeyIgnoreLabel },

    -- Navigate buffers and Tabs
    ["<S-Tab>"] = { "<cmd>tabprevious<CR>", "Prev Tab" },
    ["<Tab>"] = { "<cmd>tabnext<CR>", "Next Tab" },

    -- Move text up and down
    ["<M-k>"] = { "<Esc>:m .-2<CR>", "Move Up" },
    ["<M-j>"] = { "<Esc>:m .+1<CR>", "Move Down" },

    -- Window navigation
    -- NOTE: Currently handled via https://github.com/christoomey/vim-tmux-navigator
    -- NOTE: Also see: https://github.com/christoomey/vim-tmux-navigator/issues/295#issuecomment-922092511
    -- ["<C-h>"] = { "<C-w>h", "Focus Left" },
    -- ["<C-j>"] = { "<C-w>j", "Focus Down" },
    -- ["<C-k>"] = { "<C-w>k", "Focus Up" },
    -- ["<C-l>"] = { "<C-w>l", "Focus Right" },

    -- Control bindings
    ["<C-q>"] = { cmds.general.toggle_quickfix, "Toggle Quick Fix" },
    ["<C-f>"] = { "<cmd>Neotree float toggle<CR>", "Float Explorer (Files)" },
    ["<C-g>"] = {
        "<cmd>Neotree float git_status toggle<CR>",
        "Float Explorer (Git)",
    },

    -- Disabled, because currently creates conflict: https://github.com/nvimdev/lspsaga.nvim/issues/1070#issuecomment-1575097594
    -- ["<C-e>"] = { cmds.explorer.toggle_float_buffers, "Float Explorer (Buffers)" },

    -- Resize with arrows
    ["<C-up>"] = { ":resize -2<CR>", "Resize Up" },
    ["<C-down>"] = { ":resize +2<CR>", "Resize Down" },
    ["<C-left>"] = { ":vertical resize -2<CR>", "Resize Left" },
    ["<C-right>"] = { ":vertical resize +2<CR>", "Resize Right" },

    -- FN Key Bindings
    ["<F1>"] = { cmds.telescope.builtin("help_tags"), "Help" },
    ["<F2>"] = { "<cmd>Lspsaga rename<CR>", "Rename" },
    ["<F3>"] = {
        function()
            require("persistence").load()
        end,
        "Restore Last Session",
    },
    ["<F5>"] = { cmds.term.toggle, "Term" },
    ["<F7>"] = { "<cmd>CccPick<CR>", "Color Picker" },
    ["<F8>"] = { "<cmd>TroubleToggle<CR>", "Trouble Toggle" },
    ["<F9>"] = { "<cmd>DiagWindowShow<CR>", "Diag Window" },

    ["["] = groups.go_prev,
    ["]"] = groups.go_next,

    ["vv"] = { "^v$", "Select Line" },
    ["vA"] = { "ggVG", "Select All" },
    ["yA"] = { "ggVGy", "Copy All" },
}

M.with_leader = {
    -- Singles
    n = { vim.cmd.nohlsearch, "No Highlight Search (:nohlsearch)" },
    f = { cmds.telescope.builtin("find_files"), "Find File" },
    [";"] = { "<cmd>Dashboard<CR>", "Dashboard" },
    ["`"] = { "<cmd>e #<CR>", "Alternative File" },
    ["<CR>"] = {
        function()
            vim.notify("Saved All", vim.log.levels.INFO, { title = "Vin" })
            vim.cmd.wa()
        end,
        "Save All (:wa)",
    },
    [" "] = { cmds.telescope.builtin("buffers"), "Buffers" },
    [":"] = { cmds.telescope.builtin("commands"), "Commands" },
    ["/"] = { cmds.telescope.builtin("current_buffer_fuzzy_find"), "Find in File" },
    ["<TAB>"] = {
        "<cmd>Telescope telescope-tabs list_tabs theme=ivy<CR>",
        "Switch to Tabs",
    },

    -- Groups
    a = groups.action,
    e = groups.explorer,
    c = groups.copy,
    d = groups.diagnostics,
    g = groups.git,
    i = groups.insert,
    m = groups.marks,
    s = groups.search,
    u = groups.ui,
    O = groups.obsidian,
    t = groups.tabs,
    v = groups.vin,
    w = groups.windows,
    q = groups.quit,
    S = groups.session,
}

-- Harpoon Mark Navigation
for n = 1, 9 do
    M.with_leader[tostring(n)] = {
        function()
            cmds.harpoon.jump_to_file(n)
        end,
        WhichKeyIgnoreLabel,
    }
end

return M
