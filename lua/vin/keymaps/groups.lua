local M = {}

local cmds = Vin.cmds

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
    d = { "<cmd>Telescope lsp_definitions<CR>", "Find Definition" },
    r = { "<cmd>Telescope lsp_references<CR>", "Find References" },
    i = { "<cmd>Telescope lsp_implemantations<CR>", "Find Implementations" },
    y = { "<cmd>Telescope lsp_type_definitions<CR>", "Find Type Definition" },

    -- Trouble
    D = { "<cmd>Trouble lsp_definitions<CR>", "Find Definition (Trouble)" },
    R = { "<cmd>Trouble lsp_references<CR>", "Find References (Trouble)" },
    I = {
        "<cmd>Trouble lsp_implemantations<CR>",
        "Find Implementations (Trouble)",
    },
    Y = {
        "<cmd>Trouble lsp_type_definitions<CR>",
        "Find Type Definition (Trouble)",
    },
}

M.go_prev = {
    name = "Prev",
    q = {
        function()
            vim.cmd([[cprev]])
            Vin.cmds.general.center_line_vertical()
        end,
        "QuickFix Item",
    },
    l = {
        function()
            vim.cmd([[lprev]])
            Vin.cmds.general.center_line_vertical()
        end,
        "LocList Item",
    },
    b = {
        function()
            vim.cmd([[bprev]])
            Vin.cmds.general.center_line_vertical()
        end,
        "Buffer",
    },
    d = {
        function()
            vim.diagnostic.goto_prev({})
        end,
        "Diagnostic",
    },
    t = {
        function()
            -- jump to the previous item, skipping the groups
            require("trouble").previous({ skip_groups = true, jump = true })
        end,
        "Next Trouble",
    },
    g = { Vin.cmds.git.hunk_go_prev, "Change" },
}

M.go_next = {
    name = "Next",
    q = {
        function()
            vim.cmd([[cnext]])
            Vin.cmds.general.center_line_vertical()
        end,
        "QuickFix Item",
    },
    l = {
        function()
            vim.cmd([[lnext]])
            Vin.cmds.general.center_line_vertical()
        end,
        "LocList Item",
    },
    b = {
        function()
            vim.cmd([[bnext]])
            Vin.cmds.general.center_line_vertical()
        end,
        "Buffer",
    },
    d = {
        function()
            vim.diagnostic.goto_next()
        end,
        "Diagnostic",
    },
    t = {
        function()
            require("trouble").next({ skip_groups = true, jump = true })
        end,
        "Prev Trouble",
    },
    g = { Vin.cmds.git.hunk_go_next, "Change" },
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
            vim.diagnostic.goto_prev({})
        end,
        "Prev Diagnostic",
    },
    j = {
        function()
            vim.diagnostic.goto_next({})
        end,
        "Next Diagnostic",
    },

    f = { cmds.lsp.format_async, "Format" },
    a = { vim.lsp.buf.code_action, "Code Action" },
    n = { vim.lsp.buf.rename, "Rename" },
    i = { "<cmd>LspInfo<CR>", "Info" },
}

-- NOTE: Currently not used
M.explorer = {
    name = "Explorer",
    e = { "<cmd>Neotree left toggle<CR>", "Tree" },
    f = { "<cmd>Neotree float toggle<CR>", "Float" },
    b = { "<cmd>Neotree left buffers toggle<CR>", "Tree" },
    g = { "<cmd>Neotree left git_status<CR>", "Git Status" },
    ["."] = { "<cmd>Neotree focus<CR>", "Focus Tree" },
}

M.quit = {
    name = "Quit",
    s = { "<cmd>silent wq<CR>", "Save and Quit Pane (:wq)" },
    c = { Vin.cmds.quit.custom_buffers, "Custom Filter" },
    q = { Vin.cmds.quit.current_buffer, "Current" },
    o = { Vin.cmds.quit.other_buffers, "Other" },
    h = { Vin.cmds.quit.hidden_buffers, "Hidden" },
    a = { Vin.cmds.quit.all_buffers, "All" },
}

M.copy = {
    name = "Copy",
    f = { Vin.cmds.copy.fullPath, "Copy Full Path" },
    r = { Vin.cmds.copy.relativePath, "Copy Relative Path" },
    n = { Vin.cmds.copy.fileName, "Copy File Name" },
}

