return {
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        dir = "~/Documents/notes/notes", -- no need to call 'vim.fn.expand' here

        -- Optional, if you keep daily notes in a separate directory.
        daily_notes = {
            folder = "Agenda",
        },

        -- Optional, completion.
        completion = {
            nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
        },

        -- Optional, customize how names/IDs for new notes are created.
        -- Optional, for templates (see below).
        templates = {
            subdir = "Templates",
            date_format = "YY.MM.DD — dddd",
            time_format = "HH:mm",
        },

        -- Optional, customize how names/IDs for new notes are created.
        note_id_func = function(title)
            return title
        end,

        finder = "telescope.nvim",
    },
    config = function(_, opts)
        require("obsidian").setup(opts)

        -- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
        -- see also: 'follow_url_func' config option above.
        vim.keymap.set("n", "gf", function()
            if require("obsidian").util.cursor_on_markdown_link() then
                return "<cmd>ObsidianFollowLink<CR>"
            else
                return "gf"
            end
        end, { noremap = false, expr = true })
    end,
}
