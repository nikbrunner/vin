local M = {}

M.advanced_g = {
    name = " Go-To",

    -- h = { vim.lsp.buf.hover, "Hover Doc" },
    -- l = { Vin.lib.focus_error, "Show Problem" },
    -- s = { Vin.cmds.telescope.find_symbol_with_aerial, "Go to Symbol" },
    -- r = { ":Trouble lsp_references<CR>", "List References" },
    -- i = { vim.lsp.buf.implementation, "Go to Implementation" },
    -- R = { "<cmd>Trouble lsp_references<CR>", "List References w/ Trouble" },

    h = { "<cmd>Lspsaga hover_doc<CR>", "Hover Doc" },
    s = { "<cmd>Lspsaga signature_help<CR>", "Hover Doc" },
    l = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Show Problem" },
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
    --[[ d = { "<cmd>Lspsaga lsp_finder<CR>", "Go to Definition" }, ]]
    D = { "<cmd>Lspsaga peek_definition<CR>", "Go to Definition" },
    i = { "<cmd>Lspsaga implement<CR>", "Go to Implementation" },
    r = { "<cmd>Lspsaga lsp_finder<CR>", "List References" },
    R = { "<cmd>Trouble lsp_references<CR>", "List References" },
    y = { "<cmd>Telescope lsp_type_definitions<CR>", "Type Defintions" },
}

M.go_prev = {
    name = "  Prev",
    q = {
        function()
            vim.cmd([[cprev]])
            Vin.lib.center_line_vertical()
        end,
        "  Prev QuickFix Item",
    },
    l = {
        function()
            vim.cmd([[lprev]])
            Vin.lib.center_line_vertical()
        end,
        "  Prev LocList Item",
    },
    b = {
        function()
            vim.cmd([[bprev]])
            Vin.lib.center_line_vertical()
        end,
        "  Prev Buffer",
    },
    e = {
        function()
            -- vim.diagnostic.goto_prev()
            -- Vin.lib.focus_error()

            vim.cmd("Lspsaga diagnostic_jump_next")
        end,
        " Prev Diagnostic",
    },
    g = { Vin.cmds.git.hunk_go_prev, "  Prev Change" },
}

M.go_next = {
    name = "  Next",
    q = {
        function()
            vim.cmd([[cnext]])
            Vin.lib.center_line_vertical()
        end,
        "  QuickFix Item",
    },
    l = {
        function()
            vim.cmd([[lnext]])
            Vin.lib.center_line_vertical()
        end,
        "  LocList Item",
    },
    b = {
        function()
            vim.cmd([[bnext]])
            Vin.lib.center_line_vertical()
        end,
        "  Buffer",
    },
    e = {
        function()
            -- vim.diagnostic.goto_next()
            -- Vin.lib.focus_error()

            vim.cmd("Lspsaga diagnostic_jump_next")
        end,
        "  Diagnostic",
    },
    g = { Vin.cmds.git.hunk_go_next, "  Change" },
}

M.symbols = {
    name = " Symbols",
    -- d = { Vin.cmds.telescope.find_symbol_with_aerial, " In Document" },
    w = { Vin.cmds.telescope.find_symbols_in_workspace, " In Workspace" },
}

M.lsp = {
    name = "  LSP",
    k = {
        function()
            vim.lsp.diagnostic.goto_prev()
            Vin.lib.focus_error()
        end,
        " Prev Diagnostic",
    },
    j = {
        function()
            vim.lsp.diagnostic.goto_next()
            Vin.lib.focus_error()
        end,
        " Next Diagnostic",
    },

    a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
    A = { "<cmd>Lspsaga range_code_action", "  Range Code Action" },
    n = { "<cmd>Lspsaga rename<CR>", "Rename" },
    r = { Vin.cmds.telescope.list_references, "List References w/ Fuzzy" },
    R = { ":Trouble lsp_references<CR>", "List References w/ Trouble" },
    d = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
    i = { "<cmd>LspInfo<CR>", "Info" },
    m = { "<cmd>Mason<CR>", "Installer Info" },
    y = { "<cmd>Telescope lsp_type_definitions<CR>", "Type Definitions" },
    p = { "<cmd>Trouble document_diagnostics<CR>", "Trouble Document Diagnostics" },
    P = {
        "<cmd>Trouble workspace_diagnostics<CR>",
        "Trouble Workspace Diagnostics",
    },
    s = M.symbols,
}

