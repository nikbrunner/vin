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
    ["<S-Tab>"] = { "<cmd>bprevious<CR>", "Prev Buffer" },
    ["<Tab>"] = { "<cmd>bnext<CR>", "Next Buffer" },

    -- Move text up and down
    ["<M-k>"] = { "<Esc>:m .-2<CR>", "Move Up" },
    ["<M-j>"] = { "<Esc>:m .+1<CR>", "Move Down" },

    -- Control bindings
    ["<C-f>"] = { cmds.nav.pick_window, "  Pick Window" },
    ["<C-q>"] = { cmds.general.toggle_quickfix, "Toggle Quick Fix" },
    ["<C-'>"] = { cmds.term.toggle, "Term" },

    -- FN Key Bindings
    ["<F7>"] = { "<cmd>CccPick<CR>", "Color Picker" },
    ["<F8>"] = { "<cmd>TroubleToggle<CR>", "Trouble Toggle" },
    ["<F9>"] = { "<cmd>TodoTrouble<CR>", "Todo Trouble" },

    -- Better window navigation
    ["<C-h>"] = { "<C-w>h", "Focus Left" },
    ["<C-j>"] = { "<C-w>j", "Focus Down" },
    ["<C-k>"] = { "<C-w>k", "Focus Up" },
    ["<C-l>"] = { "<C-w>l", "Focus Right" },

    ["<C-e>"] = { "<cmd>Neotree float<CR>", "Quick Floating File Tree" },
    ["<C-g>"] = { "<cmd>Neotree git_status float<CR>", "Quick Floating Git Files" },

    -- Resize with arrows
    ["<C-up>"] = { ":resize -2<CR>", "Resize Up" },
    ["<C-down>"] = { ":resize +2<CR>", "Resize Down" },
    ["<C-left>"] = { ":vertical resize -2<CR>", "Resize Left" },
    ["<C-right>"] = { ":vertical resize +2<CR>", "Resize Right" },

    ["["] = groups.go_prev,
    ["]"] = groups.go_next,

    ["vv"] = { "^v$", "Select Line" },
    ["vA"] = { "ggVG", "Select All" },
}

M.with_leader = {
    -- Singles
    ["n"] = { vim.cmd.nohl, WhichKeyIgnoreLabel },
    ["l"] = { vim.cmd.vs, WhichKeyIgnoreLabel },
    ["j"] = { vim.cmd.sp, WhichKeyIgnoreLabel },
    ["<CR>"] = { vim.cmd.wa, "Save All (:wa)" },
    ["f"] = { cmds.fzf.files.with_preview, "Find File" },
    [" "] = { cmds.fzf.files.buffers, "Buffers" },
    ["/"] = { cmds.fzf.text.in_file, "Find in File" },
    [":"] = { cmds.fzf.misc.commands, "Commands" },
    ["`"] = { "<cmd>e #<CR>", "Switch to Other Buffer" },

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
    x = groups.problems,
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
