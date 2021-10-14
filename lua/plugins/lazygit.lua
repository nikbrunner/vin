local options = {
  lazygit_floating_window_winblend = 0,
  lazygit_floating_window_scaling_factor = 0.9,
  lazygit_floating_window_corner_chars = {'╭', '╮', '╰', '╯'},
  lazygit_use_neovim_remote = 1 
}

for k, v in pairs(options) do
  vim.g[k] = v
end
