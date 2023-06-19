local cmds = require("vin.cmds")

local M = {}

-- For the native LSP api methods search for :h vim.lsp.buf
M.g = {
    name = "Go",
    r = { "<cmd>Lspsaga lsp_finder<CR>", "Lsp Finder & References" },
    R = { "<cmd>Trouble lsp_references<CR>", "Find References (Trouble)" },
    d = { "<cmd>Lspsaga goto_definition<CR>", "Find Definition" },
    D = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
    l = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Show Line Diagnostics" },
    t = { "<cmd>Lspsaga goto_type_definition<CR>", "Find Type Definition" },
    T = { "<cmd>Lspsaga peek_type_definition<CR>", "Peek Type Definition" },
}

M.go_prev = {
    name = "Prev",
    q = {
        function()
            vim.cmd.cprev()
            cmds.general.center_line_vertical()
        end,
        "QuickFix Item",
    },
    l = {
        function()
            vim.cmd.lprev()
            cmds.general.center_line_vertical()
        end,
        "LocList Item",
    },
    b = {
        function()
            vim.cmd.bprev()
            cmds.general.center_line_vertical()
        end,
        "Buffer",
    },
    d = {
        function()
            vim.cmd.Lspsaga("diagnostic_jump_prev")
            cmds.general.center_line_vertical()
        end,
        "Diagnostic",
    },
    e = {
        function()
            require("lspsaga.diagnostic"):goto_prev({
                severity = vim.diagnostic.severity.ERROR,
            })
        end,
        "Error",
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
            vim.cmd.cnext()
            cmds.general.center_line_vertical()
        end,
        "QuickFix Item",
    },
    l = {
        function()
            vim.cmd.lnext()
            cmds.general.center_line_vertical()
        end,
        "LocList Item",
    },
    b = {
        function()
            vim.cmd.bnext()
            cmds.general.center_line_vertical()
        end,
        "Buffer",
    },
    d = {
        function()
            vim.cmd.Lspsaga("diagnostic_jump_next")
            cmds.general.center_line_vertical()
        end,
        "Diagnostic",
    },
    e = {
        function()
            require("lspsaga.diagnostic"):goto_next({
                severity = vim.diagnostic.severity.ERROR,
            })
        end,
        "Error",
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
                vim.notify("Virtual Text Disabled", vim.log.levels.INFO)
            else
                vim.diagnostic.config({ virtual_text = true })
                Vin.config.diagnostics.virtual_text_enabled = true
                vim.notify("Virtual Text Enabled", vim.log.levels.INFO)
            end
        end,
        "Toggle Virtual Text",
    },
    d = { "<cmd>Trouble document_diagnostics<CR>", "Document Diagnostics (Trouble)" },
    w = {
        "<cmd>Trouble workspace_diagnostics<CR>",
        "Workspace Diagnostics (Trouble)",
    },
    k = {
        M.go_prev.d[1],
        "Prev Diagnostic",
    },
    j = {
        M.go_next.d[1],
        "Next Diagnostic",
    },
}

M.quit = {
    name = "Quit",
    q = { vim.cmd.quit, "Quit (:q)" },
    c = { cmds.quit.custom_buffers, "Custom Filter" },
    o = { cmds.quit.other_buffers, "Other" },
    h = { cmds.quit.hidden_buffers, "Hidden" },
    a = { vim.cmd.xa, "All (:xa)" },
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
    s = { cmds.explorer.toggle_float_git, "Git Status" },
    q = { cmds.git.open_changes_in_qf, "List changes in QF" },
    l = { cmds.git.toggle_current_line_blame, "Current Line Blame" },
    o = { cmds.telescope.find_changed_files, "Open Changed Files" },
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
        b = { cmds.telescope.builtin("cmds.git.branches"), "Branches" },
        c = { cmds.telescope.find_commits, "Commits" },
    },
    p = {
        name = "Pull Request",
        r = { "<cmd>cmds.telescope.gh pull_request<CR>", "Pull Requests" },
        f = {
            "<cmd>cmds.telescope.gh pull_request_files<CR>",
            "Pull Requests Files",
        },
    },
}

