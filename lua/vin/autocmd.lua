local create_autocmd = vim.api.nvim_create_autocmd

local M = {}

function M.augroup(name)
    return vim.api.nvim_create_augroup("vin_" .. name, { clear = true })
end

function M.open_previous_files()
    local filetype = vim.bo.filetype
    local excluded_filetypes = { "gitcommit" }

    if not vim.list_contains(excluded_filetypes, filetype) then
        require("fzf-lua").oldfiles({
            cwd_only = true,
            winopts = {
                row = 0.85,
                col = 0.5,
                height = 0.25,
                width = 0.65,
                preview = { hidden = "hidden" },
            },
        })
    end
end

create_autocmd("UIEnter", {
    group = M.augroup("ui_enter"),
    callback = function()
        local config = require("vin.config")

        require("vin.lib.ui").handle_colors(config, config.colorscheme, config.background)

        if config.open_previous_files_on_startup then
            if not pcall(require, "fzf-lua") then
                print("Fzf-lua is not installed")
                return
            end

            M.open_previous_files()
        end

        if config.open_neotree_on_startup then
            if not pcall(require, "neo-tree") then
                print("NeoTree is not installed")
                return
            end

            local is_git_dir = vim.fn.finddir(".git", vim.fn.expand("%:p:h") .. ";") ~= ""
            local has_uncommited_changes = vim.fn.system("git status --porcelain") ~= ""

            if is_git_dir and has_uncommited_changes then
                require("neo-tree.command").execute({
                    action = "focus",
                    source = "git_status",
                    position = "float",
                })
            end
        end
    end,
})

create_autocmd("ColorScheme", {
    group = M.augroup("colorscheme_sync"),
    callback = function(args)
        local config = require("vin.config")
        local colorscheme = args.match
        ---@diagnostic disable-next-line: undefined-field
        local background = vim.opt.background:get()
        require("vin.lib.ui").handle_colors(config, colorscheme, background)
    end,
})

-- Close these filetypes with <Esc> & q in normal mode
create_autocmd("FileType", {
    group = M.augroup("quit_mapping"),
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
    group = M.augroup("last_loc"),
    callback = function(event)
        local exclude = { "gitcommit" }
        local buf = event.buf
        if vim.list_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
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

-- Check if we need to reload the file when it changed
create_autocmd({ "BufEnter", "FocusGained", "TermClose", "TermLeave" }, {
    group = M.augroup("checktime"),
    callback = function()
        vim.cmd("checktime")
        require("gitsigns").refresh()
    end,
})

-- Highlight on yank
create_autocmd("TextYankPost", {
    group = M.augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- resize splits if window got resized
create_autocmd({ "VimResized" }, {
    group = M.augroup("resize_splits"),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})
