-- [FzfLua Quickstart: it's never been easier to try out fzf-lua : neovim](https://www.reddit.com/r/neovim/comments/113ewaf/fzflua_quickstart_its_never_been_easier_to_try/)

---@type LazySpec
local spec = {
    "ibhagwan/fzf-lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    enabled = false,
    opts = function()
        local actions = require("fzf-lua.actions")
        return {
            global_resume = true, -- enable global `resume`?
            global_resume_query = true, -- include typed query in `resume`?
            winopts = {
                height = 0.50, -- window height
                width = 0.75, -- window width
                row = 0.35, -- window row position (0=top, 1=bottom)
                col = 0.50, -- window col position (0=left, 1=right)
                border = "rounded",
                hl = {
                    normal = "NeoTreeNormal", -- window normal color (fg+bg)
                    border = "FloatBorder", -- border color
                    help_border = "FloatBorder", -- <F1> window border
                },
                preview = {
                    -- native fzf previewers (bat/cat/git/etc)
                    -- default     = 'bat',
                    border = "border", -- border|noborder, applies only to
                    wrap = "nowrap", -- wrap|nowrap
                    hidden = "nohidden", -- hidden|nohidden
                    vertical = "down:45%", -- up|down:size
                    horizontal = "right:60%", -- right|left:size
                    layout = "flex", -- horizontal|vertical|flex
                    flip_columns = 120, -- #cols to switch to horizontal on flex
                    -- Only valid with the builtin previewer:
                    title = true, -- preview border title (file/buf)?
                    scrollbar = "float", -- `false` or string:'float|border'
                    -- float:  in-window floating border
                    -- border: in-border chars (see below)
                    scrolloff = "-2", -- float scrollbar offset from right
                    -- applies only when scrollbar = 'float'
                    scrollchars = { "█", "" }, -- scrollbar chars ({ <full>, <empty> }
                    -- applies only when scrollbar = 'border'
                    delay = 100, -- delay(ms) displaying the preview
                    -- prevents lag on fast scrolling
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
                    -- called once upon creation of the fzf main window
                    -- can be used to add custom fzf-lua mappings, e.g:
                    --   vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<Down>",
                    --     { silent = true, noremap = true })
                end,
            },
            keymap = {
                -- These override the default tables completely
                -- no need to set to `false` to disable a bind
                -- delete or modify is sufficient
                builtin = {
                    -- neovim `:tmap` mappings for the fzf win
                    ["<F1>"] = "toggle-help",
                    ["<F2>"] = "toggle-fullscreen",
                    -- Only valid with the 'builtin' previewer
                    ["<F3>"] = "toggle-preview-wrap",
                    ["<F4>"] = "toggle-preview",
                    -- Rotate preview clockwise/counter-clockwise
                    ["<F5>"] = "toggle-preview-ccw",
                    ["<F6>"] = "toggle-preview-cw",
                    ["<S-down>"] = "preview-page-down",
                    ["<S-up>"] = "preview-page-up",
                    ["<S-left>"] = "preview-page-reset",
                },
                fzf = {
                    -- fzf '--bind=' options
                    ["ctrl-c"] = "abort",
                    -- ["ctrl-u"] = "unix-line-discard",
                    ["ctrl-d"] = "half-page-down",
                    ["ctrl-u"] = "half-page-up",
                    -- ["ctrl-a"] = "beginning-of-line",
                    -- ["ctrl-e"] = "end-of-line",
                    ["ctrl-a"] = "toggle-all",
                    ["ctrl-q"] = "select-all+accept",
                    -- Only valid with fzf previewers (bat/cat/git/etc)
                    ["f3"] = "toggle-preview-wrap",
                    ["f4"] = "toggle-preview",
                    ["shift-down"] = "preview-page-down",
                    ["shift-up"] = "preview-page-up",
                },
            },
            fzf_opts = {
                -- options are sent as `<left>=<right>`
                -- set to `false` to remove a flag
                -- set to '' for a non-value flag
                -- for raw args use `fzf_args` instead
                ["--ansi"] = "",
                ["--prompt"] = "  ",
                ["--info"] = "inline",
                ["--height"] = "100%",
                ["--layout"] = "reverse",
                ["--keep-right"] = "",
            },
            previewers = {
                cat = {
                    cmd = "cat",
                    args = "--number",
                },
                bat = {
                    cmd = "bat",
                    args = "--style=numbers,changes --color always",
                    theme = "Coldark-Dark", -- bat preview theme (bat --list-themes)
                    config = nil, -- nil uses $BAT_CONFIG_PATH
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
                builtin = {
                    syntax = true, -- preview syntax highlight?
                    syntax_limit_l = 0, -- syntax limit (lines), 0=nolimit
                    syntax_limit_b = 1024 * 1024, -- syntax limit (bytes), 0=nolimit
                },
            },
            -- provider setup
            files = {
                -- previewer = "bat", -- uncomment to override previewer
                -- (name from 'previewers' table)
                -- set to 'false' to disable
                prompt = "Find File❯ ",
                multiprocess = true, -- run command in a separate process
                git_icons = true, -- show git icons?
                file_icons = true, -- show file icons?
                color_icons = true, -- colorize file|git icons
                -- executed command priority is 'cmd' (if exists)
                -- otherwise auto-detect prioritizes `fd`:`rg`:`find`
                -- default options are controlled by 'fd|rg|find|_opts'
                -- NOTE: 'find -printf' requires GNU find
                -- cmd            = "find . -type f -printf '%P\n'",
                find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
                rg_opts = "--color=never --files --hidden --follow -g '!.git'",
                fd_opts = "--color=never --type f --hidden --follow --exclude .git",
                actions = {
                    -- set bind to 'false' to disable an action
                    -- default action opens a single selection
                    -- or sends multiple selection to quickfix
                    -- replace the default action with the below
                    -- to open all files whether single or multiple
                    -- ["default"]     = actions.file_edit,
                    ["default"] = actions.file_edit_or_qf,
                    ["ctrl-s"] = actions.file_split,
                    ["ctrl-v"] = actions.file_vsplit,
                    ["ctrl-t"] = actions.file_tabedit,
                    ["ctrl-q"] = actions.file_sel_to_qf,
                    -- custom actions are available too
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
                    -- force display the cwd header line regardles of your current working
                    -- directory can also be used to hide the header when not wanted
                    -- show_cwd_header = true
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
                    preview = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
                    actions = {
                        ["default"] = actions.git_checkout,
                    },
                },
                bcommits = {
                    prompt = "BCommits❯ ",
                    cmd = "git log --pretty=oneline --abbrev-commit --color",
                    preview = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
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
                    -- override git icons?
                    -- ["M"]        = { icon = "★", color = "red" },
                    -- ["D"]        = { icon = "✗", color = "red" },
                    -- ["A"]        = { icon = "+", color = "green" },
                },
            },
            grep = {
                prompt = "Grep Text❯ ",
                input_prompt = "Grep For❯ ",
                multiprocess = true, -- run command in a separate process
                git_icons = true, -- show git icons?
                file_icons = true, -- show file icons?
                color_icons = true, -- colorize file|git icons
                -- executed command priority is 'cmd' (if exists)
                -- otherwise auto-detect prioritizes `rg` over `grep`
                -- default options are controlled by 'rg|grep_opts'
                -- cmd            = "rg --vimgrep",
                rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512",
                grep_opts = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp",
                -- 'live_grep_glob' options:
                glob_flag = "--iglob", -- for case sensitive globs use '--glob'
                glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
            },
            args = {
                prompt = "Args❯ ",
                files_only = true,
                -- added on top of regular file actions
                actions = { ["ctrl-x"] = actions.arg_del },
            },
            oldfiles = {
                prompt = "History❯ ",
                cwd_only = false,
            },
            buffers = {
                prompt = "Buffers❯ ",
                file_icons = true, -- show file icons?
                color_icons = true, -- colorize file|git icons
                sort_lastused = true, -- sort buffers() by last used
                cwd_only = true, -- buffers for the cwd only
                cwd = nil, -- buffers list for a given dir
                actions = {
                    -- actions inherit from 'actions.buffers' and merge
                    -- by supplying a table of functions we're telling
                    -- fzf-lua to not close the fzf window, this way we
                    -- can resume the buffers picker on the same window
                    -- eliminating an otherwise unaesthetic win "flash"
                    ["ctrl-x"] = { actions.buf_del, actions.resume },
                },
            },
            lines = {
                previewer = "builtin", -- set to 'false' to disable
                prompt = "Lines❯ ",
                show_unlisted = false, -- exclude 'help' buffers
                no_term_buffers = true, -- exclude 'term' buffers
                fzf_opts = {
                    -- do not include bufnr in fuzzy matching
                    -- tiebreak by line no.
                    ["--delimiter"] = vim.fn.shellescape("]"),
                    ["--nth"] = "2..",
                    ["--tiebreak"] = "index",
                },
                actions = {
                    ["default"] = actions.buf_edit,
                    ["ctrl-s"] = actions.buf_split,
                    ["ctrl-v"] = actions.buf_vsplit,
                    ["ctrl-t"] = actions.buf_tabedit,
                },
            },
            blines = {
                previewer = "builtin", -- set to 'false' to disable
                prompt = "BLines❯ ",
                show_unlisted = true, -- include 'help' buffers
                no_term_buffers = false, -- include 'term' buffers
                fzf_opts = {
                    -- hide filename, tiebreak by line no.
                    ["--delimiter"] = vim.fn.shellescape("[:]"),
                    ["--with-nth"] = "2..",
                    ["--tiebreak"] = "index",
                },
                actions = {
                    ["default"] = actions.buf_edit,
                    ["ctrl-s"] = actions.buf_split,
                    ["ctrl-v"] = actions.buf_vsplit,
                    ["ctrl-t"] = actions.buf_tabedit,
                },
            },
            colorschemes = {
                prompt = "Colorschemes❯ ",
                live_preview = true, -- apply the colorscheme on preview?
                actions = { ["default"] = actions.colorscheme },
                winopts = { height = 0.55, width = 0.30 },
            },
            quickfix = {
                file_icons = true,
                git_icons = true,
            },
            lsp = {
                prompt_postfix = "❯ ", -- will be appended to the LSP label
                -- to override use 'prompt' instead
                cwd_only = true, -- LSP/diagnostics for cwd only?
                async_or_timeout = 5000, -- timeout(ms) or 'true' for async calls
                file_icons = true,
                git_icons = true,
                -- settings for 'lsp_{document|workspace|lsp_live_workspace}_symbols'
                symbols = {
                    async_or_timeout = true, -- symbols are async by default
                    symbol_style = 1, -- style for document/workspace symbols
                    -- false: disable,    1: icon+kind
                    --     2: icon only,  3: kind only
                    -- NOTE: icons are extracted from
                    -- vim.lsp.protocol.CompletionItemKind
                    -- colorize using nvim-cmp's CmpItemKindXXX highlights
                    -- can also be set to 'TS' for treesitter highlights ('TSProperty', etc)
                    -- or 'false' to disable highlighting
                    symbol_hl_prefix = "CmpItemKind",
                    -- additional symbol formatting, works with or without style
                    symbol_fmt = function(s)
                        return "[" .. s .. "]"
                    end,
                },
                code_actions = {
                    prompt = "Code Actions> ",
                    ui_select = true, -- use 'vim.ui.select'?
                    async_or_timeout = 5000,
                    winopts = {
                        row = 0.40,
                        height = 0.35,
                        width = 0.60,
                    },
                },
            },
            file_icon_padding = "",
            file_icon_colors = {
                ["lua"] = "blue",
            },
        }
    end,
    config = function(_, opts)
        require("fzf-lua").setup(opts)
    end,
}

return spec
