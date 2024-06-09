local M = {}

M.win_preset = {
    sm = {
        no_preview = {
            row = 0.85,
            col = 0.5,
            height = 0.35,
            width = 0.5,
            preview = { hidden = "hidden" },
        },
    },
    md = {
        flex = {
            height = 0.65,
            width = 0.65,
            preview = {
                layout = "flex",
                vertical = "up:50%",
            },
        },
    },
    lg = {
        flex = {
            height = 0.9,
            width = 0.9,
            preview = {
                layout = "flex",
                vertical = "up:65%", -- up|down:size
                horizontal = "right:50%", -- right|left:size
            },
        },
        vertical_corner = {
            row = 0.85,
            col = 1,
            height = 0.9,
            width = 85,
            preview = {
                layout = "vertical",
                vertical = "up:65%", -- up|down:size
            },
        },
        vertical = {
            height = 0.95,
            width = 0.95,
            preview = {
                layout = "vertical",
                vertical = "up:65%", -- up|down:size
            },
        },
    },
    fullscreen = {
        flex = {
            fullscreen = true,
            preview = {
                layout = "flex",
                vertical = "up:65%", -- up|down:size
                horizontal = "left:50%", -- right|left:size
            },
        },
        vertical = {
            fullscreen = true,
            preview = {
                layout = "vertical",
                vertical = "up:65%",
            },
        },
    },
}

M.use_win_preset = function(winopts, opts)
    return vim.tbl_deep_extend("force", { winopts = winopts }, opts or {})
end

M.fzf = function(cmd, opts)
    opts = opts or {}
    return function()
        require("neo-tree.command").execute({
            action = "close",
            position = "float",
        })

        require("fzf-lua")[cmd](opts)
    end
end

---@type LazyKeysSpec[]
M.keys = {
    -- Root layer
    {
        "<leader><space>",
        M.fzf("files", M.use_win_preset(M.win_preset.fullscreen.flex)),
        desc = "Files",
    },
    {
        "<leader>/",
        M.fzf("lgrep_curbuf"),
        desc = "Grep Current File",
    },
    {
        "<leader>:",
        M.fzf("commands", M.use_win_preset(M.win_preset.sm.no_preview)),
        desc = "Commands",
    },
    {
        "<leader>r",
        M.fzf("oldfiles", M.use_win_preset(M.win_preset.sm.no_preview, { cwd_only = true })),
        desc = "Recent Files",
    },
    {
        "<leader>R",
        M.fzf("oldfiles", M.use_win_preset(M.win_preset.sm.no_preview, { cwd_only = false })),
        desc = "Recent Files (Everywhere)",
    },

    -- [C]ode Group
    {
        "<leader>cr",
        mode = { "n", "v" },
        M.fzf("lsp_code_actions", M.use_win_preset(M.win_preset.lg.vertical)),
        desc = "Code [R]efator",
    },
    {
        "<M-CR>",
        mode = { "n", "v" },
        M.fzf("lsp_code_actions", M.use_win_preset(M.win_preset.lg.vertical)),
        desc = "Code [R]efator",
    },

    -- [S]earch Group
    {
        "<leader>s.",
        M.fzf("resume"),
        desc = "[.] Resume",
    },
    {
        "<leader>s:",
        M.fzf("commands", M.use_win_preset(M.win_preset.sm.no_preview)),
        desc = "[C]ommands",
    },
    {
        "<leader>sh",
        M.fzf("help_tags"),
        desc = "[H]elp Tags",
    },
    {
        "<leader>sH",
        M.fzf("highlights"),
        desc = "[H]ighlights",
    },
    {
        "<leader>sk",
        M.fzf("keymaps"),
        desc = "[K]eymaps",
    },
    {
        "<leader>sw",
        M.fzf("grep_cword"),
        mode = { "n", "v" },
        desc = "[W]ord",
    },
    -- TODO: search visual selection
    {
        "<leader>sm",
        M.fzf("marks"),
        desc = "[M]arks",
    },
    {
        "<leader>sM",
        M.fzf("man_pages"),
        desc = "[M]an Pages",
    },
    {
        "<leader>sg",
        M.fzf("live_grep_native", M.use_win_preset(M.win_preset.lg.vertical)),
        desc = "[G]rep",
    },
    {
        "<leader>sG",
        M.fzf("live_grep_resume"),
        desc = "[G]rep Resume",
    },
    {
        "<leader>sr",
        M.fzf("registers", M.use_win_preset(M.win_preset.sm.no_preview)),
        mode = { "n", "v" },
        desc = "[R]egisters",
    },
    {
        "<leader>s<Tab>",
        M.fzf("tabs"),
        desc = "[Tab]s",
    },

    -- [G]it Group
    {
        "<leader>gs",
        M.fzf("git_status", M.use_win_preset(M.win_preset.fullscreen.vertical)),
        desc = "[S]tatus",
    },
    {
        "<leader>gc",
        M.fzf("changes"),
        desc = "[C]hanges",
    },
    {
        "<leader>gB",
        M.fzf("git_branches"),
        desc = "[B]ranches",
    },
    {
        "<leader>gC",
        M.fzf("git_commits"),
        desc = "[C]ommits",
    },

    -- [U]I Group
    {
        "<leader>ut",
        M.fzf("colorschemes"),
        desc = "Toggle [T]themes",
    },
    {
        "<leader>uT",
        M.fzf("awesome_colorschemes"),
        desc = "Toggle 'Awesome' [T]hemes",
    },

    -- [D]iagnostics Group - Currently handled by Trouble
    {
        "<leader>sd",
        M.fzf("lsp_document_diagnostics", M.use_win_preset(M.win_preset.lg.vertical)),
        desc = "Document Diagnostics",
    },
    {
        "<leader>sD",
        M.fzf("lsp_workspace_diagnostics", M.use_win_preset(M.win_preset.lg.vertical)),
        desc = "Workspace Diagnostics",
    },

    -- No leader key
    {
        "gs",
        M.fzf("lsp_document_symbols"),
        desc = "Document [S]ymbols",
    },
    {
        "gS",
        M.fzf("lsp_live_workspace_symbols"),
        desc = "Workspace [S]ymbols",
    },

    -- Insert Mode
    -- { "<C-r>",               M.fzf("registers", M.use_win_preset( M.win_preset.sm.no_preview)), mode = { "i" }, desc = "Registers" }
}

