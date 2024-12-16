require("render-markdown").setup({
  enabled = true,
  render_modes = true,
  heading = {
    sign = true,
    signs = { '󰉫 ', '󰉬 ', '󰉭 ', '󰉮 ', '󰉯 ', '󰉰 ' },
    icons = { '', '', '', '', '', '' },
    width = 'full',
    position = 'inline',
    backgrounds = {},
  },
  code = {
    enabled = true,
    sign = false,
    border = 'none',
    style = 'language',
    position = 'left',
    language_pad = 2,
    language_name = true,
    disable_background = true,
    width = 'full',
    left_pad = 2,
    highlight_inline = 'GruvboxBlueBold',
  },
  pipe_table = {
    enabled = true,
    preset = 'round',
    head = 'RenderMarkdownTableRow'
  },
  bullet = {
    enabled = false
  }
})