-- NOTE: Currently not used
M.explorer = {
    name = "  Explorer",
    e = { "<cmd>Neotree left toggle<CR>", " Tree" },
    f = { "<cmd>Neotree float toggle<CR>", " Float" },
    r = { "<cmd>Neotree reveal<CR>", "  Reveal File" },
    g = { "<cmd>Neotree git_status<CR>", " Git Status" },
    ["."] = { "<cmd>Neotree focus<CR>", "⊙ Focus Tree" },
}

M.quit = {
    name = "  Quit",
    s = { ":silent wq<CR>", "Save and Quit Pane (:wq)" },
    p = { ":silent BufferLinePickClose<CR>", "Pick Buffer" },
    c = { Vin.cmds.quit.custom_buffers, "Custom Filter" },
    q = { Vin.cmds.quit.current_buffer, "Current" },
    o = { Vin.cmds.quit.other_buffers, "Other" },
    h = { Vin.cmds.quit.hidden_buffers, "Hidden" },
    a = { Vin.cmds.quit.all_buffers, "All" },
}

-- NOTE: Whithout Bufferline this sections has no real value
M.buffer = {
    name = "﬘ Buffer",
    k = { ":bprev<CR>", "Previous Buffer" },
    j = { ":bnext<CR>", "Next Buffer" },
    p = { "<cmd>BufferLinePick<CR>", "  Pick" },
    P = { "<cmd>BufferLineTogglePin<CR>", "Pin" },
    q = { "<cmd>BufferLinePickClose<CR>", "  Quit" },
    f = { Vin.cmds.telescope.find_open_buffer, "Find" },
    s = {
        name = "Sort",
        r = {
            "<cmd>BufferLineSortByRelativeDirectory",
            "Sort by relative directory",
        },
        d = { "<cmd>BufferLineSortByDirectory<CR>", "Sort by directory" },
        e = { "<cmd>BufferLineSortByExtension<CR>", "Sort by extension" },
        t = { "<cmd>BufferLineSortByTabs<CR>", "Sort by tabs" },
    },
}

M.copy = {
    name = "  Copy",
    f = { Vin.cmds.copy.fullPath(), "Copy Full Path" },
    r = { Vin.cmds.copy.relativePath(), "Copy Relative Path" },
    n = { Vin.cmds.copy.fileName(), "Copy File Name" },
}

M.git = {
    name = "  Git",
    s = { "<cmd>LazyGit<CR>", "  Status" },
    a = { Vin.cmds.git.action, "  Action" },
    q = { Vin.cmds.git.open_changes_in_qf, "  List changes in QF" },
    p = { Vin.cmds.git.hunk_preview, "  Preview Hunk " },
    l = { Vin.cmds.git.toggle_current_line_blame, "  Current Line Blame" },
    o = {
        Vin.cmds.telescope.find_changed_files,
        "  Open Changed Files",
    },
    d = {
        name = "  Diffview",
        d = { "<cmd>DiffviewOpen<CR>", "Current Diff" },
        c = { Vin.cmds.diffview.get_diff_to, "Diff   To Custom" },
        h = { "<cmd>DiffviewFileHistory %<CR>", "History for Current File" },
        H = { "<cmd>DiffviewFileHistory<CR>", "Git History" },
        r = { "<cmd>DiffviewRefresh<CR>", "Refresh" },
        q = { "<cmd>DiffviewClose<CR>", "Close" },
    },
    h = {
        name = "  Hunk",
        k = { Vin.cmds.git.hunk_go_prev, "  Prev Hunk" },
        j = { Vin.cmds.git.hunk_go_next, "  Next Hunk" },
        s = { Vin.cmds.git.hunk_stage, "  Stage Hunk" },
        S = { Vin.cmds.git.hunk_undo_stage, "  Undo Stage Hunk" },
        p = { Vin.cmds.git.hunk_preview, "  Preview Hunk" },
        r = { Vin.cmds.git.hunk_reset, "  Reset Hunk" },
        b = { Vin.cmds.git.blame_line, "  Blame Line" },
    },
    b = {
        name = "﬘  Buffer",
        s = { Vin.cmds.git.buffer_stage, "  Stage Buffer" },
        r = { Vin.cmds.git.buffer_reset, "  Reset Buffer" },
    },
    c = {
        name = "  Checkout",
        b = { "<cmd>Telescope git_branches<CR>", "Branches" },
        c = { Vin.cmds.telescope.find_commits, "Commits" },
    },
    g = {
        name = "  Github",
        p = { "<cmd>Telescope gh pull_request<CR>", "Pull Requests" },
        f = { "<cmd>Telescope gh pull_request_files<CR>", "Pull Requests Files" },
        i = { "<cmd>Telescope gh issues<CR>", "Issues" },
        r = { "<cmd>Telescope gh run<CR>", "Run" },
    },
}

