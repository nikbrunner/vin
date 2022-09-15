local gitsigns_status_ok, gitsigns = pcall(require, "gitsigns")
if not gitsigns_status_ok then
    return
end

local hop_ok, hop = pcall(require, "hop")

local groups = require("vin.keybindings.mappings.groups")

local M = {}

M.no_leader = {
    g = groups.advanced_g,
    s = groups.hop,

    -- disable Q
    Q = { "<Nop>", WhichKeyIgnoreLabel },

    ["<CR>"] = { Vin.cmds.general.save_all, WhichKeyIgnoreLabel },

    -- Go to Line Start and End
    H = { "^", WhichKeyIgnoreLabel },
    L = { "$", WhichKeyIgnoreLabel },

    f = {
        function()
            hop.hint_char1({
                direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                current_line_only = true,
            })
        end,
        WhichKeyIgnoreLabel,
    },
    F = {
        function()
            hop.hint_char1({
                direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
                current_line_only = true,
            })
        end,
        WhichKeyIgnoreLabel,
    },
    t = {
        function()
            hop.hint_char1({
                direction = require("hop.hint").HintDirection.AFTER_CURSOR,
                current_line_only = true,
                hint_offset = -1,
            })
        end,
        WhichKeyIgnoreLabel,
    },
    T = {
        function()
            hop.hint_char1({
                direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
                current_line_only = true,
                hint_offset = 1,
            })
        end,
        WhichKeyIgnoreLabel,
    },

    -- Trigger Hover Doc
    K = { vim.lsp.buf.hover, "Hover Doc" },

    -- Better n and N (Keep Search Hit in the middle)
    n = { "nzzzv", WhichKeyIgnoreLabel },
    N = { "Nzzzv", WhichKeyIgnoreLabel },

    -- Better j and k
    j = { "gj", WhichKeyIgnoreLabel },
    k = { "gk", WhichKeyIgnoreLabel },

    ["ZZ"] = { Vin.cmds.save_and_exit, WhichKeyIgnoreLabel },

    -- Navigate buffers and Tabs
    -- ["<S-Tab>"] = { ":tabprevious<CR>", "Prev Tab" },
    -- ["<Tab>"] = { ":tabnext<CR>", "Next Tab" },
    ["<S-Tab>"] = { ":bprevious<CR>", "Prev Buffer" },
    ["<Tab>"] = { ":bnext<CR>", "Next Buffer" },

    -- Move text up and down
    -- NOTE: This is no handled via https://github.com/booperlv/nvim-gomove/blob/main/lua/gomove/init.lua
    -- ["∆"] = { "<Esc>:m .+1<CR>", "Move Down" },
    -- ["˚"] = { "<Esc>:m .-2<CR>", "Move Up" },

    -- Control bindings

    -- ["<C-q>"] = { ":call ToggleQuickFix()<CR>", "Toggle Quickfix" },

    ["<C-b>"] = { "<cmd>NvimTreeToggle<CR>", " Toggle Tree" },
    -- ["<C-b>"] = { "<cmd>Neotree toggle left<CR>", " Toggle Tree" },
    ["<C-f>"] = { Vin.cmds.nav.pick_window, "  Pick Window" },
    ["<C-q>"] = { ":silent BufferLinePickClose<CR>", "  Pick Close Buffer" },
    ["<C-p>"] = { ":silent BufferLinePick<CR>", "  Pick Buffer" },
    ["<C-e>"] = { Vin.cmds.telescope.find_open_buffer, "﩯 Buffers" },

    ["<C-/>"] = { Vin.cmds.telescope.find_in_file, "  Find Text in File" },

    -- FN Key Bindings
    ["<F5>"] = { "<cmd>CccPick<CR>", "Color Picker" },
    ["<F6>"] = { ":call ToggleQuickFix()<CR>", "Todo Quick Fix" },
    ["<F7>"] = { "<cmd>TodoTrouble<CR>", "Todo Quick Fix" },
    ["<F8>"] = { "<cmd>TroubleToggle<CR>", "Trouble Toggle" },

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
        b = { Vin.cmds.general.blocks.select, "Select Block" },
        v = { Vin.cmds.general.line.select, "Select Line" },
        A = { Vin.cmds.general.all.select, "Select All" },
    },
    y = {
        name = "Yank",
        b = { Vin.cmds.general.blocks.yank, "Yank Block" },
        A = { Vin.cmds.general.all.yank, "Yank All" },
    },
    d = {
        name = "Delete",
        b = { Vin.cmds.general.blocks.delete, "Delete Block" },
        A = { Vin.cmds.general.all.delete, "Delete All" },
    },
}

M.with_leader = {
    -- Singles
    [";"] = { "<cmd>Alpha<cr>", "  Dashboard" },

    e = { "<cmd>NvimTreeToggle<CR>", "  File Tree" },
    -- e = { "<cmd>Neotree toggle left<CR>", "  File Tree" },
    o = { "<cmd>LSoutlineToggle<CR>", "  Symbol Tree" },
    [" "] = {
        "<cmd>Telescope file_browser<CR>",
        Vin.icons.ui.Project .. " File Browser",
    },
    f = { Vin.cmds.telescope.find_files_without_preview, "  Find File" },
    F = {
        Vin.cmds.telescope.find_files_with_preview,
        WhichKeyIgnoreLabel,
    },
    z = { Vin.cmds.zen.toggle_full_screen, "  Zen" },
    m = { "<C-w>|", "  Maximize Split" },
    r = { "<C-w>=", "  Restore Splits" },
    n = { ":nohl<CR>", WhichKeyIgnoreLabel },

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
    i = groups.insert,
    l = groups.lsp,
    h = groups.harpoon,
    q = groups.quit,
    c = groups.copy,
    t = groups.tabs,
    T = groups.terra,
}

return M
