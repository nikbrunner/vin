local M = {}

M.folder_presets = {
    nvim = "~/.config/nvim",
    config = "~/.config",
    scripts = "~/.scripts",
    personal_notes = require("vin.config").pathes.notes.personal,
    dcd_notes = require("vin.config").pathes.notes.work.dcd,
}

M.search_preset_folder = function()
    local choices = {}

    for key, _ in pairs(M.folder_presets) do
        table.insert(choices, key)
    end

    vim.ui.select(choices, {
        prompt = "Pick a folder: ",
        format_item = function(choice)
            return " " .. choice
        end,
    }, function(choice)
        M.fzf("files", {
            winopts = M.win_presets.medium.vertical,
            cwd = M.folder_presets[choice],
        })()
    end)
end

M.win_presets = {
    small = {
        no_preview = {
            height = 0.35,
            width = 0.65,
            preview = {
                hidden = "hidden",
            },
        },
    },
    medium = {
        flex = {
            height = 0.65,
            width = 0.65,
            preview = {
                layout = "flex",
                vertical = "up:50%",
            },
        },
    },
    large = {
        vertical = {
            height = 0.9,
            width = 0.9,
            preview = {
                layout = "vertical",
                vertical = "up:65%",
            },
        },
    },
    full = {
        vertical = {
            fullscreen = true,
            preview = {
                layout = "vertical",
                vertical = "down:65%",
            },
        },
        horizontal = {
            fullscreen = true,
            preview = {
                layout = "horizontal",
                vertical = "right:60%",
            },
        },
    },
}

M.fzf = function(cmd, opts)
    opts = opts or {}
    return function()
        require("fzf-lua")[cmd](opts)
    end
end

