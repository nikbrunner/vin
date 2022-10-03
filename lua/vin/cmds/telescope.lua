local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
    return
end

local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
    return
end

local builtin = require("telescope.builtin")
local themes = require("telescope.themes")
local previewers = require("telescope.previewers")
local conf = require("telescope.config")

local use_notification = function(message)
    notify(message, "info", {
        title = "Telescope",
        icon = "",
    })
end

local delta_previewer = previewers.new_termopen_previewer({
    get_command = function(entry)
        -- this is for status
        -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
        -- just do an if and return a different command
        if entry.status == "??" or "A " then
            return {
                "git",
                "-c",
                "core.pager=delta",
                "-c",
                "delta.side-by-side=false",
                "diff",
                entry.value,
            }
        end

        -- note we can't use pipes
        -- this command is for git_commits and git_bcommits
        return {
            "git",
            "-c",
            "core.pager=delta",
            "-c",
            "delta.side-by-side=false",
            "diff",
            entry.value .. "^!",
        }
    end,
})

local hard_corner_window = function()
    return {
        { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
        results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
        preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    }
end

local no_preview = function()
    return themes.get_dropdown({
        borderchars = hard_corner_window(),
        width = 0.8,
        previewer = false,
        prompt_title = false,
    })
end

Vin.cmds.telescope = {}

Vin.cmds.telescope.find_files_without_preview = function()
    builtin.find_files(no_preview())
end

Vin.cmds.telescope.find_files_with_preview = function()
    builtin.find_files()
end

Vin.cmds.telescope.find_in_file = function()
    builtin.current_buffer_fuzzy_find(themes.get_ivy({}))
end

Vin.cmds.telescope.find_text = function()
    builtin.live_grep(themes.get_ivy({}))
end

Vin.cmds.telescope.find_word = function()
    local curr_word = vim.fn.expand("<cword>")
    builtin.grep_string(themes.get_ivy({ default_text = curr_word }))
end

Vin.cmds.telescope.find_in_quickfix = function()
    builtin.quickfix(themes.get_ivy({}))
end

Vin.cmds.telescope.find_symbols_in_workspace = function()
    builtin.lsp_dynamic_workspace_symbols(themes.get_ivy({}))
end

Vin.cmds.telescope.find_changed_files = function(opts)
    builtin.git_status({
        previewer = delta_previewer,
    })
end

Vin.cmds.telescope.find_commits = function(opts)
    builtin.git_commits({
        previewer = delta_previewer,
    })
end

Vin.cmds.telescope.find_related_files = function()
    local current_filename = Vin.cmds.general.get_current_filename()

    if current_filename then
        builtin.find_files(themes.get_ivy({
            default_text = current_filename,
        }))
    else
        builtin.find_files(themes.get_ivy())
    end
end

Vin.cmds.telescope.find_files_in_config = function(opts)
    local path = "~/.config"

    opts = opts or {}
    opts.cwd = path

    builtin.find_files(opts)
end

Vin.cmds.telescope.find_files_in_work_notes = function(opts)
    local notes = "~/Documents/notes/dcd-notes"

    opts = opts or {}
    opts.cwd = opts.cwd or notes

    builtin.find_files(opts)
end

Vin.cmds.telescope.find_open_buffer = function()
    builtin.buffers(themes.get_dropdown({}))
end

Vin.cmds.telescope.find_scss_symbol = function()
    local curr_word = vim.fn.expand("<cword>")

    local Symbol = {
        Variable = "variable",
        Mixin = "mixin",
    }

    local Action = {
        GoToDefinition = "go_to_definition",
        ListReferences = "list_references",
    }

    -- TODO: Build custom picker
    local use_telescope = function(text)
        builtin.grep_string({
            default_text = text,
            path_display = { "truncate" },
            -- layout_strategy = "vertical",
            layout_config = {
                width = 0.90,
                height = 0.90,
            },
            -- preview_height = 0.25,
            -- preview_cutoff = 20,
            -- mirror = true,
        })
    end

    ---@param action_callback function
    local handleSelectAction = function(action_callback)
        vim.ui.select({
            Action.GoToDefinition,
            Action.ListReferences,
        }, {
            prompt = "What do you want to do with " .. curr_word .. "?",
            format_item = function(item)
                if item == Action.GoToDefinition then
                    return "Go to definition"
                elseif item == Action.ListReferences then
                    return "List references"
                end
            end,
        }, function(action)
            action_callback(action)
        end)
    end

    ---@param symbol_type string
    local handleSelectSymbol = function(symbol_type)
        -- SCSS Variables
        if symbol_type == Symbol.Variable then
            handleSelectAction(function(action)
                if action == Action.GoToDefinition then
                    use_telescope("$" .. curr_word .. ": ")
                    use_notification(
                        "Looking for variable defintion of '" .. curr_word .. "'"
                    )
                elseif action == Action.ListReferences then
                    use_telescope("$" .. curr_word)
                    use_notification(
                        "Looking for variable references of '" .. curr_word .. "'"
                    )
                end
            end)

            -- SCSS Mixin
        elseif symbol_type == Symbol.Mixin then
            handleSelectAction(function(action)
                if action == Action.GoToDefinition then
                    use_telescope("@mixin " .. curr_word)
                    use_notification(
                        "Looking for mixin definition of '" .. curr_word .. "'"
                    )
                elseif action == Action.ListReferences then
                    use_telescope("@include " .. curr_word)
                    use_notification(
                        "Looking for mixin references for '" .. curr_word .. "'"
                    )
                end
            end)
        end
    end

    vim.ui.select({ Symbol.Mixin, Symbol.Variable }, {
        prompt = "What is '" .. curr_word .. "'?",
        format_item = function(item)
            if item == Symbol.Variable then
                return "$" .. item
            elseif item == Symbol.Mixin then
                return "@" .. item
            end
        end,
    }, handleSelectSymbol)
end

-- Find project folders with telescope extension
Vin.cmds.telescope.find_projects = function()
    telescope.extensions.project.project()
end

-- Go to definition
Vin.cmds.telescope.go_to_definition = function()
    builtin.lsp_definitions(themes.get_ivy())
end

-- List references
Vin.cmds.telescope.list_references = function()
    builtin.lsp_references(themes.get_ivy())
end

-- Find document symbols with aerial
-- Vin.cmds.telescope.find_symbol_with_aerial = function()
-- 	telescope.extensions.aerial.aerial(themes.get_ivy())
-- end

Vin.cmds.telescope.find_spelling = function()
    builtin.spell_suggest(no_preview())
end

Vin.cmds.telescope.find_colorscheme = function()
    builtin.colorscheme(no_preview())
end

Vin.cmds.telescope.find_oldfiles = function()
    builtin.oldfiles(no_preview())
end

Vin.cmds.telescope.find_commands = function()
    builtin.commands()
end

Vin.cmds.telescope.find_marks = function()
    builtin.marks(themes.get_ivy())
end
