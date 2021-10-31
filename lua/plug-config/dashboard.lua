local USER_CONFIG_PATH = "~/.config/nvim"

local options = {
  dashboard_default_executive = "telescope",
  dashboard_custom_header = { "nibru.nvim" },
  dashboard_custom_footer = { "https://nibru.dev" },
  dashboard_custom_section = {
    a = {
      description = { "   Recent Projects" },
      command = "Telescope project"
    },
    b = { description = { "   Recent Files" }, command = "Telescope oldfiles" },
    c = { description = { "   Find File" }, command = "Telescope find_files" },
    d = { description = { "   New File" }, command = "DashboardNewFile" },
    f = { description = { "   Settings" }, command = ":e " .. USER_CONFIG_PATH }
  }
}

for k, v in pairs( options ) do
  vim.g[k] = v
end
