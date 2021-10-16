local wk = require( "which-key" )

function plugCmd( plug, cmd )
  return "<cmd>" .. plug .. " " .. cmd .. "<CR>"
end

function telescope( cmd )
  return plugCmd( "Telescope", cmd )
end

function lspsaga( cmd )
  return plugCmd( "Lspsaga", cmd )
end

-- Function to toggle quickfix list
vim.cmd [[
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
]]

-- Define leader key
vim.g.mapleader = " "

local remap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true };

-- Adjust or Expand defaults 
-- These should not show up in which-key
remap( "n", "H", "^", options )
remap( "n", "L", "$", options )
remap( "n", "Y", "y$", options )
remap( "n", "n", "nzzzv", options )
remap( "n", "N", "Nzzzv", options )
remap( "n", "J", "mzJ`z", options )
remap( "n", "vv", "^v$", options )

-- Add undo break points after these symbols
remap( "i", ",", ",<c-g>u", options )
remap( "i", ".", ".<c-g>u", options )
remap( "i", "=", "=<c-g>u", options )
remap( "i", "!", "!<c-g>u", options )
remap( "i", "?", "?<c-g>u", options )

-- Reselect after indent
remap( "v", "<", "<gv", options )
remap( "v", ">", ">gv", options )

-- Unbind default prettier binding
remap( "n", "<leader>p", "<Nop>", options )

-- [NORMAL] MODE
local nOptions = {
  mode = "n", -- NORMAL mode
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true -- use `nowait` when creating keymaps
}

local nOptionsWithLeader = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true -- use `nowait` when creating keymaps
}

local nSingleMaps = {
  ["<S-Tab>"] = { "<cmd>BufferPrevious<CR>", "Previous Buffer" },
  ["<Tab>"] = { "<cmd>BufferNext<CR>", "Next Buffer" },

  -- Navigation
  ["<C-h>"] = { "<C-w>h", "Focus Left Window" },
  ["<C-j>"] = { "<C-w>j", "Focus Below Window" },
  ["<C-k>"] = { "<C-w>k", "Focus Above Window" },
  ["<C-l>"] = { "<C-w>l", "Focus Right Window" },

  -- Console Log Snippet
  ["cl"] = {
    "oconsole.log(\"LINE: <C-r>=line(\".\")<Esc>\",);<Esc>O<Esc>jf,a ",
    "console.log()"
  },

  -- Toggle Quick Fix List
  ["<C-q>"] = { ":call ToggleQuickFix()<CR>", "Toggle QuickFix List" },

  -- Next / Previous
  ["[q"] = { ":cprev<CR>zz", "Prev Quickfix Item" },
  ["]q"] = { ":cnext<CR>zz", "Next Quickfix Item" },
  ["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev Error" },
  ["]e"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Error" },
  ["[b"] = { ":BufferPrevious<CR>", "Prev Buffer" },
  ["]b"] = { ":BufferNext<CR>", "Next Buffer" },
  ["[g"] = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
  ["]g"] = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },

  ["gh"] = { "<cmd>Lspsaga hover_doc<CR>", "Show Hover" },
  -- ["gh"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show Hover" },
  ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
  ["gD"] = { "<cmd>Lspsaga preview_definition<CR>", "Preview Definition" },
  ["gr"] = { "<cmd>Lspsaga lsp_finder<CR>", "Goto References" },
  ["gR"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "Quickfix: References" },
  ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },

  -- TODO Add delete Block
  ["vv"] = { "^v$", "Select Line from Start to End" },
  ["v{"] = { "^vf{%", "Select { Block" },
  ["v("] = { "^vf(%", "Select ( Block" },
  ["v["] = { "^vf[%", "Select [ Block" },

  ["y{"] = { "^vf{%y", "Yank { Block" },
  ["y("] = { "^vf(%y", "Yank ( Block" },
  ["y["] = { "^vf[%y", "Yank [ Block" }
}

local nSingleMapsWithLeader = {
  [";"] = { "<cmd>Dashboard<CR>", "Dashboard" },
  ["f"] = { "<cmd>Telescope find_files<CR>", "Find File" },
  ["e"] = { "<cmd>NvimTreeToggle <CR>", "Explorer" },
  ["<leader>"] = { "<C-^>", "Prev Buffer" }
}

