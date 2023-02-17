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

    -- Ctrl Number bindings to jump to Harpon markings
    -- NOTE: This requires some settings in kitty to be working
    ["<C-1>"] = {
        function()
            Vin.cmds.harpoon.jump_to_file(1)
        end,
        " ",
    },
    ["<C-2>"] = {
        function()
            Vin.cmds.harpoon.jump_to_file(2)
        end,
        " ",
    },
    ["<C-3>"] = {
        function()
            Vin.cmds.harpoon.jump_to_file(3)
        end,
        " ",
    },
    ["<C-4>"] = {
        function()
            Vin.cmds.harpoon.jump_to_file(4)
        end,
        " ",
    },
    ["<C-5>"] = {
        function()
            Vin.cmds.harpoon.jump_to_file(5)
        end,
        " ",
    },

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
    ["<C-f>"] = { Vin.cmds.nav.pick_window, "  Pick Window" },
    ["<C-q>"] = { Vin.cmds.general.toggle_quickfix, "Toggle Quick Fix" },
    ["<C-'>"] = { Vin.cmds.term.toggle, "Term" },

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
    ["<C-p>"] = { "<cmd>FzfLua files<CR>", "Find File" },

    -- Resize with arrows
    ["<C-up>"] = { ":resize -2<CR>", "Resize Up" },
    ["<C-down>"] = { ":resize +2<CR>", "Resize Down" },
    ["<C-left>"] = { ":vertical resize -2<CR>", "Resize Left" },
    ["<C-right>"] = { ":vertical resize +2<CR>", "Resize Right" },

    ["["] = groups.go_prev,
    ["]"] = groups.go_next,

    ["vv"] = { "^v$", "Select Line" },
    ["vA"] = { "ggVG", "Select All" },

    ["zR"] = { require("ufo").openAllFolds, "Open all Folds (Ufo)" },
    ["zM"] = { require("ufo").closeAllFolds, "Close all Folds (Ufo)" },
    ["zm"] = { require("ufo").closeFoldsWith, "Close Folds With (Ufo)" },
    ["zp"] = {
        function()
            local winid = require("ufo").peekFoldedLinesUnderCursor()
            if not winid then
                vim.lsp.buf.hover()
            end
        end,
        "Preview Fold (Ufo)",
    },
}

M.with_leader = {
    -- Singles
    n = { vim.cmd.nohl, WhichKeyIgnoreLabel },
    l = { vim.cmd.vs, WhichKeyIgnoreLabel },
    j = { vim.cmd.sp, WhichKeyIgnoreLabel },
    ["<CR>"] = { vim.cmd.wa, "Save All (:wa)" },
    -- f = { "<cmd>Telescope find_files<CR>", "Find File" },
    f = { "<cmd>FzfLua files<CR>", "Find File" },
    [" "] = { "<cmd>Telescope buffers<CR>", "Buffers" },
    ["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Grep in File" },
    [":"] = { "<cmd>Telescope commands<CR>", "Commands" },
    ["`"] = { "<cmd>e #<CR>", "Switch to Other Buffer" },

    -- Tab navigation
    ["1"] = { "1gt", WhichKeyIgnoreLabel },
    ["2"] = { "2gt", WhichKeyIgnoreLabel },
    ["3"] = { "3gt", WhichKeyIgnoreLabel },
    ["4"] = { "4gt", WhichKeyIgnoreLabel },
    ["5"] = { "5gt", WhichKeyIgnoreLabel },
    ["6"] = { "6gt", WhichKeyIgnoreLabel },
    ["7"] = { "7gt", WhichKeyIgnoreLabel },
    ["8"] = { "8gt", WhichKeyIgnoreLabel },
    ["9"] = { "9gt", WhichKeyIgnoreLabel },

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

return M
