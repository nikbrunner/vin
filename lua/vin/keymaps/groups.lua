local M = {}

local cmds = require("vin.cmds")

local telescope = cmds.telescope
local harpoon = cmds.harpoon
local git = cmds.git
local general = cmds.general
local quit = cmds.quit
local copy = cmds.copy

M.advanced_g = {
    name = "Go-To",

    n = { "<cmd>Navbuddy<CR>", "Navigate" },

    d = { vim.lsp.buf.definition, "Find Definition" },

    -- Telescope
    -- d = { "<cmd>Telescope lsp_definitions<CR>", "Find Definition" },
    -- r = { "<cmd>Telescope lsp_references<CR>", "Find References" },
    -- i = { "<cmd>Telescope lsp_implementations<CR>", "Find Implementations" },
    -- y = { "<cmd>Telescope lsp_type_definitions<CR>", "Find Type Definition" },

    -- Glance
    -- d = { "<cmd>Glance definitions<CR>", "Find Definition" },
    r = { "<cmd>Glance references<CR>", "Find References" },
    i = { "<cmd>Glance implementations<CR>", "Find Implementations" },
    y = { "<cmd>Glance type_definitions<CR>", "Find Type Definition" },

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
            general.center_line_vertical()
        end,
        "QuickFix Item",
    },
    l = {
        function()
            vim.cmd([[lprev]])
            general.center_line_vertical()
        end,
        "LocList Item",
    },
    b = {
        function()
            vim.cmd([[bprev]])
            general.center_line_vertical()
        end,
        "Buffer",
    },
    d = {
        function()
            vim.diagnostic.goto_prev({})
            general.center_line_vertical()
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
    g = { git.hunk_go_prev, "Change" },
}

