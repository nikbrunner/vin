local options = {
  nvim_tree_width = 50,
  nvim_tree_ignore = { '.git', 'node_modules', '.cache' },
  nvim_tree_gitignore = 0,
  nvim_tree_auto_open = 1,
  nvim_tree_auto_close = 0,
  nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' },
  nvim_tree_quit_on_open = 0,
  nvim_tree_follow = 1,
  nvim_tree_indent_markers = 0,
  nvim_tree_hide_dotfiles = 0,
  nvim_tree_git_hl = 0,
  nvim_tree_root_folder_modifier = ':~',
  nvim_tree_tab_open = 0,
  nvim_tree_width_allow_resize = 0,
  nvim_tree_disable_netrw = 1,
  nvim_tree_hijack_netrw = 1,
  nvim_tree_add_trailing = 0,
  nvim_tree_group_empty = 0,
  nvim_tree_lsp_diagnostics = 0,
  nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' }
}

for k, v in pairs(options) do
  vim.g[k] = v
end

