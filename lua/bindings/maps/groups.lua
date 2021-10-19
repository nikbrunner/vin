local cmds = require("bindings.commands")
local WhichKeyGroups = {}

WhichKeyGroups.go = {
  name = "  Go",
  h = { cmds.lspsaga("hover_doc"), "Show Hover" },
  s = { cmds.lazyGit(), "Git Status" },
  m = { cmds.telescope("git_status"), "Modified Files" },
  d = { cmds.vimLsp("definition()"), "Goto Definition" },
  D = { cmds.lspsaga("preview_definition"), "Preview Definition" },
  r = { cmds.lspsaga("lsp_finder"), "Goto References" },
  R = { cmds.vimLsp("references()"), "References to QF" },
  I = { cmds.vimLsp("implementation()"), "Goto Implementation" }
}

WhichKeyGroups.goToPrevious = {
  name = "  Previous",
  q = { ":cprev<CR>zz", "Quickfix Item" },
  e = { cmds.lspsaga("diagnostic_jump_prev"), "Error" },
  b = { cmds.buffer("Previous"), "Buffer" },
  g = { cmds.gitsigns("prev_hunk"), "Hunk" }
}

WhichKeyGroups.goToNext = {
  name = "  Next",
  q = { ":cnext<CR>zz", "Quickfix Item" },
  e = { cmds.lspsaga("diagnostic_jump_next"), "Error" },
  b = { cmds.buffer("Next"), "Buffer" },
  g = { cmds.gitsigns("next_hunk"), "Hunk" }
}

WhichKeyGroups.block = {
  select = {
    name = "  Select Block",
    v = { "^v$", "Select Line from Start to End" },
    ["{"] = { "^vf{%", "Select { Block" },
    ["("] = { "^vf(%", "Select ( Block" },
    ["["] = { "^vf[%", "Select [ Block" }
  },
  delete = {
    name = "  Delete Block",
    ["{"] = { "^vf{%d", "Delete { Block" },
    ["("] = { "^vf(%d", "Delete ( Block" },
    ["["] = { "^vf[%d", "Delete [ Block" }
  },
  yank = {
    name = "  Yank Block",
    ["{"] = { "^vf{%y", "Yank { Block" },
    ["("] = { "^vf(%y", "Yank ( Block" },
    ["["] = { "^vf[%y", "Yank [ Block" }
  }
}

WhichKeyGroups.lsp = {
  name = "  LSP",
  a = { cmds.lspsaga("code_action"), "Code Action" },
  n = { cmds.lspsaga("rename"), "Rename" },
  h = { cmds.lspsaga("hover_doc"), "Hover" },
  l = { cmds.lspInstall("Info"), "Languages" },
  ["["] = { cmds.lspsaga("diagnostic_jump_prev"), "Previous Problem" },
  ["]"] = { cmds.lspsaga("diagnostic_jump_next"), "Next Problem" },
  p = {
    name = "  Problems",
    ["["] = { cmds.lspsaga("diagnostic_jump_prev"), "Prev" },
    ["]"] = { cmds.lspsaga("diagnostic_jump_next"), "Next" },
    d = { cmds.telescope("lsp_document_diagnostics"), "Document" },
    w = { cmds.telescope("lsp_workspace_diagnostics"), "Workspace" },
    t = { cmds.lspTrouble("Toggle"), "Trouble" }
  },
  g = {
    name = "Go to",
    d = { cmds.telescope("lsp_definitions"), "Definitions" },
    D = { cmds.lspsaga("preview_definition"), "Preview Definition" },
    r = { cmds.telescope("lsp_references"), "References" },
    i = { cmds.telescope("lsp_implementations"), "Implementation" },
    s = { cmds.telescope("lsp_dynamic_workspace_symbols"), "Symbols" }
  }
}

WhichKeyGroups.quit = {
  name = "  Quit",
  w = { cmds.buffer("Wipeout"), "Wipeout" },
  q = { cmds.buffer("Close"), "Close Current Buffer" },
  o = { cmds.buffer("CloseAllButCurrent"), "Close All Buffers But Current" }
}

