local M = {}

local cmds = require("vin.cmds")

M.advanced_g = {
    name = "Go-To",

    d = { "<cmd>Telescope lsp_definitions<CR>", "Find Definition" },
    r = { "<cmd>Telescope lsp_references<CR>", "Find References" },
    i = { "<cmd>Telescope lsp_implementations<CR>", "Find Implementations" },
    y = { "<cmd>Telescope lsp_type_definitions<CR>", "Find Type Definition" },
    h = { vim.lsp.buf.hover, "Hover Doc" },
    l = { vim.diagnostic.open_float, "Show Problem" },

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
            cmds.general.center_line_vertical()
        end,
        "QuickFix Item",
    },
    l = {
        function()
            vim.cmd([[lprev]])
            cmds.general.center_line_vertical()
        end,
        "LocList Item",
    },
    b = {
        function()
            vim.cmd([[bprev]])
            cmds.general.center_line_vertical()
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
        "Prev Trouble",
    },
    g = { cmds.git.hunk_go_prev, "Change" },
}

M.go_next = {
    name = "Next",
    q = {
        function()
            vim.cmd([[cnext]])
            cmds.general.center_line_vertical()
        end,
        "QuickFix Item",
    },
    l = {
        function()
            vim.cmd([[lnext]])
            cmds.general.center_line_vertical()
        end,
        "LocList Item",
    },
    b = {
        function()
            vim.cmd([[bnext]])
            cmds.general.center_line_vertical()
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
        "Next Trouble",
    },
    g = { cmds.git.hunk_go_next, "Change" },
}

M.diagnostics = {
    name = "Diagnostics",
    i = { "<cmd>LspInfo<CR>", "Info" },
    t = {
        function()
            if Vin.config.diagnostics.virtual_text_enabled == true then
                vim.diagnostic.config({ virtual_text = false })
                Vin.config.diagnostics.virtual_text_enabled = false
                vim.notify("Virtual Text Disabled", "info")
            else
                vim.diagnostic.config({ virtual_text = true })
                Vin.config.diagnostics.virtual_text_enabled = true
                vim.notify("Virtual Text Enabled", "info")
            end
        end,
        "Toggle Virtual Text",
    },
    d = { cmds.fzf.lsp.diagnostics.document, "Document Diagnostics" },
    D = { "<cmd>Trouble document_diagnostics<CR>", "Document Diagnostics (Trouble)" },
    w = { cmds.fzf.lsp.diagnostics.workspace, "Workspace Diagnostics" },
    W = {
        "<cmd>Trouble workspace_diagnostics<CR>",
        "Workspace Diagnostics (Trouble)",
    },
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
}

M.explorer = {
    name = "Explorer",
    ["."] = { "<cmd>Neotree focus<CR>", "Focus Tree" },
    e = {
        function()
            vim.cmd("UndotreeHide")
            vim.cmd("Neotree left toggle")
        end,
        "Left File Tree",
    },
    g = { "<cmd>Neotree git_status<CR>", "Git File Tree" },
    b = { "<cmd>Neotree buffers toggle<CR>", "Left Buffer Tree" },
    f = { "<cmd>Neotree float toggle reveal<CR>", "Float File Tree" },
    B = { "<cmd>Neotree float buffers toggle<CR>", "Float Buffer Tree" },
    G = { "<cmd>Neotree float git_status<CR>", "Float Git Tree" },
}

M.quit = {
    name = "Quit",
    q = { "<cmd>silent q<CR>", "Quit Split (:q)" },
    c = { cmds.quit.custom_buffers, "Custom Filter" },
    o = { cmds.quit.other_buffers, "Other" },
    h = { cmds.quit.hidden_buffers, "Hidden" },
    a = { cmds.quit.all_buffers, "All" },
}

M.copy = {
    name = "Copy",
    f = { cmds.copy.fullPath, "Copy Full Path" },
    r = { cmds.copy.relativePath, "Copy Relative Path" },
    n = { cmds.copy.fileName, "Copy File Name" },
}

M.git = {
    name = "Git",
    k = { cmds.git.hunk_go_prev, "Change" },
    j = { cmds.git.hunk_go_next, "Change" },

    g = { cmds.term.toggle_gitui, "LazyGit" },
    s = { "<cmd>Neotree git_status float<CR>", "Git Status" },
    q = { cmds.git.open_changes_in_qf, "List changes in QF" },
    l = { cmds.git.toggle_current_line_blame, "Current Line Blame" },
    o = { cmds.fzf.git.status_with_preview, "Open Changed Files" },
    h = {
        name = "Hunk",
        k = { cmds.git.hunk_go_prev, "Prev Hunk" },
        j = { cmds.git.hunk_go_next, "Next Hunk" },
        s = { cmds.git.hunk_stage, "Stage Hunk" },
        S = { cmds.git.hunk_undo_stage, "Undo Stage Hunk" },
        p = { cmds.git.hunk_preview, "Preview Hunk" },
        r = { cmds.git.hunk_reset, "Reset Hunk" },
        b = { cmds.git.blame_line, "Blame Line" },
    },
    b = {
        name = "Buffer",
        s = { cmds.git.buffer_stage, "Stage Buffer" },
        r = { cmds.git.buffer_reset, "Reset Buffer" },
    },
    c = {
        name = "Checkout",
        b = { cmds.fzf.git.branches, "Branches" },
        c = { cmds.fzf.git.commits, "Commits" },
    },
    p = {
        name = "Pull Request",
        r = { "<cmd>Telescope gh pull_request<CR>", "Pull Requests" },
        f = { "<cmd>Telescope gh pull_request_files<CR>", "Pull Requests Files" },
    },
}

