require('image').setup {
  render = {
    min_padding = 5,
    show_label = true,
    use_dither = false,
    foreground_color = false,
    background_color = false
  },
  events = {
    update_on_nvim_resize = true,
  },
}
