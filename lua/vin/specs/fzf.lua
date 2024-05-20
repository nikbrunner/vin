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
            winopts = M.win_preset.md.vertical,
            cwd = M.folder_presets[choice],
        })()
    end)
end

M.win_preset = {
    sm = {
        no_preview = {
            row = 0.85,
            col = 1,
            height = 0.35,
            width = 85,
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
                horizontal = "right:65%", -- right|left:size
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

M.columns = vim.o.columns

M.responsive_vertical_window = function(cmd, win_width, breakpoint, opts)
    -- TODO: win_width does not update on resize. I don't understand why.
    opts = opts or {}

    local function get_win_opts()
        if win_width <= breakpoint then
            return {
                height = 0.9,
                width = 0.9,
                preview = {
                    layout = "vertical",
                    vertical = "up:65%",
                },
            }
        else
            return {
                row = 0.85,
                col = 1,
                height = 0.9,
                width = 0.5,
                preview = {
                    layout = "vertical",
                    vertical = "up:65%", -- up|down:size
                },
            }
        end
    end

    opts = vim.tbl_deep_extend("force", { winopts = get_win_opts() }, opts)

    return M.fzf(cmd, opts)
end

-- stylua: ignore start
M.keys = {
    -- Root layer
    { "<leader><space>",     M.responsive_vertical_window("files", vim.api.nvim_win_get_width(0), 175), desc = "Files" },
    { "<leader>/",           M.fzf("lgrep_curbuf"), desc = "Grep Current File" },
    { "<leader>:",           M.fzf("commands", M.use_win_preset(M.win_preset.sm.no_preview)), desc = "Commands" },
    { "<leader>r",           M.fzf("oldfiles", M.use_win_preset(M.win_preset.sm.no_preview, { cwd_only = true })), desc = "Recent Files" },
    { "<leader>R",           M.fzf("oldfiles", M.use_win_preset(M.win_preset.sm.no_preview, { cwd_only = false })), desc = "Recent Files (Everywhere)" },

    -- [S]earch Group
    { "<leader>s.",          M.fzf("resume"), desc = "[.] Resume" },
    { "<leader>s:",          M.fzf("commands", M.use_win_preset(M.win_preset.sm.no_preview)), desc = "[C]ommands" },
    { "<leader>s/",          M.search_preset_folder, desc = "[/] Search Folder" },
    {
        "<leader>sd",
        function()
            require("fzf-lua").files({ cmd = "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME ls-files" })
        end,
        desc = "[D]otfiles"
    },
    { "<leader>sh",          M.fzf("help_tags"), desc = "[H]elp Tags" },
    { "<leader>sH",          M.fzf("highlights"), desc = "[H]ighlights" },
    { "<leader>sk",          M.fzf("keymaps"), desc = "[K]eymaps" },
    { "<leader>sw",          M.fzf("grep_cword"), mode = { "n", "v" }, desc = "[W]ord", },
    -- TODO: search visual selection
    { "<leader>sm",          M.fzf("marks"), desc = "[M]arks" },
    { "<leader>sM",          M.fzf("man_pages"), desc = "[M]an Pages" },
    { "<leader>sg",          M.fzf("live_grep_native", M.use_win_preset(M.win_preset.lg.vertical)), desc = "[G]rep" },
    { "<leader>sG",          M.fzf("live_grep_resume"), desc = "[G]rep Resume" },
    { "<leader>sr",          M.fzf("registers", M.use_win_preset(M.win_preset.sm.no_preview)), mode = { "n", "v" }, desc = "[R]egisters" },
    { "<leader>s<Tab>",      M.fzf("tabs"), desc = "[Tab]s" },

    -- [G]it Group
    { "<leader>gs",          M.fzf("git_status", M.use_win_preset(M.win_preset.fullscreen.flex)), desc = "[S]tatus" },
    { "<leader>gc",          M.fzf("changes"), desc = "[C]hanges" },
    { "<leader>gB",          M.fzf("git_branches"), desc = "[B]ranches" },
    { "<leader>gC",          M.fzf("git_commits"), desc = "[C]ommits" },

    -- [U]I Group
    { "<leader>ut",          M.fzf("colorschemes"), desc = "Toggle [T]themes" },
    { "<leader>uT",          M.fzf("awesome_colorschemes"), desc = "Toggle 'Awesome' [T]hemes" },

    -- [D]iagnostics Group
    { "<leader>dd",          M.fzf("lsp_document_diagnostics", M.use_win_preset(M.win_preset.lg.vertical)), desc = "Document Diagnostics" },
    { "<leader>dw",          M.fzf("lsp_workspace_diagnostics", M.use_win_preset(M.win_preset.lg.vertical)), desc = "Document Diagnostics" },

    -- No leader key
    { "gs",                  M.fzf("lsp_document_symbols"), desc = "Document [S]ymbols" },
    { "gS",                  M.fzf("lsp_live_workspace_symbols"), desc = "Workspace [S]ymbols" },

    -- Insert Mode
    -- { "<C-r>",               M.fzf("registers", M.use_win_preset( M.win_preset.sm.no_preview)), mode = { "i" }, desc = "Registers" }
}
-- stylua: ignore end

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

            winopts = {
                height = 0.85,
                width = 0.85,
                row = 0.35,
                col = 0.50,
                border = "none",
                preview = {
                    border = "border", -- border|noborder, applies only to
                    wrap = "nowrap", -- wrap|nowrap
                    hidden = "nohidden", -- hidden|nohidden
                    vertical = "up:65%", -- up|down:size
                    horizontal = "right:60%", -- right|left:size
                    layout = "flex", -- horizontal|vertical|flex
                    flip_columns = 150, -- #cols to switch to horizontal on flex
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
                -- ["--border"] = "block",
                ["--border-label"] = "[ Vin ]",
                ["--padding"] = "1,6",
                ["--no-scrollbar"] = "",
                ["--no-separator"] = "",
                ["--no-info"] = "",
            },

            fzf_colors = {
                ["fg"] = { "fg", "Normal" },
                ["fg+"] = { "fg", "CursorLineNr" },
                ["bg"] = { "bg", "NormalFloat" },
                ["hl"] = { "fg", "Comment" },
                ["hl+"] = { "fg", "Statement" },
                ["bg+"] = { "bg", "Normal" },
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
                man = {
                    cmd = "man -c %s | col -bx",
                },
            },

            -- ❤️ https://github.com/ibhagwan/fzf-lua/issues/1051#issuecomment-2094803850
            defaults = {
                formatter = "path.filename_first",
            },

            files = {
                prompt = "  ",
                multiprocess = true, -- run command in a separate process
                git_icons = true, -- show git icons?
                file_icons = false, -- show file icons?
                header = false,
                color_icons = false, -- colorize file|git icons
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
                    file_icons = false, -- show file icons?
                    color_icons = true, -- colorize file|git icons
                },

                status = {
                    prompt = "Modified Files❯ ",
                    cmd = "git status -su",
                    previewer = "git_diff",
                    file_icons = false,
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
                file_icons = false, -- show file icons?
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
                stat_file = true,
                include_current_session = true, -- include bufs from current session
            },

            buffers = {
                prompt = "Buffers❯ ",
                file_icons = false, -- show file icons?
                color_icons = true, -- colorize file|git icons
                sort_lastused = true, -- sort buffers() by last used
                cwd_only = true, -- buffers for the cwd only
                cwd = nil, -- buffers list for a given dir
                actions = {
                    ["ctrl-x"] = { actions.buf_del, actions.resume },
                },
            },

            quickfix = {
                file_icons = false,
                git_icons = true,
            },

            lsp = {
                prompt_postfix = "❯ ", -- will be appended to the LSP label
                cwd_only = true, -- LSP/diagnostics for cwd only?
                async_or_timeout = 5000, -- timeout(ms) or 'true' for async calls
                file_icons = false,
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