local nGroupMapsWithLeader = {
  l = {
    name = "  LSP",
    a = { lspsaga( "code_action" ), "Code Action" },
    n = { lspsaga( "rename" ), "Rename" },
    h = { lspsaga( "hover_doc" ), "Show Hover" },
    D = { lspsaga( "preview_definition" ), "Preview Definition" },
    d = { telescope( "lsp_definitions" ), "Definitions" },
    r = { telescope( "lsp_references" ), "References" },
    i = { telescope( "lsp_implementations" ), "Goto Implementation" },
    p = { telescope( "lsp_document_diagnostics" ), "Document Problems" },
    p = { telescope( "lsp_workspace_diagnostics" ), "Workspace Problems" },
    s = { telescope( "lsp_dynamic_workspace_symbols" ), "Symbols" },
    t = { "<cmd>LspTroubleToggle<CR>", "Trouble" }, -- TODO Find programmatically solution for plugins which work with non separated commands
    S = { "<cmd>LspInfo<CR>", "Status" }
  },
  q = {
    name = "  Quit",
    w = { "<cmd>BufferWipeout<CR>", "Wipeout" },
    q = { "<cmd>BufferClose<CR>", "Close Current Buffer" },
    o = { "<cmd>BufferCloseAllButCurrent<CR>", "Close All Buffers But Current" }
  },
  b = {
    name = "﩯 Buffer",
    j = { "<cmd>BufferPick<CR>", "Jump" },
    f = { "<cmd>Telescope buffers<CR>", "Find" },
    c = {
      name = "Close",
      w = { "<cmd>BufferWipeout<CR>", "Wipeout" },
      c = { "<cmd>BufferClose<CR>", "Close Current Buffer" },
      o = { "<cmd>BufferCloseAllButCurrent<CR>", "Close All Buffers But Current" }
    },
    p = { "<cmd>BufferPrevious<CR>", "Previous Buffer" },
    j = { "<cmd>BufferNext<CR>", "Next Buffer" },
    D = { "<cmd>BufferOrderByDirectory<CR>", "Sort by directory" },
    L = { "<cmd>BufferOrderByLanguage<CR>", "Sort by language" }
  },
  c = {
    name = "  Copy",
    f = { ":let @+ = expand('%:p')<CR>", "Copy Full Path" },
    r = { ":let @+ = expand('%')<CR>", "Copy Relative Path" },
    n = { ":let @+ = expand('%:t')<CR>", "Copy File Name" }
  },
  g = {
    name = "  Git",
    s = { "<cmd>LazyGit <CR>", "LazyGit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "Undo Stage Hunk" },
    m = { "<cmd>Telescope git_status<CR>", "Modified Files" },
    b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" }
  },
  s = {
    name = "  Search",
    b = { telescope( "buffers" ), "﩯 Buffers" },
    c = { telescope( "colorscheme" ), "  Colorscheme" },
    f = { telescope( "find_files" ), "  File" },
    h = { telescope( "help_tags" ), "  Help" },
    M = { telescope( "man_pages" ), "  Man Pages" },
    r = { telescope( "oldfiles" ), "  Recent Files" },
    p = { telescope( "projects" ), "  Recent Projects" },
    R = { telescope( "registers" ), "  Registers" },
    t = { telescope( "live_grep" ), "  Text" },
    q = { telescope( "quickfix" ), "  Quickfix" },
    w = {
      "<cmd>Telescope grep_string { search = vim.fn.expand(\"<cword>\") }<CR>",
      "  Current Word"
    },
    s = { telescope( "lsp_dynamic_workspace_symbols" ), "Symbols" },
    k = { telescope( "keymaps" ), "  Keymaps" },
    C = { telescope( "commands" ), "  Commands" }
  },
  p = {
    name = "  Packer",
    c = { "<cmd>PackerClean<CR>", "Clean" },
    C = { "<cmd>PackerCompile<CR>", "Compile" },
    i = { "<cmd>PackerInstall<CR>", "Install" },
    s = { "<cmd>PackerSync<CR>", "Sync" },
    S = { "<cmd>PackerStatus<CR>", "Status" },
    u = { "<cmd>PackerUpdate<CR>", "Update" }
  },
  v = { name = "  View", m = { ":MarkdownPreview<CR>", "Markdown Preview" } },
  z = { "<cmd>ZenMode <CR>", "Zen" }
}

wk.register( nSingleMaps, nOptions )
wk.register( nSingleMapsWithLeader, nOptionsWithLeader )
wk.register( nGroupMapsWithLeader, nOptionsWithLeader )

-- [VISUAL] MODE
local vOptions = {
  mode = "v", -- VISUAL mode
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true -- use `nowait` when creating keymaps
}

local vOptionsWithLeader = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true -- use `nowait` when creating keymaps
}

local vSingleMaps = {
  ["K"] = { ":m '<-2<CR>gv=gv", "Move Lines Up" },
  ["J"] = { ":m '>+1<CR>gv=gv", "Move Lines Down" }
}

local vSingleMapsWithLeader = { ["/"] = { ":'<,'>Commentary<CR>", "Comment" } }

local vGroupMapsWithLeader = {
  l = {
    name = "LSP",
    a = { "<cmd>Lspsaga range_code_action<CR>", "Code Action" }
  }
}

wk.register( vSingleMaps, vOptions )
wk.register( vSingleMapsWithLeader, vOptionsWithLeader )
wk.register( vGroupMapsWithLeader, vOptionsWithLeader )