-- NOTE: handover `search=<searchTerm>` to prefill the fzf picker

---@type LazyPluginSpec
M.spec = {
    "ibhagwan/fzf-lua",
    keys = M.keys,
    -- authors repo: https://github.com/ibhagwan/nvim-lua/blob/main/lua/plugins/fzf-lua/setup.lua
    opts = function()
        local actions = require("fzf-lua.actions")
        return {
            global_resume = true, -- enable global `resume`?
            global_resume_query = true, -- include typed query in `resume`?
            file_icon_padding = " ",

            -- ❤️ https://github.com/ibhagwan/fzf-lua/issues/1051#issuecomment-2094803850
            defaults = {
                formatter = "path.filename_first",
                git_icons = true, -- show git icons?
                file_icons = true, -- show file icons?
                color_icons = true, -- colorize file|git icons
                -- multiline = 2,
            },

            winopts = {
                height = 0.85,
                width = 0.85,
                row = 0.35,
                col = 0.50,
                border = "solid",
                preview = {
                    border = "border", -- border|noborder, applies only to
                    wrap = "nowrap", -- wrap|nowrap
                    hidden = "nohidden", -- hidden|nohidden
                    vertical = "up:65%", -- up|down:size
                    horizontal = "right:60%", -- right|left:size
                    layout = "flex", -- horizontal|vertical|flex
                    flip_columns = 200, -- #cols to switch to horizontal on flex
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
                ["--height"] = "100%",
                ["--layout"] = "reverse",
                ["--keep-right"] = "",
                ["--reverse"] = "",
                ["--border"] = false,
                ["--preview-window"] = "border-sharp",
                ["--highlight-line"] = true,
                ["--border-label"] = "[ Vin ]",
                ["--padding"] = "1,6",
                ["--no-scrollbar"] = "",
            },

            fzf_colors = {
                ["fg"] = { "fg", "Normal" },
                ["fg+"] = { "fg", "CursorLineNr" },
                ["bg"] = { "bg", "NormalFloat" },
                ["hl"] = { "fg", "Comment" },
                ["hl+"] = { "fg", "Statement" },
                ["bg+"] = { "bg", "Visual" },
                ["border"] = { "fg", "CursorLineNr" },
                ["query"] = { "fg", "Statement" },
                ["info"] = { "fg", "PreProc" },
                ["label"] = { "fg", "CursorLineNr" },
                ["prompt"] = { "fg", "Conditional" },
                ["pointer"] = { "fg", "Exception" },
                ["marker"] = { "fg", "Keyword" },
                ["spinner"] = { "fg", "Label" },
                ["header"] = { "fg", "Comment" },
                ["gutter"] = { "bg", "NormalFloat" },
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
                codeaction_native = {
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
                header = false,
                multiline = 2,
                find_opts = [[-type f -not -path '*/\.git/*' -not -name '.DS_Store' -printf '%P\n']],
                rg_opts = "--color=never --files --hidden --follow -g '!.git' -g '!.DS_Store'",
                fd_opts = "--color=never --type f --hidden --follow --exclude .git --exclude .DS_Store",
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
                },

                status = {
                    prompt = "Modified Files❯ ",
                    cmd = "git status -su",
                    previewer = "git_diff",
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
                -- multiline = 2,
                multiprocess = true, -- run command in a separate process
                rg_opts = "--no-heading --color=always --smart-case --max-columns=512",
                grep_opts = "--binary-files=without-match --line-number --recursive --color=auto",
                -- 'live_grep_glob' options:
                glob_flag = "--iglob", -- for case sensitive globs use '--glob'
                glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
            },

            oldfiles = {
                prompt = "History❯ ",
                cwd_only = true,
                stat_file = true,
                include_current_session = true, -- include bufs from current session
            },

            buffers = {
                prompt = "Buffers❯ ",
                sort_lastused = true, -- sort buffers() by last used
                cwd_only = true, -- buffers for the cwd only
                cwd = nil, -- buffers list for a given dir
                actions = {
                    ["ctrl-x"] = { actions.buf_del, actions.resume },
                },
            },

            lsp = {
                prompt_postfix = "❯ ", -- will be appended to the LSP label
                cwd_only = true, -- LSP/diagnostics for cwd only?
                async_or_timeout = 5000, -- timeout(ms) or 'true' for async calls
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
                    async_or_timeout = 5000,
                    previewer = "codeaction_native",
                    -- TODO: report bug that winopts get discarded if i use the delta previewer
                    -- preview_pager = "delta --side-by-side --width=$FZF_PREVIEW_COLUMNS --hunk-header-style='omit' --file-style='omit'",
                },
            },
        }
    end,
    config = function(_, opts)
        require("fzf-lua").setup(opts)
    end,
}

return M.spec
