local options = {
				nvim_tree_ignore = { '.git', 'node_modules', '.cache' },
				nvim_tree_gitignore = 0,
				nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' },
				nvim_tree_quit_on_open = 0,
				nvim_tree_indent_markers = 0,
				nvim_tree_hide_dotfiles = 0,
				nvim_tree_git_hl = 0,
				nvim_tree_root_folder_modifier = ':~',
				nvim_tree_width_allow_resize = 0,
				nvim_tree_add_trailing = 0,
				nvim_tree_group_empty = 0,
				nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' }
}

for k, v in pairs(options) do
				vim.g[k] = v
end

require"nvim-tree".setup {
				disable_netrw = false,
				hijack_netrw = false,
				lsp_diagnostics = false,
				open_on_setup = true,
				auto_close = false,
				tab_open = false,
				update_focused_file = {
								enable = true
				},
				view = {
								width = 50
				}
}

