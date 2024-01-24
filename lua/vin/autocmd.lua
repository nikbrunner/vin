local create_autocmd = vim.api.nvim_create_autocmd
local config = require("vin.config")

local function augroup(name)
    return vim.api.nvim_create_augroup("vin_" .. name, { clear = true })
end

create_autocmd("UIEnter", {
    group = augroup("ui_enter"),
    callback = function()
        vim.cmd.colorscheme(config.colorscheme)

        local filetype = vim.bo.filetype
        local excluded_filetypes = { "gitcommit" }

        if not vim.tbl_contains(excluded_filetypes, filetype) then
            if pcall(require, "fzf-lua") then
                require("fzf-lua").oldfiles({ cwd_only = true })
            end
        end
    end,
})

-- Close these filetypes with <Esc> in normal mode
create_autocmd("FileType", {
    group = augroup("quit_mapping"),
    pattern = {
        "qf",
        "help",
        "man",
        "notify",
        "lspinfo",
        "neo-tree",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "PlenaryTestPopup",
        "diagmsg",
        "chatpgpt",
        "fzf",
        "aerial-nav",
        "dropbar_menu",
        "bmessages_buffer",
        "ftterm_lazygit",
        "ftterm_gh_dash",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
        vim.keymap.set("n", "<ESC>", "<cmd>close<CR>", { buffer = event.buf, silent = true })
    end,
})

-- go to last loc when opening a buffer
create_autocmd("BufReadPost", {
    group = augroup("last_loc"),
    callback = function(event)
        local exclude = { "gitcommit" }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
            return
        end
        vim.b[buf].lazyvim_last_loc = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- On every buff enter and refocus refresh neotree
create_autocmd("BufWrite", {
    group = augroup("neotree_refresh"),
    pattern = { "*" },
    callback = function()
        if pcall(require, "neo-tree") then
            require("neo-tree.sources.manager").refresh()
        end
    end,
})

-- Check if we need to reload the file when it changed
create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = augroup("checktime"),
    command = "checktime",
})

-- Highlight on yank
create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- resize splits if window got resized
create_autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("wezterm_colorscheme", { clear = true }),
    callback = function(args)
        local wezterm_config_filepath = vim.fn.expand("$XDG_CONFIG_HOME/wezterm/wezterm.lua")
        local vin_config_filepath = vim.fn.expand("$XDG_CONFIG_HOME/vin/lua/vin/config.lua")

        ---@class ColorschemeConfig
        ---@field name string
        ---@field background string

        ---TODO: handle coloreschemes for which wezterm uses the default background
        ---https://wezfurlong.org/wezterm/colorschemes/index.html
        ---@type table<string, ColorschemeConfig>
        local neovim_wezterm_colorconfig_map = {
            ["terra_spring_night"] = { name = "Gruvbox Material (Gogh)", background = "#212523" },
            ["terra_summer_night"] = { name = "Ayu Mirage", background = "#1f2129" },
            ["terra_fall_night"] = { name = "Gruvbox Material (Gogh)", background = "#252221" },
            ["terra_winter_night"] = { name = "terafox", background = "#23272D" },
        }

        local neovim_colorscheme = args.match
        local wezterm_colors_config = neovim_wezterm_colorconfig_map[neovim_colorscheme]

        if not wezterm_colors_config then
            return
        end

        ---Finds a pattern in a line of a file and replaces it with a value
        ---@param filepath string
        ---@param pattern string
        ---@param value string
        local function update_config_file(filepath, pattern, value)
            local lines = vim.fn.readfile(filepath)
            lines = vim.tbl_map(function(line)
                if vim.fn.match(line, pattern) ~= -1 then
                    line = vim.fn.substitute(line, '".*"', value, "")
                end
                return line
            end, lines)

            vim.fn.writefile(lines, filepath)
        end

        update_config_file(wezterm_config_filepath, "color_scheme", '"' .. wezterm_colors_config.name .. '"')
        update_config_file(vin_config_filepath, "colorscheme", '"' .. neovim_colorscheme .. '"')
        update_config_file(wezterm_config_filepath, "background", '"' .. wezterm_colors_config.background .. '"')
    end,
})
