local M = {}

M.winopts = {
    sm = {
        no_preview = {
            row = 0.85,
            col = 0.5,
            height = 0.20,
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
        vertical = {
            row = 0.65,
            col = 0.5,
            height = 0.85,
            width = 0.65,
            backdrop = 65,
            preview = {
                layout = "vertical",
                vertical = "up:65%", -- up|down:size
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
                horizontal = "left:50%", -- right|left:size
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

function M.search_selection_with_fzf()
    -- Save the current selection to the unnamed register
    vim.cmd('normal! "vy')

    -- Get the content of the unnamed register
    local selection = vim.fn.getreg("v")

    -- Remove any leading/trailing whitespace
    selection = selection:gsub("^%s*(.-)%s*$", "%1")

    require("fzf-lua").live_grep_native({ search = selection, winopts = M.winopts.lg.vertical })
end

function M.grep_over_changed_files()
    require("fzf-lua").grep({
        raw_cmd = [[git status -su | rg "^\s*M" | cut -d ' ' -f3 | xargs rg --hidden --column --line-number --no-heading --color=always  --with-filename -e '']],
    })
end

function M.find_related_files()
    local current_filename = vim.fn.expand("%:t:r")
    local relative_filepath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.") -- Get path relative to cwd

    require("fzf-lua").files({
        query = current_filename,
        winopts = M.winopts.sm.no_preview,
        fd_opts = string.format("--color=never --type f --hidden --follow --exclude .git --exclude %q", relative_filepath),
        fzf_opts = {
            ["--tiebreak"] = "chunk",
            ["--no-info"] = "",
        },
    })
end

M.keys = function()
    local fzfLua = require("fzf-lua")

    return {
        -- stylua: ignore start
        { "<CR>",             function() fzfLua.oldfiles({ cwd_only = true, prompt = "Recent Files (CWD): ", winopts = M.winopts.sm.no_preview }) end, desc = "Recent Files" },
        { "<S-CR>",           function() fzfLua.files({ winopts = M.winopts.md.flex }) end, desc = "[W]orkspace [D]ocument" },
        { "<A-CR>",           M.find_related_files, desc = "Related Files", },
        { "<C-S-CR>",         function() fzfLua.oldfiles({ cwd_only = false, prompt = "Recent Files (Anywhere): ", winopts = M.winopts.sm.no_preview }) end, desc = "Recent" },
        { "gs",               function() fzfLua.lsp_document_symbols({ winopts = M.winopts.lg.vertical }) end, desc = "Document Symbols" },
        { "gS",               function() fzfLua.lsp_live_workspace_symbols({ winopts = M.winopts.lg.vertical }) end, desc = "Workspace Symbols" },
        { "<leader>/",        function() fzfLua.lgrep_curbuf({ winopts = M.winopts.md.flex }) end, desc = "Text in File" },
        { "<leader>;",        function() fzfLua.commands({ winopts = M.winopts.md.vertical }) end, desc = "Commands" },
        { "<leader><tab>",    function() fzfLua.tabs() end, desc = "Tab Fuzzy Find" },
        { "<leader>j",        function() fzfLua.jumps({ winopts = M.winopts.md.vertical }) end, desc = "Jumps" },
        { "<leader>s.",       function() fzfLua.resume() end, desc = "Resume" },
        { "<leader>wt",       function() fzfLua.live_grep({ winopts = M.winopts.md.vertical }) end, desc = "[T]ext in Workspace" },
        { "<leader>sH",       function() fzfLua.highlights() end, desc = "Highlights" },
        { "<leader>sk",       function() fzfLua.keymaps() end, desc = "Keymaps" },
        { "<leader>sg",       function() fzfLua.live_grep() end, desc = "Grep" },
        { "<leader>sw",       function() fzfLua.grep_cword() end, mode = { "n", "v" }, desc = "Word" },
        { "<leader>sm",       function() fzfLua.marks({ winopts = M.winopts.lg.vertical }) end, desc = "Marks" },
        { "<leader>s'",       function() fzfLua.registers({ winopts = M.winopts.lg.vertical }) end, mode = { "n", "v" }, desc = "Registers" },
        { "<leader>gs",       function() fzfLua.git_status({ winopts = M.winopts.lg.vertical }) end, desc = "Git Status" },
        { "<leader>gc",       function() fzfLua.changes() end, desc = "[C]hanges" },
        { "<leader>gCb",      function() fzfLua.git_branches() end, desc = "Branches" },
        { "<leader>gCc",      function() fzfLua.git_commits() end, desc = "Commits" },
        { "<leader>gCt",      function() fzfLua.git_tags() end, desc = "Tags" },
        { "<leader>??",       function() fzfLua.help_tags() end, desc = "Help Tags" },
        { "<leader>?m",       function() fzfLua.man_pages() end, desc = "Man Pages" },
        { "<leader>ut",       function() fzfLua.colorschemes() end, desc = "Themes" },
        { "<leader>uT",       function() fzfLua.awesome_colorschemes() end, desc = "Themes (Awesome)" },
        { "z=",               function() fzfLua.spell_suggest({ winopts = { height = 0.35, width = 0.65 } }) end, desc = "Spelling Suggestions" },
        -- stylua: ignore end
    }
end

M.lsp_attach = function()
    vim.keymap.set("n", "gd", function()
        require("fzf-lua").lsp_definitions({
            jump_to_single_result = true,
            jump_type = "vsplit",
            winopts = M.winopts.lg.vertical,
        })
    end, { desc = "Go to Definition" })

    vim.keymap.set("n", "gR", function()
        require("fzf-lua").lsp_references({
            jump_to_single_result = true,
            jump_type = "vsplit",
            multiline = 2,

            winopts = M.winopts.lg.vertical,
        })
    end, { desc = "Go to References" })

    vim.keymap.set("n", "g.", function()
        require("fzf-lua").lsp_code_actions()
    end, { desc = "Code Action" })
end

M.spec = {
    "ibhagwan/fzf-lua",
    keys = M.keys,
    opts = {
        global_resume = true,
        global_resume_query = true,
        defaults = {
            formatter = "path.filename_first",
            git_icons = false,
            file_icons = false,
            color_icons = false,
        },

        winopts = {
            height = 0.85,
            width = 0.85,
            row = 0.35,
            col = 0.50,
            border = "none",
            backdrop = 100,
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
        },

        keymap = {
            builtin = {
                ["<C-d>"] = "preview-page-down",
                ["<C-u>"] = "preview-page-up",
            },
            fzf = {
                ["ctrl-c"] = "abort",
                ["ctrl-a"] = "toggle-all",
                ["f3"] = "toggle-preview-wrap",
                ["f4"] = "toggle-preview",
                ["ctrl-d"] = "preview-page-down",
                ["ctrl-u"] = "preview-page-up",
                ["ctrl-q"] = "select-all+accept",
            },
        },

        fzf_opts = {
            ["--prompt"] = "   ",
            ["--keep-right"] = "",
            ["--border-label"] = "[ nbr.nvim ]",
            ["--padding"] = "1,3",
            ["--no-scrollbar"] = "",
            ["--tiebreak"] = "index",
            ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-history",
        },

        fzf_colors = true,

        -- TODO: Try to make headers work: https://github.com/ibhagwan/fzf-lua/issues/1351#issuecomment-2265742596
        files = {
            prompt = "Files  ",
            cwd_prompt_shorten_len = 32, -- shorten prompt beyond this length
            cwd_prompt_shorten_val = 4, -- shortened path parts length
        },

        oldfiles = {
            prompt = "Recent Files  ",
            cwd_only = true,
            stat_file = true,
            include_current_session = true, -- include bufs from current session
        },

        git = {
            files = { prompt = "Git Files  " },
            status = { prompt = "Git Status  " },
        },

        grep = {
            rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512",
        },

        highlights = {
            actions = {
                ["default"] = function(entry)
                    local hl_group = entry[1]
                    vim.fn.setreg("+", hl_group)
                    vim.notify("Copied " .. hl_group .. " to the clipboard!", vim.log.levels.INFO)
                end,
            },
        },
        lsp = {
            code_actions = {
                previewer = false,
                winopts = {
                    relative = "cursor",
                    row = 0.85,
                    col = 0.5,
                    height = 0.15,
                    width = 0.35,
                    preview = { hidden = "hidden" },
                },
            },
        },
    },
    config = function(_, opts)
        require("fzf-lua").setup(opts)

        local config = require("fzf-lua.config")
        local actions = require("trouble.sources.fzf").actions
        config.defaults.actions.files["alt-t"] = actions.open

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("FzfLuaLspAttachGroup", { clear = true }),
            callback = M.lsp_attach,
        })
    end,
}

return M.spec
