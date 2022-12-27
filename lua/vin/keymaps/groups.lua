local M = {}

local cmds = vin.cmds

M.advanced_g = {
    name = "Go-To",

    h = { vim.lsp.buf.hover, "Hover Doc" },
    l = { vim.diagnostic.open_float, "Show Problem" },

    -- LSP Native
    -- d = { vim.lsp.buf.definition, "Find Definition" },
    -- r = { vim.lsp.buf.references, "Find References" },
    -- i = { vim.lsp.buf.implementation, "Find Implementations" },
    -- y = { vim.lsp.buf.type_definition, "Find Type Definition" },

    -- Telescope
    d = { cmds.telescope.find_definitions, "Find Definition" },
    r = { cmds.telescope.find_references, "Find References" },
    i = { cmds.telescope.find_implementations, "Find Implementations" },
    y = { cmds.telescope.find_type_defintions, "Find Type Definition" },

    -- Trouble
    D = { "<cmd>Trouble lsp_definitions<CR>", "Find Definition" },
    R = { "<cmd>Trouble lsp_references<CR>", "Find References" },
    I = { "<cmd>Trouble lsp_implemantations<CR>", "Find Implementations" },
    Y = { "<cmd>Trouble lsp_type_definitions<CR>", "Find Type Definition" },
}

M.go_prev = {
    name = "Prev",
    q = {
        function()
            vim.cmd([[cprev]])
            vin.cmds.general.center_line_vertical()
        end,
        "QuickFix Item",
    },
    l = {
        function()
            vim.cmd([[lprev]])
            vin.cmds.general.center_line_vertical()
        end,
        "LocList Item",
    },
    b = {
        function()
            vim.cmd([[bprev]])
            vin.cmds.general.center_line_vertical()
        end,
        "Buffer",
    },
    e = {
        function()
            vim.diagnostic.goto_prev()
        end,
        "Diagnostic",
    },
    g = { vin.cmds.git.hunk_go_prev, "Change" },
}

M.go_next = {
    name = "Next",
    q = {
        function()
            vim.cmd([[cnext]])
            vin.cmds.general.center_line_vertical()
        end,
        "QuickFix Item",
    },
    l = {
        function()
            vim.cmd([[lnext]])
            vin.cmds.general.center_line_vertical()
        end,
        "LocList Item",
    },
    b = {
        function()
            vim.cmd([[bnext]])
            vin.cmds.general.center_line_vertical()
        end,
        "Buffer",
    },
    e = {
        function()
            vim.diagnostic.goto_next()
        end,
        "Diagnostic",
    },
    g = { vin.cmds.git.hunk_go_next, "Change" },
}

M.symbols = {
    name = "Symbols",
    d = { "<cmd>Telescope lsp_document_symbols<CR>", "Symbols In Document" },
    w = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Symbols In Workspace" },
}

M.diagnostics = {
    name = "Diagnostics",
    d = { "<cmd>Trouble document_diagnostics<CR>", "Document Diagnostics" },
    w = { "<cmd>Trouble workspace_diagnostics<CR>", "Workspace Diagnostics" },
}

M.lsp = {
    name = "LSP",
    d = M.diagnostics,
    s = M.symbols,
    g = M.advanced_g,

    k = {
        function()
            vim.lsp.diagnostic.goto_prev()
        end,
        "Prev Diagnostic",
    },
    j = {
        function()
            vim.lsp.diagnostic.goto_next()
        end,
        "Next Diagnostic",
    },

    f = { "<cmd>Format<CR>", "Format" },
    a = { vim.lsp.buf.code_action, "Code Action" },
    n = { vim.lsp.buf.rename, "Rename" },
    i = { "<cmd>LspInfo<CR>", "Info" },
}

-- NOTE: Currently not used
M.explorer = {
    name = "Explorer",
    e = { "<cmd>Neotree left toggle<CR>", "Tree" },
    f = { "<cmd>Neotree float toggle<CR>", "Float" },
    r = { "<cmd>Neotree reveal<CR>", "Reveal File" },
    g = { "<cmd>Neotree git_status<CR>", "Git Status" },
    ["."] = { "<cmd>Neotree focus<CR>", "Focus Tree" },
}

