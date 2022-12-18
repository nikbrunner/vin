local present, saga = pcall(require, "lspsaga")
if not present then
    return
end

-- use custom config
saga.init_lsp_saga({

    -- Options with default value
    -- "single" | "double" | "rounded" | "bold" | "plus"
    border_style = "rounded",

    --the range of 0 for fully opaque window (disabled) to 100 for fully
    --transparent background. Values between 0-30 are typically most useful.
    saga_winblend = 0,

    -- when cursor in saga window you config these to move
    move_in_saga = { prev = "<C-u>", next = "<C-d>" },

    -- Error, Warn, Info, Hint
    -- use emoji like
    -- { "🙀", "😿", "😾", "😺" }
    -- or
    -- { "😡", "😥", "😤", "😐" }
    -- and diagnostic_header can be a function type
    -- must return a string and when diagnostic_header
    -- is function type it will have a param `entry`
    -- entry is a table type has these filed
    -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
    -- diagnostic_header = { " ", " ", " ", "ﴞ " },
    diagnostic_header = { "😡", "😥", "😤", "😐" },

    definition_action_keys = {
        edit = "<C-c>o",
        vsplit = "<C-c>v",
        split = "<C-c>i",
        tabe = "<C-c>t",
        quit = "q",
    },

    -- preview lines of lsp_finder and definition preview
    max_preview_lines = 10,

    -- use emoji lightbulb in default
    code_action_icon = "",

    -- if true can press number to execute the codeaction in codeaction window
    code_action_num_shortcut = true,

    -- same as nvim-lightbulb but async
    code_action_lightbulb = {
        enable = true,
        sign = true,
        cache_code_action = true,
        enable_in_insert = false,
        update_time = 150,
        sign_priority = 20,
        virtual_text = true,
    },

    -- finder icons
    finder_icons = {
        def = vin.icons.kind.Method .. " ",
        ref = vin.icons.kind.Reference .. " ",
        link = vin.icons.kind.Class .. " ",
    },

    -- finder do lsp request timeout
    -- if your project big enough or your server very slow
    -- you may need to increase this value
    finder_request_timeout = 1500,

    finder_action_keys = {
        open = "<CR>",
        vsplit = "<C-v>",
        split = "<C-s>",
        tabe = "<C-t>",
        quit = "q",
        scroll_down = "<C-d>",
        scroll_up = "<C-u>", -- quit can be a table
    },

    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },

    rename_action_quit = "q",

    rename_in_select = true,

    -- show symbols in winbar must nightly
    -- TODO: Make this work?
    symbol_in_winbar = {
        in_custom = false,
        enable = false,
        separator = " ",
        show_file = true,
        click_support = false,
    },

    -- show outline
    show_outline = {
        win_position = "right",
        --set special filetype win that outline window split.like NvimTree neotree
        -- defx, db_ui
        win_with = "",
        win_width = 30,
        auto_enter = true,
        auto_preview = true,
        virt_text = "┃",
        jump_key = "o",
        -- auto refresh when change buffer
        auto_refresh = true,
    },

    -- if you don't use nvim-lspconfig you must pass your server name and
    -- the related filetypes into this table
    -- like server_filetype_map = { metals = { "sbt", "scala" } }
    server_filetype_map = {},
})