M.go_next = {
    name = "Next",
    q = {
        function()
            vim.cmd([[cnext]])
            general.center_line_vertical()
        end,
        "QuickFix Item",
    },
    l = {
        function()
            vim.cmd([[lnext]])
            general.center_line_vertical()
        end,
        "LocList Item",
    },
    b = {
        function()
            vim.cmd([[bnext]])
            general.center_line_vertical()
        end,
        "Buffer",
    },
    d = {
        function()
            vim.diagnostic.goto_next()
            general.center_line_vertical()
        end,
        "Diagnostic",
    },
    t = {
        function()
            require("trouble").next({ skip_groups = true, jump = true })
        end,
        "Next Trouble",
    },
    g = { git.hunk_go_next, "Change" },
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
    d = { "<cmd>Trouble document_diagnostics<CR>", "Document Diagnostics (Trouble)" },
    w = {
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
    c = { quit.custom_buffers, "Custom Filter" },
    o = { quit.other_buffers, "Other" },
    h = { quit.hidden_buffers, "Hidden" },
    a = { quit.all_buffers, "All" },
}

M.copy = {
    name = "Copy",
    f = { copy.fullPath, "Copy Full Path" },
    r = { copy.relativePath, "Copy Relative Path" },
    n = { copy.fileName, "Copy File Name" },
}

M.git = {
    name = "Git",
    k = { git.hunk_go_prev, "Change" },
    j = { git.hunk_go_next, "Change" },

    g = { cmds.term.toggle_gitui, "LazyGit" },
    s = { "<cmd>Neotree git_status float<CR>", "Git Status" },
    q = { git.open_changes_in_qf, "List changes in QF" },
    l = { git.toggle_current_line_blame, "Current Line Blame" },
    o = { telescope.find_changed_files, "Open Changed Files" },
    h = {
        name = "Hunk",
        k = { git.hunk_go_prev, "Prev Hunk" },
        j = { git.hunk_go_next, "Next Hunk" },
        s = { git.hunk_stage, "Stage Hunk" },
        S = { git.hunk_undo_stage, "Undo Stage Hunk" },
        p = { git.hunk_preview, "Preview Hunk" },
        r = { git.hunk_reset, "Reset Hunk" },
        b = { git.blame_line, "Blame Line" },
    },
    b = {
        name = "Buffer",
        s = { git.buffer_stage, "Stage Buffer" },
        r = { git.buffer_reset, "Reset Buffer" },
    },
    c = {
        name = "Checkout",
        b = { telescope.builtin("git_branches"), "Branches" },
        c = { telescope.find_commits, "Commits" },
    },
    p = {
        name = "Pull Request",
        r = { "<cmd>Telescope gh pull_request<CR>", "Pull Requests" },
        f = { "<cmd>Telescope gh pull_request_files<CR>", "Pull Requests Files" },
    },
}

M.search = {
    name = "Search",
    b = { telescope.builtin("buffers"), "Open Buffers" },
    c = { telescope.builtin("colorscheme"), "Colorscheme" },
    f = { telescope.builtin("find_files"), "Files" },
    g = { telescope.find_changed_files, "Open Changed Files" },
    h = { telescope.builtin("oldfiles"), "File History" },
    m = { telescope.builtin("marks"), "Marks" },
    r = { telescope.find_related_files, "Related Files" },
    t = { telescope.builtin("live_grep"), "Find Text Everywhere" },
    w = { telescope.builtin("grep_string"), "Word Under Cursor" },
    S = { telescope.builtin("spell_suggest"), "Spelling" },
    T = { "<cmd>TodoTelescope<CR>", "Todos" },
    s = {
        name = "Symbols",
        d = { telescope.builtin("lsp_document_symbols"), "Document" },
        w = { telescope.builtin("lsp_workspace_symbols"), "Workspace" },
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
        s = { telescope.find_scss_symbol, "SCSS Symbol" },
        h = { telescope.builtin("help_tags"), "Help Tags" },
        H = { telescope.builtin("highlights"), "Highlights" },
        m = { telescope.builtin("man_pages"), "Man Pages" },
        r = { telescope.builtin("registers"), "Registers" },
        k = { telescope.builtin("keymaps"), "Keymaps" },
    },
    ["/"] = {
        name = "Folders",
        C = {
            function()
                telescope.search_in_dir(Vin.config.pathes.config)
            end,
            "~/.config",
        },
        c = {
            function()
                telescope.search_in_dir(Vin.config.pathes.nvimConfig)
            end,
            "~/.config/nvim (Vin)",
        },
        n = {
            name = "Notes",
            w = {
                function()
                    telescope.search_in_dir(Vin.config.pathes.notes.work)
                end,
                "Work Notes",
            },
            n = {
                function()
                    telescope.search_in_dir(Vin.config.pathes.notes.private)
                end,
                "Private Notes",
            },
        },
    },
}

M.marks = {
    name = "Marks",
    a = { harpoon.add_file, "Add File to Harpoon" },
    m = { harpoon.toggle_quick_menu, "Harpoon Menu" },
    ["1"] = {
        function()
            harpoon.jump_to_file(1)
        end,
        " ",
    },
    ["2"] = {
        function()
            harpoon.jump_to_file(2)
        end,
        " ",
    },
    ["3"] = {
        function()
            harpoon.jump_to_file(3)
        end,
        " ",
    },
    ["4"] = {
        function()
            harpoon.jump_to_file(4)
        end,
        " ",
    },
    ["5"] = {
        function()
            harpoon.jump_to_file(5)
        end,
        " ",
    },
    ["6"] = {
        function()
            harpoon.jump_to_file(6)
        end,
        " ",
    },
    ["7"] = {
        function()
            harpoon.jump_to_file(7)
        end,
        " ",
    },
    ["8"] = {
        function()
            harpoon.jump_to_file(8)
        end,
        " ",
    },
    ["9"] = {
        function()
            harpoon.jump_to_file(9)
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
            telescope.search_in_dir(Vin.config.pathes.nvimConfig)
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
    c = { vim.lsp.buf.code_action, "Code Action" },
    n = { vim.lsp.buf.rename, "Rename" },
    f = { "<cmd>NullFormat<CR>", "Format (Null)" },
    m = {
        name = "Markdown",
        o = { "<cmd>PeekOpen<CR>", "Open Markdown Preview" },
        c = { "<cmd>PeekClose<CR>", "Close Markdown Preview" },
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
    -- [ObsidianTemplate command results in error with telescope · Issue #106 · epwalsh/obsidian.nvim](https://github.com/epwalsh/obsidian.nvim/issues/106)
    -- i = { "<cmd>ObsidianTemplate<CR>", "Insert Template" },
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

return M