---@type LazyPluginSpec
M.spec = {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    enabled = true,
    keys = {
        -- stylua: ignore start
        { "<leader><space>",     M.fzf("files"), desc = "Files", },
        { "<leader>r",           M.fzf("oldfiles", { cwd_only = true }), desc = "Recent Files (Only CWD)", },
        { "<leader>R",           M.fzf("oldfiles", { cwd_only = false }), desc = "Recent Files (All CWD)"},
        { "<leader>:",           M.fzf("commands"), desc = "Commands", },
        { "<leader>/",           M.fzf("lgrep_curbuf"), desc = "Grep Current Buffer", },

        { "<leader>s/",          M.search_preset_folder, desc = "Search Folder", },
        { "<leader>s.",          M.fzf("resume"),  desc = "Resume Search" },
        { "<leader>sh",          M.fzf("help_tags", { winopts = M.win_presets.full.horizontal }),  desc = "Help Tags" },
        { "<leader>sH",          M.fzf("highlights"), desc = "Highlights" },
        { "<leader>sc",          M.fzf("commands"), desc = "Commands", },
        { "<leader>sC",          M.fzf("command_history"), desc = "Command History", },
        { "<leader>sd",          M.fzf("lsp_document_diagnostics"), desc = "Document Diagnostics", },
        { "<leader>sD",          M.fzf("lsp_workspace_diagnostics"), desc = "Document Diagnostics", },
        { "<leader>sk",          M.fzf("keymaps"), desc = "Keymaps", },
        { "<leader>sw",          M.fzf("grep_cword"), desc = "Current Word", mode = { "n", "v" } },
        { "<leader>sm",          M.fzf("marks"), desc = "Marks", },
        { "<leader>sM",          M.fzf("man_pages"), desc = "Man Pages", },
        { "<leader>sg",          M.fzf("live_grep_native", { winopts = M.win_presets.large.vertical }), desc = "Live Grep", },
        { "<leader>sG",          M.fzf("live_grep_resume", { winopts = M.win_presets.large.vertical }), desc = "Live Grep Resume", },
        { "<leader>s<Tab>",      M.fzf("tabs"), desc = "Tabs", },

        { "<leader>sr",          M.fzf("registers", { winopts = M.win_presets.small.no_preview }), desc = "Registers", mode = { "n", "v" } },
        { "<C-r>",               M.fzf("registers", { winopts = M.win_presets.small.no_preview }), desc = "Registers", mode = { "i" } },

        -- { "<leader>gs",          M.fzf("git_status", { winopts = M.win_presets.full.vertical }), desc = "Git Status", },
        { "<leader>gc",          M.fzf("changes", { winopts = M.win_presets.full.vertical }), desc = "Git Status", },
        { "<leader>gB",          M.fzf("git_branches"), desc = "Git Branches", },
        { "<leader>gC",          M.fzf("git_commits", { winopts = M.win_presets.full.vertical, }), desc = "Git Commits", },

        { "gs",                  M.fzf("lsp_document_symbols"), desc = "Document Symbols", },
        { "gS",                  M.fzf("lsp_live_workspace_symbols"), desc = "Workspace Symbols", },

        { "<leader>vc",          M.fzf("colorschemes"), desc = "Colorschemes", },
        -- stylua: ignore end
    },

    opts = function()
        local actions = require("fzf-lua.actions")
        return {
            global_resume = true, -- enable global `resume`?
            global_resume_query = true, -- include typed query in `resume`?

            winopts = {
                height = 0.65, -- window height
                width = 0.65, -- window width
                row = 0.35, -- window row position (0=top, 1=bottom)
                col = 0.50, -- window col position (0=left, 1=right)
                border = "rounded",
                preview = {
                    border = "rounded", -- border|noborder, applies only to
                    wrap = "nowrap", -- wrap|nowrap
                    hidden = "nohidden", -- hidden|nohidden
                    vertical = "up:65%", -- up|down:size
                    horizontal = "right:60%", -- right|left:size
                    layout = "flex", -- horizontal|vertical|flex
                    flip_columns = 250, -- #cols to switch to horizontal on flex
                    title = true, -- preview border title (file/buf)?
                    delay = 100, -- delay(ms) displaying the preview
                    winopts = { -- builtin previewer window options
                        number = false,
                        relativenumber = false,
                        cursorline = true,
                        cursorlineopt = "both",
                        cursorcolumn = false,
                        signcolumn = "no",
                        list = false,
                        foldenable = false,
                        foldmethod = "manual",
                    },
                },

                on_create = function()
                    vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
                    vim.keymap.set("t", "<C-k>", "<Up>", { silent = true, buffer = true })
                end,
            },

            keymap = {
                builtin = {
                    ["<C-d>"] = "preview-page-down",
                    ["<C-u>"] = "preview-page-up",
                },
                fzf = {
                    ["ctrl-c"] = "abort",
                    ["ctrl-a"] = "toggle-all",
                    ["ctrl-q"] = "select-all+accept",

                    ["f3"] = "toggle-preview-wrap",
                    ["f4"] = "toggle-preview",

                    ["ctrl-d"] = "preview-page-down",
                    ["ctrl-u"] = "preview-page-up",
                },
            },

            fzf_opts = {
                ["--ansi"] = "",
                ["--prompt"] = "  ",
                ["--info"] = false,
                ["--height"] = "100%",
                ["--layout"] = "reverse",
                ["--keep-right"] = "",
                ["--reverse"] = "",
                -- ["--border"] = "bold",
                ["--border-label"] = "[ Vin ]",
                ["--padding"] = "1,2",
                ["--no-scrollbar"] = "",
                ["--no-separator"] = "",
                ["--no-info"] = "",
            },

            fzf_colors = {
                ["fg"] = { "fg", "Normal" },
                ["fg+"] = { "fg", "CursorLineNr" },
                ["bg"] = { "bg", "NeoTreeNormal" },
                ["hl"] = { "fg", "Comment" },
                ["bg+"] = { "bg", "Normal" },
                ["border"] = { "fg", "CursorLineNr" },
                ["hl+"] = { "fg", "Statement" },
                ["query"] = { "fg", "Statement" },
                ["info"] = { "fg", "PreProc" },
                ["label"] = { "fg", "CursorLineNr" },
                ["prompt"] = { "fg", "Conditional" },
                ["pointer"] = { "fg", "Exception" },
                ["marker"] = { "fg", "Keyword" },
                ["spinner"] = { "fg", "Label" },
                ["header"] = { "fg", "Comment" },
                ["gutter"] = { "bg", "NeoTreeNormal" },
            },

            previewers = {
                builtin = {
                    syntax = true,
                    treesitter = { enable = true },
                },
                cat = {
                    cmd = "cat",
                    args = "--number",
                },
                bat = {
                    cmd = "bat",
                    args = "--style=numbers,changes --color always",
                    theme = "base16",
                },
                head = {
                    cmd = "head",
                    args = nil,
                },
                git_diff = {
                    cmd_deleted = "git diff --color HEAD --",
                    cmd_modified = "git diff --color HEAD",
                    cmd_untracked = "git diff --color --no-index /dev/null",
                    pager = "delta --width $FZF_PREVIEW_COLUMNS",
                },
                man = {
                    cmd = "man -c %s | col -bx",
                },
            },

            files = {
                prompt = "  ",
                multiprocess = true, -- run command in a separate process
                git_icons = true, -- show git icons?
                file_icons = true, -- show file icons?
                color_icons = true, -- colorize file|git icons
                find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
                rg_opts = "--color=never --files --hidden --follow -g '!.git'",
                fd_opts = "--color=never --type f --hidden --follow --exclude .git",
                -- by default, cwd appears in the header only if {opts} contain a cwd
                -- parameter to a different folder than the current working directory
                -- uncomment if you wish to force display of the cwd as part of the
                -- query prompt string (fzf.vim style), header line or both
                cwd_prompt = false,
                cwd_prompt_shorten_len = 32, -- shorten prompt beyond this length
                cwd_prompt_shorten_val = 1, -- shortened path parts length
                actions = {
                    ["default"] = actions.file_edit_or_qf,
                    ["ctrl-s"] = actions.file_split,
                    ["ctrl-v"] = actions.file_vsplit,
                    ["ctrl-t"] = actions.file_tabedit,
                    ["ctrl-q"] = actions.file_sel_to_qf,
                    ["ctrl-y"] = function(selected)
                        print(selected[1])
                    end,
                },
            },

            git = {
                files = {
                    prompt = "Git Files❯ ",
                    cmd = "git ls-files --exclude-standard",
                    multiprocess = false, -- run command in a separate process
                    git_icons = true, -- show git icons?
                    file_icons = true, -- show file icons?
                    color_icons = true, -- colorize file|git icons
                },

                status = {
                    prompt = "Modified Files❯ ",
                    cmd = "git status -su",
                    previewer = "git_diff",
                    file_icons = true,
                    git_icons = true,
                    color_icons = true,
                    actions = {
                        ["default"] = actions.file_edit_or_qf,
                        ["ctrl-s"] = actions.file_split,
                        ["ctrl-v"] = actions.file_vsplit,
                        ["ctrl-t"] = actions.file_tabedit,
                        ["ctrl-q"] = actions.file_sel_to_qf,
                        ["right"] = { actions.git_unstage, actions.resume },
                        ["left"] = { actions.git_stage, actions.resume },
                    },
                },

                commits = {
                    prompt = "Commits❯ ",
                    cmd = "git log --pretty=oneline --abbrev-commit --color",
                    preview = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1} | delta --width $FZF_PREVIEW_COLUMNS",
                    actions = {
                        ["default"] = actions.git_checkout,
                    },
                },

                bcommits = {
                    prompt = "BCommits❯ ",
                    cmd = "git log --pretty=oneline --abbrev-commit --color",
                    preview = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1} | delta --width $FZF_PREVIEW_COLUMNS",
                    actions = {
                        ["default"] = actions.git_buf_edit,
                        ["ctrl-s"] = actions.git_buf_split,
                        ["ctrl-v"] = actions.git_buf_vsplit,
                        ["ctrl-t"] = actions.git_buf_tabedit,
                    },
                },

                branches = {
                    prompt = "Branches❯ ",
                    cmd = "git branch --all --color",
                    preview = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
                    actions = {
                        ["default"] = actions.git_switch,
                    },
                },

                icons = {
                    ["M"] = { icon = "M", color = "yellow" },
                    ["D"] = { icon = "D", color = "red" },
                    ["A"] = { icon = "A", color = "green" },
                    ["R"] = { icon = "R", color = "yellow" },
                    ["C"] = { icon = "C", color = "yellow" },
                    ["?"] = { icon = "?", color = "magenta" },
                },
            },

            grep = {
                prompt = "Grep Text❯ ",
                input_prompt = "Grep For❯ ",
                multiprocess = true, -- run command in a separate process
                git_icons = true, -- show git icons?
                file_icons = true, -- show file icons?
                color_icons = true, -- colorize file|git icons
                rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512",
                grep_opts = "--binary-files=without-match --line-number --recursive --color=auto",
                -- 'live_grep_glob' options:
                glob_flag = "--iglob", -- for case sensitive globs use '--glob'
                glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
            },

            oldfiles = {
                prompt = "History❯ ",
                cwd_only = true,
                stat_file = true, -- verify files exist on disk
                include_current_session = true, -- include bufs from current session
            },

            buffers = {
                prompt = "Buffers❯ ",
                file_icons = true, -- show file icons?
                color_icons = true, -- colorize file|git icons
                sort_lastused = true, -- sort buffers() by last used
                cwd_only = true, -- buffers for the cwd only
                cwd = nil, -- buffers list for a given dir
                actions = {
                    ["ctrl-x"] = { actions.buf_del, actions.resume },
                },
            },

            quickfix = {
                file_icons = true,
                git_icons = true,
            },

            lsp = {
                prompt_postfix = "❯ ", -- will be appended to the LSP label
                cwd_only = true, -- LSP/diagnostics for cwd only?
                async_or_timeout = 5000, -- timeout(ms) or 'true' for async calls
                file_icons = true,
                git_icons = true,
                symbols = {
                    async_or_timeout = true, -- symbols are async by default
                    symbol_style = 1, -- style for document/workspace symbols
                    symbol_hl_prefix = "CmpItemKind",
                    symbol_fmt = function(s)
                        return "[" .. s .. "]"
                    end,
                },

                code_actions = {
                    prompt = "Code Actions> ",
                    ui_select = true, -- use 'vim.ui.select'?
                    async_or_timeout = 5000,
                    -- TODO: Enable if TS and ESLint are ready
                    -- @see: [[Feature Request] lsp actions preview · Issue #944 · ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua/issues/944)
                    previewer = false,
                    -- previewer = "codeaction_native",
                    -- preview_pager = "delta --side-by-side --width=$FZF_PREVIEW_COLUMNS --hunk-header-style='omit' --file-style='omit'",
                    winopts = {
                        relative = "cursor",
                        row = 0.40,
                        height = 0.35,
                        width = 0.60,
                    },
                },
            },
        }
    end,

    config = function(_, opts)
        require("fzf-lua").setup(opts)
    end,
}

return M.spec