M.quit = {
    name = "Quit",
    s = { "<cmd>silent wq<CR>", "Save and Quit Pane (:wq)" },
    c = { vin.cmds.quit.custom_buffers, "Custom Filter" },
    q = { vin.cmds.quit.current_buffer, "Current" },
    o = { vin.cmds.quit.other_buffers, "Other" },
    h = { vin.cmds.quit.hidden_buffers, "Hidden" },
    a = { vin.cmds.quit.all_buffers, "All" },
}

M.copy = {
    name = "Copy",
    f = { vin.cmds.copy.fullPath, "Copy Full Path" },
    r = { vin.cmds.copy.relativePath, "Copy Relative Path" },
    n = { vin.cmds.copy.fileName, "Copy File Name" },
}

M.git = {
    name = "Git",
    k = { vin.cmds.git.hunk_go_prev, "Change" },
    j = { vin.cmds.git.hunk_go_next, "Change" },

    s = { "<cmd>LazyGit<CR>", "Status" },
    q = { vin.cmds.git.open_changes_in_qf, "List changes in QF" },
    p = { vin.cmds.git.hunk_preview, "Preview Hunk " },
    l = { vin.cmds.git.toggle_current_line_blame, "Current Line Blame" },
    o = { vin.cmds.telescope.find_changed_files, "Open Changed Files" },
    d = {
        name = "Diffview",
        c = { vin.cmds.diffview.get_diff_to, "Diff To Custom" },
        d = { "<cmd>DiffviewOpen<CR>", "Current Diff" },
        h = { "<cmd>DiffviewFileHistory %<CR>", "History for Current File" },
        H = { "<cmd>DiffviewFileHistory<CR>", "Git History" },
        r = { "<cmd>DiffviewRefresh<CR>", "Refresh" },
        q = { "<cmd>DiffviewClose<CR>", "Close" },
    },
    h = {
        name = "Hunk",
        k = { vin.cmds.git.hunk_go_prev, "Prev Hunk" },
        j = { vin.cmds.git.hunk_go_next, "Next Hunk" },
        s = { vin.cmds.git.hunk_stage, "Stage Hunk" },
        S = { vin.cmds.git.hunk_undo_stage, "Undo Stage Hunk" },
        p = { vin.cmds.git.hunk_preview, "Preview Hunk" },
        r = { vin.cmds.git.hunk_reset, "Reset Hunk" },
        b = { vin.cmds.git.blame_line, "Blame Line" },
    },
    b = {
        name = "Buffer",
        s = { vin.cmds.git.buffer_stage, "Stage Buffer" },
        r = { vin.cmds.git.buffer_reset, "Reset Buffer" },
    },
    c = {
        name = "Checkout",
        b = { "<cmd>Telescope git_branches<CR>", "Branches" },
        c = { vin.cmds.telescope.find_commits, "Commits" },
    },
    g = {
        name = "Github",
        p = { "<cmd>Telescope gh pull_request<CR>", "Pull Requests" },
        f = { "<cmd>Telescope gh pull_request_files<CR>", "Pull Requests Files" },
        i = { "<cmd>Telescope gh issues<CR>", "Issues" },
        r = { "<cmd>Telescope gh run<CR>", "Run" },
    },
}

M.search = {
    name = "Search",
    d = M.diagnostics,
    s = M.symbols,

    p = { vin.cmds.telescope.find_projects, "Recent Projects" },
    f = { vin.cmds.telescope.find_files_without_preview, "Files" },
    F = { vin.cmds.telescope.find_files_with_preview, "Files (With Preview)" },
    r = { vin.cmds.telescope.find_related_files, "Related Files" },
    t = { vin.cmds.telescope.find_text, "Find Text Everywhere" },
    o = { vin.cmds.telescope.find_open_buffer, "Open Buffers" },
    g = { vin.cmds.telescope.find_changed_files, "Open Changed Files" },
    w = { vin.cmds.telescope.find_word, "Find Current Word" },
    q = { vin.cmds.telescope.find_in_quickfix, "Quickfix" },
    S = { vin.cmds.telescope.find_spelling, "Spelling" },
    b = { vin.cmds.telescope.find_open_buffer, "Buffers" },
    h = { vin.cmds.telescope.find_oldfiles, "Recent Files (History)" },
    c = { vin.cmds.telescope.find_commands, "Commands" },
    C = { vin.cmds.telescope.find_colorscheme, "Colorscheme" },
    m = { vin.cmds.telescope.find_marks, "Marks" },
    T = { "<cmd>TodoTelescope<CR>", "Todos" },
    a = {
        name = "Advanced",
        s = { vin.cmds.telescope.find_scss_symbol, "SCSS Symbol" },
        h = { "<cmd>Telescope help_tags<CR>", "Help Tags" },
        H = { "<cmd>Telescope highlights<CR>", "Highlights" },
        m = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
        r = { "<cmd>Telescope registers<CR>", "Registers" },
        k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
    },
    ["/"] = {
        name = "Preset Folders",
        c = {
            function()
                vin.cmds.telescope.search_in_dir("~/.config")
            end,
            "~/.config",
        },
        v = {
            function()
                vin.cmds.telescope.search_in_dir("~/.config/nvim")
            end,
            "~/.config/nvim (Vin)",
        },
        n = {
            name = "Notes",
            w = {
                function()
                    vin.cmds.telescope.search_in_dir("~/Documents/notes/dcd-notes")
                end,
                "Work Notes",
            },
            n = {
                function()
                    vin.cmds.telescope.search_in_dir("~/Documents/notes/notes")
                end,
                "Private Notes",
            },
        },
    },
}

