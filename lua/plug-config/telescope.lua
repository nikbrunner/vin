local actions = require("telescope.actions")

require("telescope").setup {
  active = false,
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    -- prompt_position = "bottom",
    prompt_prefix = "   ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "flex",
    layout_config = {
      horizontal = { mirror = false },
      vertical = { mirror = false }
    },
    file_sorter = require"telescope.sorters".get_fzy_sorter,
    file_ignore_patterns = { "^.git/" },
    generic_sorter = require"telescope.sorters".get_generic_fuzzy_sorter,
    path_display = {
      -- 'shorten',
      -- 'absolute',
    },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require"telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require"telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require"telescope.previewers".vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist,
        ["<C-s>"] = actions.add_selected_to_qflist
      }
    }
  },
  pickers = {
    find_files = { theme = "dropdown", hidden = true },
    buffers = { theme = "dropdown", sort_lastused = true },
    lsp_dynamic_workspace_symbols = { theme = "dropdown" },
    current_buffer_fuzzy_find = { sorting_strategy = "ascending" }
  },
  extensions = {
    fzy_native = { override_generic_sorter = false, override_file_sorter = true },
    project = {
      base_dirs = {
        { "~/Documents/dev/repositories/", max_depth = 3 },
        hidden_files = true
      }
    }
  },
}

require("telescope").load_extension("fzy_native")
require("telescope").load_extension("project")
require("telescope").load_extension("gh")
