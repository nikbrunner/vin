local M = {}

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
    enabled = true,
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
        { "<leader>oj", "<CMD>ObsidianToday<CR>", desc = "Open Today's Note" },
        { "<leader>oh", "<CMD>ObsidianYesterday<CR>", desc = "Open Yesterday's Note" },
        { "<leader>ol", "<CMD>ObsidianTomorrow<CR>", desc = "Open Tomorrow's Note" },
        { "<leader>oo", "<CMD>ObsidianQuickSwitch<CR>", desc = "Quick Switch Note" },
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
                ["<leader>oc"] = {
                    action = function()
                        return require("obsidian").util.toggle_checkbox()
                    end,
                    opts = { buffer = true, desc = "Toggle Checkbox" },
                },
            },

            templates = {
                folder = "Templates",
                date_format = "%y.%m.%d - %A",
            },

            daily_notes = {
                -- Optional, if you keep daily notes in a separate directory.
                folder = "Log/2024",
                -- Optional, if you want to change the date format for the ID of daily notes.
                -- Confige os.date that it results in this format: 20.11.07 — Saturday
                date_format = "%y.%m.%d - %A",
                -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
                template = "Templates/Daily Note - Templater.md",
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
        print("loaded")
        require("obsidian").setup(opts)
    end,
}

return M.spec
