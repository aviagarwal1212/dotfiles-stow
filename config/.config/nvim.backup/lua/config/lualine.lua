local custom_gruvbox = require("lualine.themes.gruvbox_dark")
local colorscheme = require("lualine.themes.gruvbox_dark")
local primaries = require("lualine.themes.OceanicNext")
local primaries_fallback = require("lualine.themes.horizon")


--- Section A
--- normal
custom_gruvbox.normal.a.fg = primaries_fallback.normal.a.bg
custom_gruvbox.normal.a.bg = colorscheme.replace.c.bg
--- visual
custom_gruvbox.visual.a.fg = primaries.visual.a.bg
custom_gruvbox.visual.a.bg = colorscheme.replace.c.bg
--- insert
custom_gruvbox.insert.a.fg = primaries.insert.a.bg
custom_gruvbox.insert.a.bg = colorscheme.replace.c.bg
--- replace
custom_gruvbox.replace.a.fg = primaries.replace.a.bg
custom_gruvbox.replace.a.bg = colorscheme.replace.c.bg
--- command
custom_gruvbox.command.a = custom_gruvbox.normal.a
--- Section B
custom_gruvbox.normal.b = colorscheme.replace.c
custom_gruvbox.visual.b = colorscheme.replace.c
custom_gruvbox.insert.b = colorscheme.replace.c
custom_gruvbox.replace.b = colorscheme.replace.c
custom_gruvbox.command.b = colorscheme.replace.c
--- Section C
custom_gruvbox.normal.c = colorscheme.replace.c
custom_gruvbox.visual.c = colorscheme.replace.c
custom_gruvbox.insert.c = colorscheme.replace.c
custom_gruvbox.command.c = colorscheme.replace.c
--- Section X
custom_gruvbox.normal.x = colorscheme.replace.c
custom_gruvbox.visual.x = colorscheme.replace.c
custom_gruvbox.insert.x = colorscheme.replace.c
custom_gruvbox.replace.x = colorscheme.replace.c
custom_gruvbox.command.x = colorscheme.replace.c
--- Section Y
custom_gruvbox.normal.y = colorscheme.replace.c
custom_gruvbox.visual.y = colorscheme.replace.c
custom_gruvbox.insert.y = colorscheme.replace.c
custom_gruvbox.replace.y = colorscheme.replace.c
custom_gruvbox.command.y = colorscheme.replace.c
--- Section Z
custom_gruvbox.normal.z = custom_gruvbox.normal.a
custom_gruvbox.visual.z = custom_gruvbox.visual.a
custom_gruvbox.insert.z = custom_gruvbox.insert.a
custom_gruvbox.replace.z = custom_gruvbox.replace.a
custom_gruvbox.command.z = custom_gruvbox.command.a


require('lualine').setup({
  options = {
    theme = custom_gruvbox,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },

  sections = {
    lualine_a = { { 'mode', fmt = function(str) return str:lower() end } },
    lualine_b = {},
    lualine_c = { {
      'filename',
      path = 1,
      symbols = { modified = '●', readonly = '#', unnamed = 'SCRATCH', newfile = ' ●' },
    } },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
      },
    },
    lualine_y = { { 'branch', icons_enabled = false } },
    lualine_z = { 'searchcount', 'selectioncount' }
  },

  extensions = { 'quickfix', 'fzf', 'lazy', 'man' }
})
