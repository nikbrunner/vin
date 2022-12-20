local lualine_present, lualine = pcall(require, "lualine")
if not lualine_present then
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

local tabs = {
    "tabs",
    max_length = vim.o.columns / 3, -- Maximum width of tabs component.
    mode = 2, -- 0: Shows tab_nr
    -- 1: Shows tab_name
    -- 2: Shows tab_nr + tab_name
}

lualine.setup({
    options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {
                "alpha",
                "NvimTree",
            },
            winbar = {
                "alpha",
                "NvimTree",
                "[NoName]",
                "nvim",
            },
        },
        always_divide_middle = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_y = { tabs },
    },
    winbar = {
        lualine_a = { filename },
        lualine_x = { diff },
        lualine_y = { "diagnostics" },
    },
    inactive_winbar = {
        lualine_a = { filename },
        lualine_y = {},
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { branch },
    },
    inactive_sections = {},
    extensions = {},
})
