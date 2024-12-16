local configs = require("nvim-treesitter.configs")
--- @diagnostic disable-next-line missing-field
configs.setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})
