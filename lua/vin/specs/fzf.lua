local M = {}

M.winopts = {
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
        vertical = {
            height = 0.65,
            width = 0.65,
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

-- stylua: ignore start
M.keys = {
    { "<leader><leader>", function() require("fzf-lua").files({ winopts = M.winopts.lg.flex }) end, desc = "Find Files" },
    { "<leader>/", function() require("fzf-lua").lgrep_curbuf({ winopts = M.winopts.md.flex }) end, desc = "Grep Current File" },
    { "<C-_>", function() require("fzf-lua").lgrep_curbuf({ winopts = M.winopts.md.flex }) end, desc = "Grep Current File" },
    { "<leader>;", function() require("fzf-lua").commands({ winopts = M.winopts.sm.no_preview }) end, desc = "Commands" },
    { "<leader>j", function() require("fzf-lua").jumps({ winopts = M.winopts.md.vertical }) end, desc = "Jumps" },
    { "<C-r>", function() require("fzf-lua").oldfiles({ cwd_only = true, winopts = M.winopts.sm.no_preview }) end, desc = "Recent" },
    { "<leader>r", function() require("fzf-lua").oldfiles({ cwd_only = true, winopts = M.winopts.sm.no_preview }) end, desc = "Recent" },
    { "<leader>R", function() require("fzf-lua").oldfiles({ cwd_only = false, winopts = M.winopts.sm.no_preview }) end, desc = "Recent [Everywhere]" },
    { "<leader>s.", function() require("fzf-lua").resume() end, desc = "Resume" },
    { "<leader>sh", function() require("fzf-lua").help_tags() end, desc = "Help Tags" },
    { "<leader>sH", function() require("fzf-lua").highlights() end, desc = "Highlights" },
    { "<leader>sk", function() require("fzf-lua").keymaps() end, desc = "Keymaps" },
    { "<leader>sw", function() require("fzf-lua").grep_cword() end, mode = { "n", "v" }, desc = "Word" },
    { "<leader>sm", function() require("fzf-lua").marks({ winopts = M.winopts.lg.vertical }) end, desc = "Marks" },
    { "<leader>ss", function() M.search_selection_with_fzf() end, mode = "v", desc = "Selection" },
    { "<leader>sM", function() require("fzf-lua").man_pages() end, desc = "Man Pages" },
    { "<leader>sg", function() require("fzf-lua").live_grep_native({ winopts = M.winopts.lg.vertical }) end, desc = "Grep" },
    { "<leader>sG", function() require("fzf-lua").live_grep_resume() end, desc = "Grep Resume" },
    { "<leader>s'", function() require("fzf-lua").registers({ winopts = M.winopts.lg.vertical }) end, mode = { "n", "v" }, desc = "Registers" },
    { "<leader>s<Tab>", function() require("fzf-lua").tabs() end, desc = "Tabs" },
    { "<leader>gs", function() require("fzf-lua").git_status({ winopts = M.winopts.lg.vertical }) end, desc = "Git Status" },
    { "<leader>gc", function() require("fzf-lua").changes() end, desc = "Changes" },
    { "<leader>gB", function() require("fzf-lua").git_branches() end, desc = "Branches" },
    { "<leader>gC", function() require("fzf-lua").git_commits() end, desc = "Commits" },
    { "<leader>ut", function() require("fzf-lua").colorschemes() end, desc = "Toggle Tthemes" },
    { "<leader>uT", function() require("fzf-lua").awesome_colorschemes() end, desc = "Toggle 'Awesome' Themes" },
    { "<leader>dd", function() require("fzf-lua").lsp_document_diagnostics({ winopts = M.winopts.lg.vertical }) end, desc = "Diagnostics Document (fzf)" },
    { "<leader>dw", function() require("fzf-lua").lsp_workspace_diagnostics({ winopts = M.winopts.lg.vertical }) end, desc = "Diagnostics Workspace (fzf)" },
    { "gs", function() require("fzf-lua").lsp_document_symbols({ winopts = M.winopts.lg.vertical }) end, desc = "Document Symbols" },
    { "gS", function() require("fzf-lua").lsp_live_workspace_symbols({ winopts = M.winopts.lg.vertical }) end, desc = "Workspace Symbols" },
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
        require("fzf-lua").lsp_code_actions()
    end, { desc = "[C]ode [A]ction" })
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
            ["--border-label"] = "[ Vin ]",
            ["--padding"] = "1,3",
            ["--no-scrollbar"] = "",
            ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-history",
        },

        fzf_colors = true,

        previewers = {
            builtin = {
                treesitter = { enable = true },
            },
        },
        -- TODO: Try to make headers work: https://github.com/ibhagwan/fzf-lua/issues/1351#issuecomment-2265742596
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
                    height = 0.35,
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
