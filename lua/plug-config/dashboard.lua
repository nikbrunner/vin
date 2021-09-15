local USER_CONFIG_PATH = "~/.config/nvim"

vim.g.dashboard_default_executive ='telescope'
vim.g.dashboard_custom_header = { "nibru.nvim" }
vim.g.dashboard_custom_footer = { "https://nibru.dev" }
vim.g.dashboard_custom_section = {
  a = {
    description = { "  Recent Projects" },
    command = "Telescope projects",
  },
  b = {
    description = { "  Recent Files" },
    command = "Telescope oldfiles",
  },
  c = {
    description = { "  Find File" },
    command = "Telescope find_files",
  },
  d = {
    description = { "  New File" },
    command = "DashboardNewFile",
  },
  f = {
    description = { "  Settings" },
    command = ":e " .. USER_CONFIG_PATH,
  },
}
