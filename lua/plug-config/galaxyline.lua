local gl = require('galaxyline')
local gls = gl.section
-- local condition = require('galaxyline.condition')
-- local diagnostic = require('galaxyline.provider_diagnostic')
local fileinfo = require('galaxyline.provider_fileinfo')

gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer', 'startify'}

-- NVCode/DarkPlus
-- local colors = {
--     bg = '#22272e',
--     section_bg = '#3D434F',
--     fg = '#f8f8f2',
--     grey = "#545454",
--     blue = '#8be9fd',
--     yellow = '#ffc44c',
--     orange = '#ffae57',
--     red = '#ff5555',
--     magenta = '#ff79c6',
--     cyan = '#59c2ff',
--     green = '#39d353'
-- }

-- Darcula
-- local colors = {
--     bg = '#22272e',
--     section_bg = '#3D434F',
--     fg = '#f8f8f2',
--     grey = '#545454',
--     blue = '#75A8F0',
--     yellow = '#FFC66B',
--     orange = '#CD7832',
--     red = '#E74946',
--     magenta = '#D194C7',
--     purple = '#6E4A82',
--     cyan = '#299999',
--     green = '#8FA867'
-- }

-- GitHub Dark
-- local colors = {
--     bg = '#0d1117',
--     section_bg = '#2D333B',
--     fg = '#ADBAC7',
--     grey = '#2D333B',
--     blue = '#6CB6FF',
--     yellow = '#DAAA3F',
--     orange = '#CD7832',
--     red = '#F47067',
--     magenta = '#DCBDFB',
--     purple = '#6E4A82',
--     cyan = '#96D0FF',
--     green = '#8DDB8C'
-- }

-- TokyoNight
local colors = {
    bg = '#1a1b26',
    section_bg = '#1f2335',
    fg = '#c0caf5',
    grey = '#a9b1d6',
    blue = '#7aa2f7',
    yellow = '#e0af68',
    orange = '#db4b4b',
    red = '#f7768e',
    magenta = '#DCBDFB',
    purple = '#bb9af7',
    cyan = '#7dcfff',
    green = '#73daca'
}

local mode_color = function()
    local mode_colors = {
        n = colors.cyan,
        i = colors.green,
        c = colors.orange,
        V = colors.magenta,
        [''] = colors.magenta,
        v = colors.magenta,
        R = colors.red
    }
    return mode_colors[vim.fn.mode()]
end

local icons = {
    sep = {
        right = "",
        left = ""
    },
    diagnostic = {
        error = " ",
        warn = " ",
        info = " "
    },
    diff = {
        add = " ",
        modified = " ",
        remove = " "
    },
    git = "",
    file = {
        read_only = '',
        modified = ''
    }
}

local white_space = function()
    return ' '
end

local function file_name(is_active, highlight_group)
    normal_fg = is_active and colors.fg or colors.grey
    modified_fg = is_active and colors.red or colors.orange
    if vim.bo.modifiable then
        if vim.bo.modified then
            vim.api.nvim_command('hi ' .. highlight_group .. ' guifg=' .. modified_fg)
        else
            vim.api.nvim_command('hi ' .. highlight_group .. ' guifg=' .. normal_fg)
        end
    end
    return fileinfo.get_current_file_name(icons.file.modified, icons.file.read_only)
end

-- --------------------------------------Left side-----------------------------------------------------------
local i = 1
gls.left[i] = {
    FirstElement = {
        provider = function()
            return icons.sep.right
        end,
        highlight = {colors.cyan, colors.bg}
    }
}

i = i + 1
gls.left[i] = {
    Logo = {
        provider = function()
            return '   '
        end,
        highlight = {colors.bg, colors.cyan}
    }
}

