local M = {}

M.winopts = {
    sm = {
        no_preview = {
            row = 0.85,
            col = 0.5,
            height = 0.35,
            width = 0.75,
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

-- stylua: ignore start
M.keys = {
    { "<leader><space>", function() require("fzf-lua").files({ winopts = M.winopts.lg.flex }) end, desc = "Find Files" },
    { "<leader>/", function() require("fzf-lua").lgrep_curbuf({ winopts = M.winopts.lg.vertical }) end, desc = "Grep Current File" },
    { "<leader>:", function() require("fzf-lua").commands({ winopts = M.winopts.sm.no_preview }) end, desc = "Commands" },
    { "<leader>r", function() require("fzf-lua").oldfiles({ cwd_only = true, winopts = M.winopts.sm.no_preview }) end, desc = "[R]ecent Files" },
    { "<leader>R", function() require("fzf-lua").oldfiles({ cwd_only = false, winopts = M.winopts.sm.no_preview }) end, desc = "[R]ecent Files (Everywhere)" },
    { "<leader>s.", function() require("fzf-lua").resume() end, desc = "[.] Resume" },
    { "<leader>sh", function() require("fzf-lua").help_tags() end, desc = "[H]elp Tags" },
    { "<leader>sH", function() require("fzf-lua").highlights() end, desc = "[H]ighlights" },
    { "<leader>sk", function() require("fzf-lua").keymaps() end, desc = "[K]eymaps" },
    { "<leader>sw", function() require("fzf-lua").grep_cword() end, mode = { "n", "v" }, desc = "[W]ord" },
    { "<leader>sm", function() require("fzf-lua").marks() end, desc = "[M]arks" },
    { "<leader>sM", function() require("fzf-lua").man_pages() end, desc = "[M]an Pages" },
    { "<leader>sg", function() require("fzf-lua").live_grep_native({ winopts = M.winopts.lg.vertical }) end, desc = "[G]rep" },
    { "<leader>sG", function() require("fzf-lua").live_grep_resume() end, desc = "[G]rep Resume" },
    { "<leader>s'", function() require("fzf-lua").registers({ winopts = M.winopts.lg.vertical }) end, mode = { "n", "v" }, desc = "[R]egisters" },
    { "<leader>s<Tab>", function() require("fzf-lua").tabs() end, desc = "[Tab]s" },
    { "<leader>gs", function() require("fzf-lua").git_status({ winopts = M.winopts.lg.vertical }) end, desc = "[S]tatus" },
    { "<leader>gc", function() require("fzf-lua").changes() end, desc = "[C]hanges" },
    { "<leader>gB", function() require("fzf-lua").git_branches() end, desc = "[B]ranches" },
    { "<leader>gC", function() require("fzf-lua").git_commits() end, desc = "[C]ommits" },
    { "<leader>ut", function() require("fzf-lua").colorschemes() end, desc = "Toggle [T]themes" },
    { "<leader>uT", function() require("fzf-lua").awesome_colorschemes() end, desc = "Toggle 'Awesome' [T]hemes" },
    { "<leader>dd", function() require("fzf-lua").lsp_document_diagnostics({ winopts = M.winopts.lg.vertical }) end, desc = "Document Diagnostics" },
    { "<leader>dw", function() require("fzf-lua").lsp_workspace_diagnostics({ winopts = M.winopts.lg.vertical }) end, desc = "Workspace Diagnostics" },
    { "gs", function() require("fzf-lua").lsp_document_symbols({ winopts = M.winopts.lg.vertical }) end, desc = "Document [S]ymbols" },
    { "gS", function() require("fzf-lua").lsp_live_workspace_symbols({ winopts = M.winopts.lg.vertical }) end, desc = "Workspace [S]ymbols" },
}
-- stylua: ignore end

M.lsp_attach = function()
    vim.keymap.set("n", "gd", function()
        require("fzf-lua").lsp_definitions({
            jump_to_single_result = true,
            jump_type = "vsplit",
            winopts = M.winopts.lg.vertical,
        })
    end, { desc = "Go to [D]efinition" })

    vim.keymap.set("n", "gr", function()
        require("fzf-lua").lsp_references({
            jump_to_single_result = true,
            jump_type = "vsplit",
            multiline = 2,

            winopts = M.winopts.lg.vertical,
        })
    end, { desc = "Go to [R]eferences" })

    vim.keymap.set("n", "<leader>ca", function()
        require("fzf-lua").lsp_code_actions({
            previewer = false,
            winopts = {
                row = 0.85,
                col = 0.5,
                height = 0.35,
                width = 0.5,
                preview = { hidden = "hidden" },
            },
        })
    end, { desc = "Code [A]ction" })
end

M.spec = {
    "ibhagwan/fzf-lua",
    keys = M.keys,
    opts = {
        global_resume = true,
        global_resume_query = true,
        defaults = {
            formatter = "path.filename_first",
            git_icons = true, -- show git icons?
            file_icons = true, -- show file icons?
            color_icons = true, -- colorize file|git icons
        },
        winopts = {
            height = 0.85,
            width = 0.85,
            row = 0.35,
            col = 0.50,
            border = "single",
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
            ["--border-label"] = "[ Vin ]",
            ["--padding"] = "1,3",
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
            ["pointer"] = { "fg", "CursorLineNr" },
            ["marker"] = { "fg", "Keyword" },
            ["spinner"] = { "fg", "Label" },
            ["header"] = { "fg", "Comment" },
            ["gutter"] = { "bg", "NormalFloat" },
        },
        previewers = {
            builtin = {
                treesitter = { enable = true },
            },
        },
        files = {
            prompt = "Files  ",
        },
        oldfiles = {
            prompt = "History❯ ",
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
    },
    config = function(_, opts)
        require("fzf-lua").setup(opts)

        local config = require("fzf-lua.config")
        local actions = require("trouble.sources.fzf").actions
        config.defaults.actions.files["ctrl-t"] = actions.open

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("FzfLuaLspAttachGroup", { clear = true }),
            callback = M.lsp_attach,
        })
    end,
}

return M.spec
