require("github-theme").setup(
    {
      theme_style = "dark_default",
      hide_end_of_buffer = true,
      dark_sidebar = false,
      function_style = "italic",
      keyword_style = "italic",
      sidebars = { "qf", "vista_kind", "terminal", "packer", "lazygit" }
    }
)

vim.cmd [[colorscheme github_dark_default]]
