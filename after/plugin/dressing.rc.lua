local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
    return
end

dressing.setup({
    input = {
        -- Set to false to disable the vim.ui.input implementation
        enabled = true,

        -- Default prompt string
        default_prompt = " ",

        -- Can be 'left', 'right', or 'center'
        prompt_align = "center",

        -- When true, <Esc> will close the modal
        insert_only = true,

        -- These are passed to nvim_open_win
        anchor = "SW",
        relative = "win",
        border = "rounded",

        -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        prefer_width = 40,
        max_width = nil,
        min_width = 20,

        -- Window transparency (0-100)
        winblend = 10,
        -- Change default highlight groups (see :help winhl)
        winhighlight = "",

        -- see :help dressing_get_config
        get_config = nil,
    },
    select = {
        -- Set to false to disable the vim.ui.select implementation
        enabled = true,

        -- Priority list of preferred vim.select implementations
        backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

        telescope = require("telescope.themes").get_ivy(),

        -- Options for fzf selector
        fzf = {
            window = {
                width = 0.5,
                height = 0.4,
            },
        },

        -- Options for fzf_lua selector
        fzf_lua = {
            winopts = {
                width = 0.5,
                height = 0.4,
            },
        },

        -- Options for nui Menu
        nui = {
            position = "50%",
            size = nil,
            relative = "editor",
            border = {
                style = "rounded",
            },
            max_width = 80,
            max_height = 40,
        },

        -- Options for built-in selector
        builtin = {
            -- These are passed to nvim_open_win
            anchor = "NW",
            relative = "cursor",
            border = "rounded",

            -- Window transparency (0-100)
            winblend = 10,
            -- Change default highlight groups (see :help winhl)
            winhighlight = "",

            -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            width = nil,
            max_width = 0.8,
            min_width = 40,
            height = nil,
            max_height = 0.9,
            min_height = 10,
        },
        -- Used to override format_item. See :help dressing-format
        format_item_override = {
            -- codeaction = function(action_tuple)
            -- local title = action_tuple[2].title:gsub("\r\n", "\\r\\n")
            -- local client = vim.lsp.get_client_by_id(action_tuple[1])
            -- return string.format(
            -- 	"%s\t[%s]",
            -- 	title:gsub("\n", "\\n"),
            -- 	client.name
            -- )
            -- end,
        },

        -- see :help dressing_get_config
        get_config = function(opts)
            if opts.kind == "codeaction" then
                return {
                    backend = "telescope",
                    telescope = require("telescope.themes").get_cursor(),
                }
            elseif opts.prompt == "Load Session" then
                return {
                    backend = "telescope",
                    telescope = require("telescope.themes").get_dropdown(),
                }
            end
        end,
    },
})
