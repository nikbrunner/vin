local M = {}

-- ISSUE: Daily Note functions does not create notes when it does not exist.
-- ISSUE: It should respect existing frontmatter.
--        I think this is handled in here: /Users/nikolausbrunner/.local/share/vin/lazy/obsidian.nvim/lua/obsidian/note.lua
--        `note.metadata` seems to be nil when i edit a note which was not seen before by obsidian.nvim

---@param config VinConfig
---@return table<string, table<string, string>>
M.workspaces = function(config)
    return {
        {
            name = "Personal",
            path = config.pathes.notes.personal,
        },
        {
            name = "Work [DCD]",
            path = config.pathes.notes.work.dcd,
        },
    }
end

---@type LazySpec
M.spec = {
    "epwalsh/obsidian.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    enabled = false,
    version = "*",
    event = function()
        local config = require("vin.config")

        return {
            "BufReadPre " .. config.pathes.notes.personal .. "/**.md",
            "BufNewFile " .. config.pathes.notes.personal .. "/**.md",
            "BufReadPre " .. config.pathes.notes.work.dcd .. "/**.md",
            "BufNewFile " .. config.pathes.notes.work.dcd .. "/**.md",
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
        {
            "<leader>ow",
            function()
                local choices = {}

                for _, workspace in ipairs(M.workspaces(require("vin.config"))) do
                    table.insert(choices, workspace.name)
                end

                vim.ui.select(choices, {
                    prompt = "Select Workspace",
                }, function(selected_workspace)
                    if selected_workspace == nil then
                        return
                    else
                        vim.cmd("ObsidianWorkspace " .. selected_workspace)
                    end
                end)
            end,
            desc = "Open Workspace",
        },
        -- {
        --     "<leader>oJ",
        --     function()
        --         local config = require("vin.config")
        --         local lib = require("vin.lib")
        --         local current_path = vim.fn.expand("%:p:h")
        --         local current_date = os.date("%y.%m.%d — %A")
        --
        --         ---@diagnostic disable-next-line: param-type-mismatch
        --         if string.find(current_path, "dealercenter-digital", 1, true) then
        --             local todays_note = config.pathes.notes.work.dcd .. "/logs/" .. current_date .. ".md"
        --             lib.open.open_file_in_floating_window(todays_note)
        --         else
        --             local todays_note = config.pathes.notes.personal .. "/Agenda/" .. current_date .. ".md"
        --             lib.open.open_file_in_floating_window(todays_note)
        --         end
        --     end,
        --     desc = "Open Today's Note",
        -- },
    },
    opts = function()
        local terra_colors = require("black-atom-core.api").get_colors()
        local config = require("vin.config")

        return {
            workspaces = M.workspaces(config),

            -- Optional, customize how names/IDs for new notes are created.
            note_id_func = function(title)
                -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
                -- In this case a note with the title 'My new note' will be given an ID that looks
                -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
                local suffix = ""
                if title ~= nil then
                    -- If title is given, transform it into valid file name.
                    suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                    -- If title is nil, just add 4 random uppercase letters to the suffix.
                    for _ = 1, 4 do
                        suffix = suffix .. string.char(math.random(65, 90))
                    end
                end
                return tostring(os.time()) .. "-" .. suffix
            end,

            -- Optional, boolean or a function that takes a filename and returns a boolean.
            -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
            disable_frontmatter = true,

            -- Optional, alternatively you can customize the frontmatter data.
            note_frontmatter_func = function(note)
                -- This is equivalent to the default frontmatter function.
                local out = { id = note.id, aliases = note.aliases, tags = note.tags }
                -- `note.metadata` contains any manually added fields in the frontmatter.
                -- So here we just make sure those fields are kept in the frontmatter.
                if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end
                return out
            end,

            -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
            completion = {
                new_notes_location = "notes_subdir",
                use_path_only = true,
            },

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

            daily_notes = {
                -- Optional, if you keep daily notes in a separate directory.
                folder = "Agenda",
                -- Optional, if you want to change the date format for the ID of daily notes.
                -- Confige os.date that it results in this format: 20.11.07 — Saturday
                date_format = "%y.%m.%d — %A",
                -- Optional, if you want to change the date format of the default alias of daily notes.
                alias_format = "%B %-d, %Y",
                -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
                template = "Templates/Templater/Agenda - Templater Simple",
            },

            -- Optional, configure additional syntax highlighting / extmarks.
            ui = {
                enable = true, -- set to false to disable all additional syntax features
                update_debounce = 200, -- update delay after a text change (in milliseconds)
                -- Define how various check-boxes are displayed
                checkboxes = {
                    -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
                    [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    ["x"] = { char = "", hl_group = "ObsidianDone" },
                    [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                    ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                },
                external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                -- Replace the above with this if you don't have a patched font:
                -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                reference_text = { hl_group = "ObsidianRefText" },
                highlight_text = { hl_group = "ObsidianHighlightText" },
                tags = { hl_group = "ObsidianTag" },
                hl_groups = {
                    -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                    ObsidianTodo = { bold = true, fg = terra_colors.palette.gray },
                    ObsidianDone = { bold = true, fg = terra_colors.palette.green },
                    ObsidianRightArrow = { bold = true, fg = terra_colors.palette.yellow },
                    ObsidianTilde = { bold = true, fg = terra_colors.palette.red },
                    ObsidianRefText = { underline = true, fg = terra_colors.palette.dark_magenta },
                    ObsidianExtLinkIcon = { fg = terra_colors.palette.magenta },
                    ObsidianTag = {
                        italic = true,
                        fg = terra_colors.palette.black,
                        bg = terra_colors.palette.cyan,
                    },
                    ObsidianHighlightText = { bg = terra_colors.semantics.bg.match.active },
                },
            },
        }
    end,

    config = function(_, opts)
        require("obsidian").setup(opts)

        vim.api.nvim_create_autocmd({
            "BufReadPre",
            "BufNewFile",
        }, {
            group = vim.api.nvim_create_augroup("vin_obsidian", { clear = true }),
            pattern = {
                require("vin.config").pathes.notes.personal .. "/**.md",
                require("vin.config").pathes.notes.work.dcd .. "/**.md",
            },
            callback = function()
                -- Set conceallevel to 1 to make the checkboxes work
                vim.opt.conceallevel = 1
            end,
        })
    end,
}

return M.spec
