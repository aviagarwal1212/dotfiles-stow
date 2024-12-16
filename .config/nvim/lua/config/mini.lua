--- @diagnostic disable undefined-global
-- mini.nvim
-- mini.ai
require("mini.ai").setup()
-- mini.pairs
require("mini.pairs").setup({
  modes = { insert = true, command = true, terminal = true }
})
-- mini.surround
require("mini.surround").setup()
-- mini.bracketed
require("mini.bracketed").setup({
  buffer     = { suffix = '', options = {} },
  comment    = { suffix = '', options = {} },
  conflict   = { suffix = '', options = {} },
  diagnostic = { suffix = 'd', options = {} },
  file       = { suffix = '', options = {} },
  indent     = { suffix = '', options = {} },
  jump       = { suffix = '', options = {} },
  location   = { suffix = '', options = {} },
  oldfile    = { suffix = '', options = {} },
  quickfix   = { suffix = 'q', options = {} },
  treesitter = { suffix = 't', options = {} },
  undo       = { suffix = '', options = {} },
  window     = { suffix = 'w', options = {} },
  yank       = { suffix = '', options = {} },
})
-- mini.files
require("mini.files").setup({
  mappings = {
    close = 'q',
    go_in = '<right>',
    go_in_plus = '<cr>',
    go_out = '<left>',
    synchronize = ':w',
    reveal_cwd = '@'
  }
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesActionRename",
  callback = function(event)
    Snacks.rename.on_rename_file(event.data.from, event.data.to)
  end
})
-- mini.basics
require("mini.basics").setup({
  options = {
    basic = false,
    extra_ui = false,
    win_borders = 'rounded',
  },
  mappings = {
    basic = false,
    windows = false,
  },
  autocommands = {
    basic = true,
    relnum_in_visual_mode = true,
  },
  silent = false
})
-- mini.comment
require("mini.comment").setup()
-- mini.move
require("mini.move").setup({
  mappings = {
    left = '',
    right = '',
    down = 'J',
    up = 'K',
    line_left = '<',
    line_right = '>',
    line_down = 'J',
    line_up = 'K',
  },
})
-- mini.icons
require("mini.icons").setup({
  style = 'glyph'
})