M.search = {
    name = "  Search",
    ["."] = { Vin.cmds.telescope.find_files_in_config, "· ~/.config" },
    n = {
        name = "  Notes",
        w = { Vin.cmds.telescope.find_files_in_work_notes, "Work" },
    },
    p = { Vin.cmds.telescope.find_projects, "  Recent Projects" },
    f = { Vin.cmds.telescope.find_files_without_preview, "  Files" },
    F = { Vin.cmds.telescope.find_files_with_preview, "  Files (With Preview)" },
    r = { Vin.cmds.telescope.find_related_files, "  Related Files" },
    t = { Vin.cmds.telescope.find_in_file, "  Find Text in File" },
    T = { Vin.cmds.telescope.find_text, "  Find Text Everywhere" },
    -- TODO: Parse or specify current issue number and provide default search term via `default_text=TODO:2322`
    d = { "<cmd>TodoTelescope<CR>", "  Todos" },
    o = { Vin.cmds.telescope.find_open_buffer, "﬘  Open Buffers" },
    g = { Vin.cmds.telescope.find_changed_files, " Open Changed Files" },
    w = { Vin.cmds.telescope.find_word, "  Find Current Word" },
    q = { Vin.cmds.telescope.find_in_quickfix, "  Quickfix" },
    S = { Vin.cmds.telescope.find_spelling, "  Spelling" },
    b = { Vin.cmds.telescope.find_open_buffer, "﩯 Buffers" },
    h = { Vin.cmds.telescope.find_oldfiles, "  Recent Files (History)" },
    c = { Vin.cmds.telescope.find_commands, "  Commands" },
    C = { Vin.cmds.telescope.find_colorscheme, "  Colorscheme" },
    m = { Vin.cmds.telescope.find_marks, " Marks" },
    a = {
        name = "Advanced",
        s = { Vin.cmds.telescope.find_scss_symbol, " SCSS Symbol" },
        h = { "<cmd>Telescope help_tags<CR>", "  Help Tags" },
        H = { "<cmd>Telescope highlights<CR>", "  Highlights" },
        m = { "<cmd>Telescope man_pages<CR>", "  Man Pages" },
        r = { "<cmd>Telescope registers<CR>", "  Registers" },
        k = { "<cmd>Telescope keymaps<CR>", "  Keymaps" },
    },
    s = M.symbols,
}

