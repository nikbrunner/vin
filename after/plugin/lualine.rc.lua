local lualine_present, lualine = pcall(require, "lualine")
if not lualine_present then
    return
end

local navic_present, navic = pcall(require, "nvim-navic")
if not navic_present then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end
local mode = {
    "mode",
    padding = 3,
}

local branch = {
    "branch",
    padding = 3,
}

local diff = {
    "diff",
    colored = true, -- Displays a colored diff status if set to true
    diff_color = {
        -- Same color values as the general color option can be used here.
        added = "DiffAdd", -- Changes the diff's added color
        modified = "DiffChange", -- Changes the diff's modified color
        removed = "DiffDelete", -- Changes the diff's removed color you
    },
    symbols = { added = " ", modified = " ", removed = " " }, -- Changes the symbols used by the diff.
    cond = hide_in_width,
}

local filetype = {
    "filetype",
    colored = true, -- Displays filetype icon in color if set to true
    icon_only = false, -- Display only an icon for filetype
    icon = { align = "left" }, -- Display filetype icon on the right hand side
    -- icon =    {'X', align='right'}
    -- Icon string ^ in table is ignored in filetype component
    padding = 3,
}

local filename = {
    "filename",
    file_status = true, -- Displays file status (readonly status, modified status)
    path = 1, -- 0: Just the filename
    -- 1: Relative path
    -- 2: Absolute path
    -- 3: Absolute path, with tilde as the home directory
    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
    -- for other components. (terrible name, any suggestions?)
    symbols = {
        modified = "", -- Text to show when the file is modified.
        readonly = "", -- Text to show when the file is non-modifiable or readonly.
        unnamed = "[No Name]", -- Text to show for unnamed buffers.
    },
}

lualine.setup({
    options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "auto",
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {
                "alpha",
                "NvimTree",
            },
            winbar = {
                "alpha",
                "NvimTree",
            },
        },
        always_divide_middle = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = { filename },
        lualine_x = {},
        lualine_y = { filetype },
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {
        lualine_z = { "tabs" },
    },
    extensions = {},
    -- TODO: Enable when it does not throw so much godamn errors
    -- Source: https://github.com/neovim/neovim/issues/19458
    --         https://github.com/glepnir/lspsaga.nvim/issues/379
    --         https://github.com/nvim-lualine/lualine.nvim/issues/754
    winbar = {
        lualine_c = {
            {
                "filename",
            },
            {
                navic.get_location,
                cond = navic.is_available and hide_in_width,
            },
        },
    },
    inactive_winbar = {
        lualine_c = { filename },
    },
})
