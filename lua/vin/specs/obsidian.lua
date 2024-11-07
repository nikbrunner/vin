local M = {}

M.daily_note_index = 0

-- ISSUE: Daily Note functions does not create notes when it does not exist.
-- ISSUE: It should respect existing frontmatter.
--        I think this is handled in here: /Users/nikolausbrunner/.local/share/vin/lazy/obsidian.nvim/lua/obsidian/note.lua
--        `note.metadata` seems to be nil when i edit a note which was not seen before by obsidian.nvim

---@type LazySpec
M.spec = {
    "epwalsh/obsidian.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    version = "*",
    event = function()
        local config = require("vin.config")

        return {
            "BufReadPre " .. config.pathes.notes.personal .. "/**.md",
            "BufNewFile " .. config.pathes.notes.personal .. "/**.md",
            "BufReadPre " .. config.pathes.notes.work.dcd .. "/**.md",
            "BufNewFile " .. config.pathes.notes.work.dcd .. "/**.md",
            "BufNewFile " .. config.pathes.notes.the_black_atom .. "/**.md",
            "BufReadPre " .. config.pathes.notes.the_black_atom .. "/**.md",
        }
    end,
    keys = {
        { "<leader>oo", "<CMD>ObsidianQuickSwitch<CR>", desc = "Quick Switch Note" },

        {
            "<leader>oj",
            function()
                M.daily_note_index = 0
                vim.notify("Today's Note: " .. M.daily_note_index)
                vim.cmd("ObsidianToday " .. M.daily_note_index)
            end,
            desc = "Open Today's Note",
        },
        {
            "<leader>on",
            function()
                vim.ui.input({
                    prompt = "Note Name: ",
                }, function(note_name)
                    if note_name == nil then
                        return
                    else
                        vim.cmd("ObsidianNew " .. note_name)
                    end
                end)
            end,
            desc = "New Note",
        },
    },
    opts = function()
        local config = require("vin.config")

        return {
            ui = {
                enable = true, -- set to false because of conflics with `markdown.nvim`
            },
            workspaces = {
                {
                    name = "Personal",
                    path = config.pathes.notes.personal,
                },
                {
                    name = "Work [DCD]",
                    path = config.pathes.notes.work.dcd,
                },
                {
                    name = "Pangea Proxima",
                    path = config.pathes.notes.the_black_atom,
                },
            },

            -- Optional, boolean or a function that takes a filename and returns a boolean.
            -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
            disable_frontmatter = true,

            mappings = {
                ["gd"] = {
                    action = function()
                        return require("obsidian").util.gf_passthrough()
                    end,
                    opts = { noremap = false, expr = true, buffer = true, desc = "Go to file" },
                },
                ["<cr>"] = {
                    action = function()
                        return require("obsidian").util.smart_action()
                    end,
                    opts = { buffer = true, expr = true },
                },
                ["<C-CR>"] = {
                    action = function()
                        return require("obsidian").util.toggle_checkbox()
                    end,
                    opts = { buffer = true, desc = "Toggle Checkbox" },
                },
                ["<leader>oh"] = {
                    action = function()
                        M.daily_note_index = M.daily_note_index - 1
                        vim.notify("Prev Daily Note: " .. M.daily_note_index)
                        vim.cmd("ObsidianToday " .. M.daily_note_index)
                    end,
                    opts = { buffer = true, expr = true },
                },
                ["<leader>ol"] = {
                    action = function()
                        M.daily_note_index = M.daily_note_index + 1
                        vim.notify("Next Daily Note: " .. M.daily_note_index)
                        vim.cmd("ObsidianToday " .. M.daily_note_index)
                    end,
                    opts = { buffer = true, expr = true },
                },
            },

            templates = {
                folder = "Templates",
                date_format = "%y.%m.%d - %A",
            },

            daily_notes = {
                folder = "Log/2024",
                date_format = "%y.%m.%d - %A",
                template = "Templates/Daily Note.md",
            },

            picker = {
                -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
                name = "fzf-lua",
            },

            -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
            open_app_foreground = true,
        }
    end,

    config = function(_, opts)
        require("obsidian").setup(opts)
    end,
}

return M.spec