M.find = {
    name = "Find",
    b = { cmds.telescope.builtin("buffers"), "Open Buffers" },
    c = { "<cmd>TodoTrouble<CR>", "Todo" },
    -- f = { cmds.telescope.builtin("find_files"), "Files" },
    f = { cmds.fzf.files.with_preview, "Files" }, -- Use fzf for bigger repos
    g = { cmds.telescope.find_changed_files, "Open Changed Files" },
    h = { cmds.telescope.builtin("oldfiles"), "File History" },
    m = { cmds.telescope.builtin("marks"), "Marks" },
    r = { cmds.telescope.find_related_files, "Related Files" },
    t = { cmds.telescope.builtin("current_buffer_fuzzy_find"), "Find in File" },
    T = { cmds.telescope.builtin("live_grep"), "Find Text Everywhere" },
    w = { cmds.telescope.builtin("grep_string"), "Word Under Cursor" },
    S = { cmds.telescope.builtin("spell_suggest"), "Spelling" },
    s = {
        name = "Symbols",
        d = { cmds.telescope.builtin("lsp_document_symbols"), "Document" },
        w = { cmds.telescope.builtin("lsp_workspace_symbols"), "Workspace" },
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
        h = { cmds.telescope.builtin("help_tags"), "Help Tags" },
        H = { cmds.telescope.builtin("highlights"), "Highlights" },
        m = { cmds.telescope.builtin("man_pages"), "Man Pages" },
        r = { cmds.telescope.builtin("registers"), "Registers" },
        k = { cmds.telescope.builtin("keymaps"), "Keymaps" },
    },
    ["/"] = {
        name = "Folders",
        C = {
            function()
                cmds.telescope.search_in_dir(Vin.config.pathes.config)
            end,
            "~/.config",
        },
        c = {
            function()
                cmds.telescope.search_in_dir(Vin.config.pathes.nvimConfig)
            end,
            "~/.config/nvim (Vin)",
        },
        n = {
            name = "Notes",
            w = {
                function()
                    cmds.telescope.search_in_dir(Vin.config.pathes.notes.work)
                end,
                "Work Notes",
            },
            n = {
                function()
                    cmds.telescope.search_in_dir(Vin.config.pathes.notes.private)
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
    ["<"] = { "<cmd>tabmove -1<CR>", "Move Left" },
    [">"] = { "<cmd>tabmove +1<CR>", "Move Right" },
    H = { "<cmd>tabfirst<CR>", "Put First" },
    L = { "<cmd>tablast<CR>", "Put Last" },
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
    t = {
        function()
            require("terra.actions.config").select_theme()
        end,
        "Select Theme",
    },
    v = {
        function()
            require("terra.actions.config").select_variant()
        end,
        "Select Variant",
    },
    c = {
        function()
            vim.print(vim.g.terra_config)
        end,
        "Print Terra Config",
    },
}

M.windows = {
    name = "Windows",
    m = { "<cmd>WindowsMaximize<CR>", "Maximize Split" },
    e = { "<cmd>WindowsEqualize<CR>", "Equalize" },
    a = { "<cmd>WindowsToggleAutowidth<CR>", "Toggle Autowidth" },
    l = { vim.cmd.vs, "Vertical Split" },
    j = { vim.cmd.sp, "Horizontal Split" },
}

M.vin = {
    name = "Vin",
    m = { "<cmd>Mason<CR>", "Package Manager - [Mason]" },
    n = { "<cmd>NullLsInfo<CR>", "Tool Manager - [NullLS]" },
    l = { "<cmd>Lazy<CR>", "Plugin Manager - [Lazy]" },
    i = { "<cmd>LspInfo<CR>", "Lsp Info" },
    c = {
        function()
            cmds.telescope.search_in_dir(Vin.config.pathes.nvimConfig)
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
    i = {
        name = "AI Actions",
        i = { "<cmd>ChatGPT<CR>", "ChatGPT" },
        e = { "<cmd>ChatGPTEditWithInstructions<CR>", "ChatGPT Edit" },
    },
    d = {
        function()
            require("notify").dismiss({ silent = true, pending = true })
        end,
        "Dismiss Notifications",
    },
    R = { "<cmd>LspRestart<CR>", "Restart LSP" },
    c = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
    n = { "<cmd>Lspsaga rename<CR>", "Rename" },
    f = { "<cmd>NullFormat<CR>", "Format (Null)" },
    m = {
        name = "Markdown",
        o = { "<cmd>PeekOpen<CR>", "Open Markdown Preview" },
        q = { "<cmd>PeekClose<CR>", "Quit Markdown Preview" },
    },
    I = { "<cmd>Inspect<CR>", "Inspect" },
    l = {
        name = "Log",
        l = { cmds.edit.log_symbol, "Auto Log Symbol" },
        d = { cmds.edit.delete_logs, "Delete Logs" },
    },
}

M.obsidian = {
    name = "Obsidian",
    d = {
        function()
            if require("obsidian").util.cursor_on_markdown_link() then
                vim.cmd("ObsidianFollowLink")
            end
        end,
        "Follow Link",
    },
    b = { "<cmd>ObsidianBacklinks<CR>", "Backlinks" },
    o = { "<cmd>ObsidianOpen<CR>", "Open" },
    f = { "<cmd>ObsidianQuickSwitch<CR>", "File" },
    l = {
        function()
            vim.ui.input({
                prompt = "  Enter a Name for the New File",
            }, function(input)
                if input then
                    -- create the new file
                    vim.cmd("ObsidianLinkNew " .. input)
                else
                    return
                end
            end)
        end,
        "New Link",
    },
    n = {
        function()
            vim.ui.input({
                prompt = "  Enter a Name for the New File",
            }, function(input)
                if input then
                    -- create the new file
                    vim.cmd("ObsidianNew " .. input)
                else
                    return
                end
            end)
        end,
        "New",
    },
    i = { "<cmd>ObsidianTemplate<CR>", "Insert Template" },
}

M.insert = {
    name = "Insert",
    i = {
        name = "Icon",
        i = { "<cmd>IconPickerNormal<CR>", "Icon" },
        n = { "<cmd>IconPickerNormal nerd_font<CR>", "Icon NerdFont" },
        e = { "<cmd>IconPickerNormal emoji<CR>", "Icon Emoji" },
    },
}

M.ui = {
    name = "UI",
    r = { "<cmd>e!<CR>", "Reload File (:e!)" },
    c = { cmds.telescope.builtin("colorscheme"), "Colorscheme" },
    s = {
        function()
            require("edgy").select()
        end,
        "Select Window (Edgy)",
    },
}

M.explorer = {
    name = "Explorer",
    e = { cmds.explorer.toggle_left_files, "Files" },
    E = { "<cmd>Neotree float toggle<CR>", "Files (Float)" },

    b = { cmds.explorer.toggle_buffers, "Buffers" },
    B = { "<cmd>Neotree float buffers toggle<CR>", "Buffers (Float)" },

    g = { cmds.explorer.toggle_git_status, "Git Status" },
    G = { "<cmd>Neotree float git_status toggle<CR>", "Git Status (Float)" },

    s = { cmds.explorer.toggle_symbol_outline, "Symbol Outline" },

    u = { cmds.explorer.toggle_undo_tree, "Undotree" },
}

return M
