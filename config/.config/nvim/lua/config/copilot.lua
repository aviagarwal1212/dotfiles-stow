vim.g.copilot_enabled = false
vim.g.copilot_no_tab_map = true

require("CopilotChat").setup({
  model = "claude-3.5-sonnet",
  window = {
    layout = 'float',
    width = 0.8,
    height = 0.8,
    relative = 'win',
    border = 'rounded',
    title = "",
  },
  show_help = false,
  show_folds = false,
  highlight_selection = true,
  highlight_headers = false,
  chat_autocomplete = true,
  question_header = "  --   ",
  answer_header = "   --   ",
  error_header = '  -- !!!',
  separator = '---',
  mappings = {
    complete = {
      insert = '<C-y>',
    },
    show_info = {
      normal = 'gI'
    }
  }
})
