-- local catppuccin = require("catppuccin")
--
-- catppuccin.setup({
--   transparent_background = true,
--   no_bold = true,
--   show_end_of_buffer = false,
--   term_colors = true,
-- })
--
require("gruvbox").setup({
  bold = true,
  contrast = "hard",
  transparent_mode = true,
  dim_inactive = false,
  strikethrough = false,
  inverse = false,
  invert_selection = false,
  ---@diagnostic disable-next-line missing-fields
  italic = {
    strings = false,
    comments = true,
    folds = false
  },
  overrides = {
    CursorLineNr = { link = "GruvboxYellowSign" },
    -- ["@string"] = { link = "GruvboxYellow" },
    --- lua
    ["@lsp.type.keyword.lua"] = { link = "Comment" },
    -- elixir
    -- ["@function.elixir"] = { link = "GruvboxBlue" },
    -- ["@function.call.elixir"] = { link = "GruvboxBlue" },
    -- markdown
    ["@markup.strong.markdown_inline"] = { link = "GruvboxYellow" }
  },
  palette_overrides = {
    green = "#a9b665",
    bright_green = "#a9b665",
    red = "#ea6962",
    bright_red = "#ea6962"
  }
})

vim.cmd.colorscheme "gruvbox"