i = i + 1
gls.left[i] = {
    ViMode = {
        provider = function()
            local alias = {
                n = 'NORMAL ',
                i = 'INSERT ',
                c = 'COMMAND',
                V = 'VISUAL ',
                [''] = 'VISUAL ',
                v = 'VISUAL ',
                R = 'REPLACE'
            }
            if (alias[vim.fn.mode()] == nil or alias[vim.fn.mode()] == '') then
              return ""
            else 
              vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color() .. ' gui=bold')
              return '  ' .. alias[vim.fn.mode()]
            end
        end,
        highlight = {colors.bg, colors.bg},
        separator = icons.sep.left,
        separator_highlight = {colors.bg, colors.section_bg}
    }
}

i = i + 1
gls.left[i] = {
    FileIcon = {
        provider = {white_space, 'FileIcon'},
        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg}
    }
}

i = i + 1
gls.left[i] = {
    MyFileName = {
        provider = function()
            return file_name(true, 'GalaxyMyFileName')
        end,
        highlight = {colors.fg, colors.section_bg},
        separator = icons.sep.left .. ' ',
        separator_highlight = {colors.section_bg, colors.bg}
    }
}

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end

i = i + 1
gls.left[i] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = icons.diff.add,
        highlight = {colors.green, colors.line_bg}
    }
}

i = i + 1
gls.left[i] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = icons.diff.modified,
        highlight = {colors.blue, colors.line_bg}
    }
}

i = i + 1
gls.left[i] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = icons.diff.remove,
        highlight = {colors.red, colors.line_bg}
    }
}

i = i + 1
gls.left[i] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = icons.diagnostic.error,
        highlight = {colors.red, colors.bg}
    }
}

i = i + 1
gls.left[i] = {
    Space = {
        provider = white_space,
        highlight = {colors.bg, colors.bg}
    }
}

i = i + 1
gls.left[i] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = icons.diagnostic.warn,
        highlight = {colors.orange, colors.bg}
    }
}

i = i + 1
gls.left[i] = {
    Space = {
        provider = white_space,
        highlight = {colors.bg, colors.bg}
    }
}

i = i + 1
gls.left[i] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = icons.diagnostic.info,
        highlight = {colors.blue, colors.bg}
    }
}

-- ------------------------------------Right side-----------------------------------------------------
local j = 1
gls.right[j] = {
    FirstSeparator = {
        provider = function()
            return icons.sep.right
        end,
        highlight = {colors.section_bg, colors.bg}
    }
}

j = j + 1
gls.right[j] = {
    time = {
        provider = function()
            return ' ' .. '  ' .. os.date('%H:%M') .. ' '
        end,
        highlight = {colors.fg, colors.section_bg}
    }
}

j = j + 1
gls.right[j] = {
    GitIcon = {
        provider = function()
            return "  "
        end,
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.green, colors.bg},
        separator = icons.sep.right,
        separator_highlight = {colors.bg, colors.section_bg}
    }
}

j = j + 1
gls.right[j] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.green, colors.bg}
    }
}

j = j + 1
gls.right[j] = {
    LastElement = {
        provider = function()
            return " "
        end,
        separator = " ",
        highlight = {colors.cyan, colors.cyan}
    }
}

-- -------------------------Short status line---------------------------------------
local k = 1
gls.short_line_left[k] = {
    SFirstElement = {
        provider = function()
            return icons.sep.right
        end,
        highlight = {colors.grey, colors.bg},
        separator = icons.sep.left,
        separator_highlight = {colors.bg, colors.bg}
    }
}

k = k + 1
gls.short_line_left[k] = {
    SFileIcon = {
        provider = 'FileIcon',
        highlight = {colors.grey, colors.bg}
    }
}

k = k + 1
gls.short_line_left[k] = {
    SMyFileName = {
        provider = function()
            return file_name(false, 'GalaxySMyFileName')
        end,
        highlight = {colors.grey, colors.bg},
        separator = icons.sep.left,
        separator_highlight = {colors.bg, colors.bg}
    }
}

k = k + 1
gls.short_line_right[k] = {
    SLastElement = {
        provider = function()
            return icons.sep.left
        end,
        highlight = {colors.grey, colors.bg}
    }
}
