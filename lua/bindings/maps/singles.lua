local cmds = require("bindings.commands")
local wkGroups = require("bindings.maps.groups")

local WhichKeySingles = {}

WkIgnore = "which_key_ignore"

WhichKeySingles.noLeader = {
  normal = {
    ["H"] = { "^", "Line Start" },
    ["L"] = { "$", "Line End" },

    ["k"] = { "gk", "Adjusted k" },
    ["j"] = { "gj", "Adjusted j" },

    ["Y"] = { "y$", "Yank till end" },
    ["n"] = { "nzzzv", "Adjusted n" },
    ["N"] = { "Nzzzv", "Adjusted N" },
    ["J"] = { "mzJ`z", "Adjusted J" },

    ["<C-h>"] = { "<C-w>h", "Focus Left Pane" },
    ["<C-j>"] = { "<C-w>j", "Focus Below Pane" },
    ["<C-k>"] = { "<C-w>k", "Focus Above Pane" },
    ["<C-l>"] = { "<C-w>l", "Focus Right Pane" },

    ["<C-p>"] = { cmds.telescope("find_files"), "file" },
    ["<C-e>"] = { cmds.telescope("buffers"), "Recent Buffers" },
    ["<C-_>"] = {
      cmds.telescope("current_buffer_fuzzy_find"),
      "Find Text in File"
    },
    ["<C-s>"] = { cmds.telescope("lsp_document_symbols"), "Find Symbol in File" },
    ["<C-q>"] = { ":call ToggleQuickFix()<CR>", "Toggle QuickFix List" },

    ["<F1>"] = { cmds.telescope("help_tags"), "  Help" },
    ["<F8>"] = { cmds.lspTrouble("WorkspaceToggle"), "Workspace Errors" },
    ["<F9>"] = { cmds.todo("Telescope"), "Todo Quickfix" },
    ["<F10>"] = { "<cmd>ZenMode<CR>", "ZenMode" },

    ["<S-Tab>"] = { cmds.buffer("Previous"), "Previous Buffer" },
    ["<Tab>"] = { cmds.buffer("Next"), "Next Buffer" },
    ["˙"] = { ":tabprev<CR>", "Prev Tab" },
    ["¬"] = { ":tabnext<CR>", "Next Tab" },

    ["["] = wkGroups.goToPrevious,
    ["]"] = wkGroups.goToNext,
    g = wkGroups.go,
    v = wkGroups.block.select,
    d = wkGroups.block.delete,
    y = wkGroups.block.yank
  },
  insert = {
    [","] = { ",<c-g>u", "Add Undo Breakpoint for ," },
    ["."] = { ".<c-g>u", "Add Undo Breakpoint for ." },
    ["="] = { "=<c-g>u", "Add Undo Breakpoint for =" },
    ["!"] = { "!<c-g>u", "Add Undo Breakpoint for !" },
    ["?"] = { "?<c-g>u", "Add Undo Breakpoint for ?" },
    ["["] = { "[<c-g>u", "Add Undo Breakpoint for [" },
    ["("] = { "(<c-g>u", "Add Undo Breakpoint for (" },
    ["{"] = { "{<c-g>u", "Add Undo Breakpoint for {" }
  },
  visual = {
    ["<"] = { "<gv", "Better Indent for <" },
    [">"] = { ">gv", "Better Indent for >" },
    ["H"] = { "^", "Line Start" },
    ["L"] = { "$", "Line End" }
  }
}

WhichKeySingles.withLeader = {
  normal = {
    [";"] = { cmds.dashboard(), "﩯 Dashboard" },
    ["f"] = { cmds.telescope("find_files"), "  File" },
    ["e"] = { cmds.nvimTree("Toggle"), "  Explorer" },
    [" "] = { "<C-^>", WkIgnore },
    ["1"] = { "1gt", WkIgnore },
    ["2"] = { "2gt", WkIgnore },
    ["3"] = { "3gt", WkIgnore },
    ["4"] = { "4gt", WkIgnore },
    ["5"] = { "5gt", WkIgnore },
    ["6"] = { "6gt", WkIgnore },
    ["7"] = { "7gt", WkIgnore },
    ["8"] = { "8gt", WkIgnore },
    ["9"] = { "9gt", WkIgnore }
  }
}

return WhichKeySingles