M.git = {
    name = "Git",
    k = { Vin.cmds.git.hunk_go_prev, "Change" },
    j = { Vin.cmds.git.hunk_go_next, "Change" },

    g = { "<cmd>LazyGit<CR>", "LazyGit" },
    s = { "<cmd>Neotree git_status float<CR>", "Git Status" },
    q = { Vin.cmds.git.open_changes_in_qf, "List changes in QF" },
    l = { Vin.cmds.git.toggle_current_line_blame, "Current Line Blame" },
    o = { Vin.cmds.fuzzy.find_changed_files, "Open Changed Files" },
    d = {
        name = "Diffview",
        c = { Vin.cmds.git.get_diff_to, "Diff To Custom" },
        d = { "<cmd>DiffviewOpen<CR>", "Current Diff" },
        h = { "<cmd>DiffviewFileHistory %<CR>", "History for Current File" },
        H = { "<cmd>DiffviewFileHistory<CR>", "Git History" },
        r = { "<cmd>DiffviewRefresh<CR>", "Refresh" },
        q = { "<cmd>DiffviewClose<CR>", "Close" },
    },
    h = {
        name = "Hunk",
        k = { Vin.cmds.git.hunk_go_prev, "Prev Hunk" },
        j = { Vin.cmds.git.hunk_go_next, "Next Hunk" },
        s = { Vin.cmds.git.hunk_stage, "Stage Hunk" },
        S = { Vin.cmds.git.hunk_undo_stage, "Undo Stage Hunk" },
        p = { Vin.cmds.git.hunk_preview, "Preview Hunk" },
        r = { Vin.cmds.git.hunk_reset, "Reset Hunk" },
        b = { Vin.cmds.git.blame_line, "Blame Line" },
    },
    b = {
        name = "Buffer",
        s = { Vin.cmds.git.buffer_stage, "Stage Buffer" },
        r = { Vin.cmds.git.buffer_reset, "Reset Buffer" },
    },
    c = {
        name = "Checkout",
        b = { "<cmd>Telescope git_branches<CR>", "Branches" },
        c = { Vin.cmds.fuzzy.find_commits, "Commits" },
    },
    p = {
        name = "Github",
        r = { "<cmd>Telescope gh pull_request<CR>", "Pull Requests" },
        f = { "<cmd>Telescope gh pull_request_files<CR>", "Pull Requests Files" },
    },
}

M.search = {
    name = "Search",
    d = M.diagnostics,
    s = M.symbols,

    p = { "<cmd>Telescope project<CR>", "Recent Projects" },
    f = { "<cmd>Telescope find_files<CR>", "Files" },
    t = { "<cmd>Telescope live_grep<CR>", "Find Text Everywhere" },
    b = { "<cmd>Telescope buffers<CR>", "Open Buffers" },
    T = { "<cmd>TodoTelescope<CR>", "Todos" },
    w = { "<cmd>Telescope grep_string<CR>", "Find Current Word" },
    S = { "<cmd>Telescope spell_suggest<CR>", "Spelling" },
    C = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
    h = { "<cmd>Telescope oldfiles<CR>", "Recent Files (History)" },
    c = { "<cmd>Telescope commands<CR>", "Commands" },
    m = { "<cmd>Telescope marks<CR>", "Marks" },
    g = { Vin.cmds.fuzzy.find_changed_files, "Open Changed Files" },
    r = { Vin.cmds.fuzzy.find_related_files, "Related Files" },
    a = {
        name = "Advanced",
        s = { Vin.cmds.fuzzy.find_scss_symbol, "SCSS Symbol" },
        h = { "<cmd>Telescope help_tags<CR>", "Help Tags" },
        H = { "<cmd>Telescope highlights<CR>", "Highlights" },
        m = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
        r = { "<cmd>Telescope registers<CR>", "Registers" },
        k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
    },
    ["/"] = {
        name = "Folders",
        c = {
            function()
                Vin.cmds.fuzzy.search_in_dir(Vin.config.pathes.config)
            end,
            "~/.config",
        },
        v = {
            function()
                Vin.cmds.fuzzy.search_in_dir(Vin.config.pathes.nvimConfig)
            end,
            "~/.config/nvim (Vin)",
        },
        n = {
            name = "Notes",
            w = {
                function()
                    Vin.cmds.fuzzy.search_in_dir(Vin.config.pathes.notes.work)
                end,
                "Work Notes",
            },
            n = {
                function()
                    Vin.cmds.fuzzy.search_in_dir(Vin.config.pathes.notes.private)
                end,
                "Private Notes",
            },
        },
    },
}

M.marks = {
    name = "Marks",
    a = { Vin.cmds.harpoon.add_file, "Add File to Harpoon" },
    m = { Vin.cmds.harpoon.toggle_quick_menu, "Harpoon Menu" },
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
        l = { Vin.cmds.edit.log_symbol, "Auto Log Symbol" },
        d = { Vin.cmds.edit.delete_logs, "Delete Logs" },
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
