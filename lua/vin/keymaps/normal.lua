local gitsigns_status_ok, gitsigns = pcall(require, "gitsigns")
if not gitsigns_status_ok then
    return
end

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

    ["ZZ"] = { vin.cmds.save_and_exit, WhichKeyIgnoreLabel },

    -- Navigate buffers and Tabs
    ["<M-h>"] = { ":bprevious<CR>", "Prev Buffer" },
    ["<M-l>"] = { ":bnext<CR>", "Next Buffer" },

    ["<M-[>"] = { "<cmd>NvimTreeToggle<CR>", "  File Tree" },
    ["<M-]>"] = { "<cmd>LSoutlineToggle<CR>", "  Symbol Tree" },

    -- Move text up and down
    ["<M-k>"] = { "<Esc>:m .-2<CR>", "Move Up" },
    ["<M-j>"] = { "<Esc>:m .+1<CR>", "Move Down" },

    ["<C-f>"] = { vin.cmds.nav.pick_window, "  Pick Window" },
    ["<C-/>"] = { vin.cmds.telescope.find_in_file, "  Find Text in File" },

    -- FN Key Bindings
    ["<F6>"] = { ":call ToggleQuickFix()<CR>", "Todo Quick Fix" },
    ["<F7>"] = { "<cmd>CccPick<CR>", "Color Picker" },
    ["<F8>"] = { "<cmd>TroubleToggle<CR>", "Trouble Toggle" },
    ["<F9>"] = { "<cmd>TodoTrouble<CR>", "Todo Trouble" },

    -- Better window navigation
    ["<C-h>"] = { "<C-w>h", "Focus Left" },
    ["<C-j>"] = { "<C-w>j", "Focus Down" },
    ["<C-k>"] = { "<C-w>k", "Focus Up" },
    ["<C-l>"] = { "<C-w>l", "Focus Right" },

    -- Resize with arrows
    ["<C-up>"] = { ":resize -2<CR>", "Resize Up" },
    ["<C-down>"] = { ":resize +2<CR>", "Resize Down" },
    ["<C-left>"] = { ":vertical resize -2<CR>", "Resize Left" },
    ["<C-right>"] = { ":vertical resize +2<CR>", "Resize Right" },

    ["["] = groups.go_prev,
    ["]"] = groups.go_next,

    v = {
        name = "Select",
        b = { vin.cmds.general.blocks.select, "Select Block" },
        v = { vin.cmds.general.line.select, "Select Line" },
        A = { vin.cmds.general.all.select, "Select All" },
    },
    y = {
        name = "Yank",
        b = { vin.cmds.general.blocks.yank, "Yank Block" },
        A = { vin.cmds.general.all.yank, "Yank All" },
    },
    d = {
        name = "Delete",
        b = { vin.cmds.general.blocks.delete, "Delete Block" },
        A = { vin.cmds.general.all.delete, "Delete All" },
    },
}

M.with_leader = {
    -- Singles
    e = { "<cmd>NvimTreeToggle<CR>", "File Tree" },
    o = { "<cmd>LSoutlineToggle<CR>", "Symbol Tree" },
    [" "] = { vin.cmds.telescope.find_open_buffer, "Buffers" },
    f = { vin.cmds.telescope.find_files_without_preview, "Find File" },
    F = { vin.cmds.telescope.find_files_with_preview, WhichKeyIgnoreLabel },
    z = { vin.cmds.zen.toggle_full_screen, "Zen" },
    M = { "<C-w>|", "Maximize Split" },
    r = { "<C-w>=", "Restore Splits" },
    n = { ":nohl<CR>", WhichKeyIgnoreLabel },
    ["/"] = { vin.cmds.telescope.find_in_file, "Find Text in File" },

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
    b = groups.buffer,
    P = groups.packer,
    s = groups.search,
    g = groups.git,
    d = groups.debug,
    l = groups.lsp,
    m = groups.marks,
    q = groups.quit,
    c = groups.copy,
    t = groups.tabs,
    T = groups.terra,
}

return M
