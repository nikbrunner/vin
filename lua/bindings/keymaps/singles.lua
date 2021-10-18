local cmds = require("bindings.commands")
local wkGroups = require("bindings.keymaps.groups")

local WhichKeySingles = {}

WhichKeySingles.noLeader = {
  normal = {
    ["H"] = { "^", "Line Start" },
    ["L"] = { "$", "Line End" },

    ["Y"] = { "y$", "Yank till end" },
    ["n"] = { "nzzzv", "Adjusted n" },
    ["N"] = { "Nzzzv", "Adjusted N" },
    ["J"] = { "mzJ`z", "Adjusted J" },

    ["<C-h>"] = { "<C-w>h", "Focus Left Pane" },
    ["<C-j>"] = { "<C-w>j", "Focus Below Pane" },
    ["<C-k>"] = { "<C-w>k", "Focus Above Pane" },
    ["<C-l>"] = { "<C-w>l", "Focus Right Pane" },

    ["<C-p>"] = { cmds.telescope("find_files"), "Find file" },
    ["<C-e>"] = { cmds.telescope("buffers"), "Recent Buffers" },
    ["<C-q>"] = { ":call ToggleQuickFix()<CR>", "Toggle QuickFix List" },

    ["<F8>"] = { cmds.lspTrouble("WorkspaceToggle"), "Workspace Errors" },

    ["<S-Tab>"] = { cmds.buffer("Previous"), "Previous Buffer" },
    ["<Tab>"] = { cmds.buffer("Next"), "Next Buffer" },

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
    [">"] = { ">gv", "Better Indent for >" }
  }
}

WhichKeySingles.withLeader = {
  normal = {
    [";"] = { cmds.dashboard(), "Dashboard" },
    ["f"] = { cmds.telescope("find_files"), "Find File" },
    ["e"] = { cmds.nvimTree("Toggle"), "Explorer" },
    [" "] = { "<C-^>", "Previous Buffer" }
  }
}

return WhichKeySingles