WhichKeyGroups.buffer = {
  name = "﩯 Buffer",
  p = { cmds.buffer("Pick"), "Pick" },
  f = { cmds.telescope("buffers"), "Find" },
  ["["] = { cmds.buffer("Previous"), "Previous Buffer" },
  ["]"] = { cmds.buffer("Next"), "Next Buffer" },
  s = {
    name = "Sort",
    d = { cmds.buffer("OrderByDirectory"), "Sort by directory" },
    l = { cmds.buffer("OrderByLanguage"), "Sort by language" }
  },
  q = {
    name = "  Quit",
    w = { cmds.buffer("Wipeout"), "Wipeout" },
    c = { cmds.buffer("Close"), "Close Current Buffer" },
    o = { cmds.buffer("CloseAllButCurrent"), "Close All Buffers But Current" }
  }
}

WhichKeyGroups.copy = {
  name = "  Copy",
  f = { cmds.copy.fullPath(), "Copy Full Path" },
  r = { cmds.copy.relativePath(), "Copy Relative Path" },
  n = { cmds.copy.fileName(), "Copy File Name" }
}

WhichKeyGroups.git = {
  name = "  Git",
  s = { cmds.lazyGit(), "Status" },
  b = { cmds.gitsigns("blame_line"), "Blame" },
  m = { cmds.telescope("git_status"), "Modified Files" },
  ["["] = { cmds.gitsigns("prev_hunk"), "Previous Change" },
  ["]"] = { cmds.gitsigns("next_hunk"), "Next Change" },
  R = { cmds.gitsigns("reset_buffer"), "Revert Changes in Buffer" },
  h = {
    name = "Hunk",
    ["["] = { cmds.gitsigns("prev_hunk"), "Previous" },
    ["]"] = { cmds.gitsigns("next_hunk"), "Next" },
    u = { cmds.gitsigns("undo_stage_hunk"), "Undo Stage" },
    p = { cmds.gitsigns("preview_hunk"), "Preview" },
    r = { cmds.gitsigns("reset_hunk"), "Reset" }
  },
  c = {
    name = "Checkout",
    b = { cmds.telescope("git_branches"), "Checkout branch" },
    c = { cmds.telescope("git_commits"), "Checkout commit" }
  }
}

WhichKeyGroups.search = {
  name = "  Search",
  b = { cmds.telescope("buffers"), "﩯 Buffers" },
  e = { cmds.telescope("file_browser"), "  Explorer" },
  d = { cmds.telescope("find_files", "cwd=~/.config/nvim"), "·· Dots" },
  c = { cmds.telescope("colorscheme"), "  Colorscheme" },
  f = { cmds.telescope("find_files"), "  Files" },
  i = { cmds.telescope("current_buffer_fuzzy_find"), "  Find in File" },
  h = { cmds.telescope("help_tags"), "  Help" },
  M = { cmds.telescope("man_pages"), "  Man Pages" },
  r = { cmds.telescope("oldfiles"), "  Recent Files" },
  p = { cmds.telescope("projects"), "  Recent Projects" },
  R = { cmds.telescope("registers"), "  Registers" },
  t = { cmds.telescope("live_grep"), "  Text" },
  T = { cmds.telescope(), "  Telescope" },
  q = { cmds.telescope("quickfix"), "  Quickfix" },
  w = { cmds.telescope("grep_string"), "  Current Word" },
  s = {
    name = "Symbols",
    w = { cmds.telescope("lsp_dynamic_workspace_symbols"), "Workspace" },
    d = { cmds.telescope("lsp_document_symbols"), "Document" }
  },
  k = { cmds.telescope("keymaps"), "  Keymaps" },
  C = { cmds.telescope("commands"), "  Commands" }
}

WhichKeyGroups.packages = {
  name = "  Packages",
  c = { cmds.packer("Compile"), "Compile" },
  i = { cmds.packer("Install"), "Install" },
  s = { cmds.packer("Sync"), "Sync" },
  S = { cmds.packer("Status"), "Status" },
  u = { cmds.packer("Update"), "Update" }
}

WhichKeyGroups.view = {
  name = "  View",
  m = { ":MarkdownPreview<CR>", "Markdown Preview" },
  z = { "<cmd>ZenMode<CR>", "Zen" }
}

WhichKeyGroups.todo = {
  name = "  Todo",
  t = { cmds.todo("Telescope"), "Telescope" },
  q = { cmds.todo("QuickFix"), "QuickFix" },
  r = { cmds.todo("Trouble"), "Trouble" }
}

WhichKeyGroups.insert = {
  name = "  Insert",
  l = {
    "oconsole.log(\"LINE: <C-r>=line(\".\")<Esc>\",);<Esc>O<Esc>jf,a ",
    "console.log()"
  }
}

return WhichKeyGroups