M.marks = {
    name = "Marks",
    a = { vin.cmds.harpoon.add_file, "Add File to Harpoon" },
    m = { vin.cmds.harpoon.toggle_quick_menu, "Harpoon Menu" },
    ["1"] = {
        function()
            vin.cmds.harpoon.jump_to_file(1)
        end,
        " ",
    },
    ["2"] = {
        function()
            vin.cmds.harpoon.jump_to_file(2)
        end,
        " ",
    },
    ["3"] = {
        function()
            vin.cmds.harpoon.jump_to_file(3)
        end,
        " ",
    },
    ["4"] = {
        function()
            vin.cmds.harpoon.jump_to_file(4)
        end,
        " ",
    },
    ["5"] = {
        function()
            vin.cmds.harpoon.jump_to_file(5)
        end,
        " ",
    },
    ["6"] = {
        function()
            vin.cmds.harpoon.jump_to_file(6)
        end,
        " ",
    },
    ["7"] = {
        function()
            vin.cmds.harpoon.jump_to_file(7)
        end,
        " ",
    },
    ["8"] = {
        function()
            vin.cmds.harpoon.jump_to_file(8)
        end,
        " ",
    },
    ["9"] = {
        function()
            vin.cmds.harpoon.jump_to_file(9)
        end,
        " ",
    },
}

M.tabs = {
    name = "Tabs",
    n = { "<cmd>tabnew<CR>", "New Tab" },
    h = { "<cmd>tabprevious<CR>", "Previous Tab" },
    l = { "<cmd>tabnext<CR>", "Next Tab" },
    e = { "<cmd>tabmove<CR>", "Move Tab To End" },
    H = { "<cmd>tabmove -1<CR>", "Move Left" },
    L = { "<cmd>tabmove +1<CR>", "Move Right" },
    q = { "<cmd>tabclose<CR>", "Close Tab" },
    o = { "<cmd>tabonly<CR>", "Only Tab" },
    O = { "<C-w>T", "Open in new Tab" },
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
    name = "Terra",
    s = {
        function()
            require("terra.actions.config").select_season()
        end,
        "Select Season",
    },
    t = {
        function()
            require("terra.actions.config").select_time()
        end,
        "Select Time",
    },
    c = {
        function()
            vim.pretty_print(vim.g.terra_config)
        end,
        "Print Terra Config",
    },
}

M.debug = {
    name = "Debug",
    l = {
        name = "Log",
        l = { vin.cmds.edit.log_symbol, "Auto Log Symbol" },
        d = { vin.cmds.edit.delete_logs, "Delete Logs" },
    },
}

M.windows = {
    name = "Windows",
    m = { "<cmd>WindowsMaximize<CR>", "Maximize Split" },
    e = { "<cmd>WindowsEqualize<CR>", "Equalize" },
    a = { "<cmd>WindowsToggleAutowidth<CR>", "Toggle Autowidth" },
}

M.packages = {
    name = "Packages",
    m = { "<cmd>Mason<CR>", "Package Manager - [Mason]" },
    l = { "<cmd>Lazy<CR>", "Plugin Manager - [Lazy]" },
}

return M