M.harpoon = {
    name = "  Harpoon",
    a = { Vin.cmds.harpoon.add_file, "  Add File" },
    m = { Vin.cmds.harpoon.toggle_quick_menu, "  Menu" },
    ["1"] = {
        function()
            Vin.cmds.harpoon.jump_to_file(1)
        end,
        " ",
    },
    ["2"] = {
        function()
            Vin.cmds.harpoon.jump_to_file(2)
        end,
        " ",
    },
    ["3"] = {
        function()
            Vin.cmds.harpoon.jump_to_file(3)
        end,
        " ",
    },
    ["4"] = {
        function()
            Vin.cmds.harpoon.jump_to_file(4)
        end,
        " ",
    },
    ["5"] = {
        function()
            Vin.cmds.harpoon.jump_to_file(5)
        end,
        " ",
    },
    ["6"] = {
        function()
            Vin.cmds.harpoon.jump_to_file(6)
        end,
        " ",
    },
    ["7"] = {
        function()
            Vin.cmds.harpoon.jump_to_file(7)
        end,
        " ",
    },
    ["8"] = {
        function()
            Vin.cmds.harpoon.jump_to_file(8)
        end,
        " ",
    },
    ["9"] = {
        function()
            Vin.cmds.harpoon.jump_to_file(9)
        end,
        " ",
    },
}

M.packer = {
    name = "  Packer",
    c = { "<cmd>PackerCompile<CR>", "Compile" },
    i = { "<cmd>PackerInstall<CR>", "Install" },
    -- s = { "<cmd>PackerSync<CR>", "Sync" },
    s = { Vin.cmds.packer.sync_with_snapshot, "Sync" },
    S = { "<cmd>PackerStatus<CR>", "Status" },
    u = { "<cmd>PackerUpdate<CR>", "Update" },
}

-- INFO unused
M.session = {
    name = "  Session",
    s = {
        function()
            vim.ui.input({
                prompt = "New session name?",
                default = "",
            }, function(session_name)
                vim.cmd("SessionSave " .. session_name)
            end)
        end,
        "Save Current Session",
    },
    S = { "<cmd>SessionSave<CR>", "Overwrite Session File" },
    c = { "<cmd>SessionClose<CR>", "Close Current Session" },
    r = { "<cmd>SessionLoad<CR>", "Restore Session" },
    l = { "<cmd>Telescope possession list<CR>", "List Sessions" },
    d = { "<cmd>SessionDelete<CR>", "Delete Session" },
}

M.insert = {
    name = "  Insert",
    l = {
        Vin.cmds.edit.log_word,
        "Log Word",
    },
}

M.tabs = {
    name = "  Tabs",
    n = { ":tabnew<CR>", "New Tab" },
    h = { ":tabprevious<CR>", "Previous Tab" },
    l = { ":tabnext<CR>", "Next Tab" },
    e = { ":tabmove<CR>", "Move Tab To End" },
    r = {
        function()
            vim.ui.input({
                prompt = "  Enter a Name for the Tab",
            }, function(input)
                if input then
                    vim.cmd("LualineRenameTab " .. input)
                else
                    return
                end
            end)
        end,
        "Rename Tab",
    },
    H = { ":tabmove -1<CR>", "Move Left" },
    L = { ":tabmove +1<CR>", "Move Right" },
    q = { ":tabclose<CR>", "Close Tab" },
    o = { ":tabonly<CR>", "Only Tab" },
    O = { "<C-w>T", "Open in new Tab" },
    ["1"] = { "1gt", "Tab 1" },
    ["2"] = { "2gt", "Tab 2" },
    ["3"] = { "3gt", "Tab 3" },
    ["4"] = { "4gt", "Tab 4" },
    ["5"] = { "5gt", "Tab 5" },
    ["6"] = { "6gt", "Tab 6" },
    ["7"] = { "7gt", "Tab 7" },
    ["8"] = { "8gt", "Tab 8" },
    ["9"] = { "9gt", "Tab 9" },
}

M.terra = {
    name = "  Terra",
    s = {
        "<cmd>lua require('terra.actions.config').select_season()<CR>",
        " Select Season",
    },
    t = {
        "<cmd>lua require('terra.actions.config').select_time()<CR>",
        "  Select Time",
    },
    c = {
        "<cmd>lua vim.pretty_print(vim.g.terra_config)<CR>",
        "  Print Terra Config",
    },
}

return M
