local cmds = require("vin.cmds")
local groups = require("vin.keymaps.groups")

local M = {}

M.no_leader = {
    g = groups.advanced_g,

    -- disable Q
    Q = { "<Nop>", WhichKeyIgnoreLabel },

    -- Trigger Hover Doc
    K = { vim.lsp.buf.hover, "Hover Doc" },

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

    -- Toggle Neotree sidbars
    ["<M-[>"] = { "<cmd>Neotree left toggle<CR>", "Neotree Left Toggle" },
    ["<M-]>"] = {
        "<cmd>Neotree git_status right toggle<CR>",
        "Neotree Right Toggle",
    },

    -- Navigate buffers and Tabs
    ["<S-Tab>"] = { "<cmd>tabprevious<CR>", "Prev Tab" },
    ["<Tab>"] = { "<cmd>tabnext<CR>", "Next Tab" },

    -- Move text up and down
    ["<M-k>"] = { "<Esc>:m .-2<CR>", "Move Up" },
    ["<M-j>"] = { "<Esc>:m .+1<CR>", "Move Down" },

    -- Better window navigation
    ["<C-h>"] = { "<C-w>h", "Focus Left" },
    ["<C-j>"] = { "<C-w>j", "Focus Down" },
    ["<C-k>"] = { "<C-w>k", "Focus Up" },
    ["<C-l>"] = { "<C-w>l", "Focus Right" },

    -- Control bindings
    ["<C-q>"] = { cmds.general.toggle_quickfix, "Toggle Quick Fix" },
    ["<C-f>"] = { cmds.explorer.toggle_float_files, "Float Explorer (Files)" },
    ["<C-e>"] = { cmds.explorer.toggle_float_buffers, "Float Explorer (Buffers)" },
    ["<C-g>"] = { cmds.explorer.toggle_float_git, "Float Explorer (Git)" },

    -- Resize with arrows
    ["<C-up>"] = { ":resize -2<CR>", "Resize Up" },
    ["<C-down>"] = { ":resize +2<CR>", "Resize Down" },
    ["<C-left>"] = { ":vertical resize -2<CR>", "Resize Left" },
    ["<C-right>"] = { ":vertical resize +2<CR>", "Resize Right" },

    -- FN Key Bindings
    ["<F1>"] = { cmds.telescope.builtin("help_tags"), "Help" },
    ["<F2>"] = { vim.lsp.buf.rename, "Rename" },
    ["<F3>"] = {
        function()
            require("persistence").load()
        end,
        "Restore Last Session",
    },
    ["<F5>"] = { cmds.term.toggle, "Term" },
    ["<F7>"] = { "<cmd>CccPick<CR>", "Color Picker" },
    ["<F8>"] = { "<cmd>TroubleToggle<CR>", "Trouble Toggle" },
    ["<F9>"] = { "<cmd>TodoTrouble<CR>", "Todo Trouble" },

    ["["] = groups.go_prev,
    ["]"] = groups.go_next,

    ["vv"] = { "^v$", "Select Line" },
    ["vA"] = { "ggVG", "Select All" },
    ["yA"] = { "ggVGy", "Copy All" },
}

M.with_leader = {
    -- Singles
    ["r"] = { "<cmd>e!<CR>", "Reload File (:e!)" },
    ["n"] = {
        "<cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
        "Hide Search (:nohl)",
    },
    ["~"] = { "<cmd>e #<CR>", "Alternative File" },
    ["<CR>"] = { vim.cmd.wa, "Save All (:wa)" },
    ["x"] = { vim.cmd.xa, "Save and Quit All (:xa)" },
    ["l"] = { vim.cmd.vs, "Split Vertical (:vs)" },
    ["j"] = { vim.cmd.sp, "Split Horizontal (:sp)" },
    ["f"] = { cmds.telescope.builtin("find_files"), "Find File" },
    [" "] = { cmds.telescope.builtin("buffers"), "Buffers" },
    [":"] = { cmds.telescope.builtin("commands"), "Commands" },
    ["/"] = { cmds.telescope.builtin("current_buffer_fuzzy_find"), "Find in File" },
    ["<TAB>"] = {
        "<cmd>Telescope telescope-tabs list_tabs theme=ivy<CR>",
        "Switch to Tabs",
    },
    ["u"] = { cmds.explorer.toggle_undo_tree, "Undotree" },

    -- Groups
    a = groups.action,
    b = groups.buffer,
    c = groups.copy,
    d = groups.diagnostics,
    e = groups.explorer,
    g = groups.git,
    m = groups.marks,
    s = groups.search,
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
