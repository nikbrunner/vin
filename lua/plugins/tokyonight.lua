-- Example config in Lua
local options = {
  tokyonight_style = "night",
  -- tokyonight_transparent = true,
  tokyonight_italic_variables = false,
  tokyonight_italic_comments = true,
  tokyonight_italic_keywords = true,
  tokyonight_italic_functions = false,
  tokyonight_dark_sidebar = true,
  tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
}

for k, v in pairs(options) do
  vim.g[k] = v
end

vim.cmd[[colorscheme tokyonight]]

