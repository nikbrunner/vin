require('bufferline').setup {
  options = {
    view = "default",
    numbers = "ordinal",
    number_style = "superscript", -- buffer_id at index 1, ordinal at index 2
    mappings = false,
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is deduplicated
    tab_size = 18,
    show_tab_indicators = true,
    show_buffer_close_icons = true,
    separator_style = "thick",
    always_show_bufferline = false,
  }
}