M.search = {
    name = "Search",
    b = { cmds.fzf.files.buffers, "Open Buffers" },
    c = { "<cmd>FzfLua colorschemes<CR>", "Colorscheme" },
    f = { cmds.fzf.files.with_preview, "Files" },
    g = { cmds.telescope.find_changed_files, "Open Changed Files" },
    h = { cmds.fzf.files.old_files, "File History" },
    m = { "<cmd>FzfLua marks<CR>", "Marks" },
    r = { cmds.telescope.find_related_files, "Related Files" },
    t = { cmds.fzf.text.in_project, "Find Text Everywhere" },
    w = { cmds.fzf.text.word, "Word Under Cursor" },
    S = { "<cmd>FzfLua spell_suggest<CR>", "Spelling" },
    T = { "<cmd>TodoTelescope<CR>", "Todos" },
    s = {
        name = "Symbols",
        d = { cmds.fzf.lsp.symbols.document, "Document" },
        w = { cmds.fzf.lsp.symbols.workspace, "Workspace" },
    },
    n = {
        name = "Noice",
        a = {
            function()
                require("noice").cmd("all")
            end,
            "Noice All",
        },
        l = {
            function()
                require("noice").cmd("last")
            end,
            "Noice Last Message",
        },
        h = {
            function()
                require("noice").cmd("history")
            end,
            "Noice History",
        },
    },
    a = {
        name = "Advanced",
        s = { cmds.telescope.find_scss_symbol, "SCSS Symbol" },
        h = { cmds.fzf.misc.help_tags, "Help Tags" },
        H = { cmds.fzf.misc.highlights, "Highlights" },
        m = { cmds.fzf.misc.man_page, "Man Pages" },
        r = { cmds.fzf.misc.registers, "Registers" },
        k = { cmds.fzf.misc.keymaps, "Keymaps" },
    },
    ["/"] = {
        name = "Folders",
        C = {
            function()
                cmds.fzf.files.in_dir(Vin.config.pathes.config)
            end,
            "~/.config",
        },
        c = {
            function()
                cmds.fzf.files.in_dir(Vin.config.pathes.nvimConfig)
            end,
            "~/.config/nvim (Vin)",
        },
        n = {
            name = "Notes",
            w = {
                function()
                    cmds.fzf.files.in_dir(Vin.config.pathes.notes.work)
                end,
                "Work Notes",
            },
            n = {
                function()
                    cmds.fzf.files.in_dir(Vin.config.pathes.notes.private)
                end,
                "Private Notes",
            },
        },
    },
}

M.marks = {
    name = "Marks",
    a = { cmds.harpoon.add_file, "Add File to Harpoon" },
    m = { cmds.harpoon.toggle_quick_menu, "Harpoon Menu" },
    ["1"] = {
        function()
            cmds.harpoon.jump_to_file(1)
        end,
        " ",
    },
    ["2"] = {
        function()
            cmds.harpoon.jump_to_file(2)
        end,
        " ",
    },
    ["3"] = {
        function()
            cmds.harpoon.jump_to_file(3)
        end,
        " ",
    },
    ["4"] = {
        function()
            cmds.harpoon.jump_to_file(4)
        end,
        " ",
    },
    ["5"] = {
        function()
            cmds.harpoon.jump_to_file(5)
        end,
        " ",
    },
    ["6"] = {
        function()
            cmds.harpoon.jump_to_file(6)
        end,
        " ",
    },
    ["7"] = {
        function()
            cmds.harpoon.jump_to_file(7)
        end,
        " ",
    },
    ["8"] = {
        function()
            cmds.harpoon.jump_to_file(8)
        end,
        " ",
    },
    ["9"] = {
        function()
            cmds.harpoon.jump_to_file(9)
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

M.windows = {
    name = "Windows",
    m = { "<cmd>WindowsMaximize<CR>", "Maximize Split" },
    e = { "<cmd>WindowsEqualize<CR>", "Equalize" },
    a = { "<cmd>WindowsToggleAutowidth<CR>", "Toggle Autowidth" },
}

M.vin = {
    name = "Vin",
    m = { "<cmd>Mason<CR>", "Package Manager - [Mason]" },
    n = { "<cmd>NullLsInfo<CR>", "Tool Manager - [NullLS]" },
    l = { "<cmd>Lazy<CR>", "Plugin Manager - [Lazy]" },
    i = { "<cmd>LspInfo<CR>", "Lsp Info" },
    c = {
        function()
            cmds.fzf.files.in_dir(Vin.config.pathes.nvimConfig)
        end,
        "Search Config Files",
    },
    t = M.terra,
}

M.session = {
    name = "Session",
    r = {
        function()
            require("persistence").load()
        end,
        "Restore Session",
    },
    l = {
        function()
            require("persistence").load({ last = true })
        end,
        "Restore Last Session",
    },
    d = {
        function()
            require("persistence").stop()
        end,
        "Don't Save Current Session",
    },
}

M.action = {
    name = "Actions",
    i = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    d = {
        function()
            require("notify").dismiss({ silent = true, pending = true })
        end,
        "Dismiss Notifications",
    },
    R = { "<cmd>LspRestart<CR>", "Restart LSP" },
    c = { vim.lsp.buf.code_action, "Code Action" },
    n = { vim.lsp.buf.rename, "Rename" },
    f = { "<cmd>NullFormat<CR>", "Format (Null)" },
    m = { "<cmd>Glow<CR>", "Preview Markdown (Glow)" },
    I = { "<cmd>Inspect<CR>", "Inspect" },
    l = {
        name = "Log",
        l = { cmds.edit.log_symbol, "Auto Log Symbol" },
        d = { cmds.edit.delete_logs, "Delete Logs" },
    },
}

return M
