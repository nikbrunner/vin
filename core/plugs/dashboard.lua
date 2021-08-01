local USER_CONFIG_PATH = "~/.config/nvim"

vim.g.dashboard_default_executive ='telescope'
vim.g.dashboard_custom_header = { "nibru.vim" }
vim.g.dashboard_custom_section = {
  a = {
    description = { "  New File" },
    command = "DashboardNewFile",
  },
  b = {
    description = { "  Find File            <C-p>" },
    command = "Telescope find_files",
  },
  c = {
    description = { "  Recently Used Files  <C-y>" },
    command = "Telescope oldfiles",
  },
  d = {
    description = { "  Find Word            <C-f>" },
    command = "Telescope live_grep",
  },
  e = {
    description = { "  Last Session     <Space>sl" },
    command = "SessionLoad",
  },
  f = {
    description = { "  Settings" },
    command = ":e " .. USER_CONFIG_PATH,
  },
}

vim.g.dashboard_custom_footer = { "https://nibru.dev" }
