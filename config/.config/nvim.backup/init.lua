--- @diagnostic disable undefined-global

-- Setup leader and local-leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- Make line numbers default
vim.opt.number = true
-- Enable mouse mode
vim.opt.mouse = 'a'
-- Disable mode in command line
vim.opt.showmode = false
-- Sync clipboard between nvim and OS
vim.opt.clipboard = "unnamedplus"
-- Enable breakindent
vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true
-- Case-insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Keep sign column on by default
vim.opt.signcolumn = 'yes'
vim.opt.numberwidth = 4
-- Decrease update time
vim.opt.updatetime = 250
-- Configure how new splits should be configured
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Live substitution
vim.opt.inccommand = 'split'
-- Highlight cursor line
vim.opt.cursorline = true
-- Number of lines for scroll-off
vim.opt.scrolloff = 10
-- Remove command line
vim.opt.cmdheight = 0
-- Smart indent
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
-- Completion menu
vim.opt.completeopt = { "menu", "menuone", "popup", "fuzzy" }
-- List mode
vim.opt.list = false
vim.opt.listchars = 'space:•'
-- Symbol at wrap
vim.opt.linebreak = true
vim.opt.showbreak = '• '
-- Set window title
vim.opt.title = true
-- folding
vim.opt.foldmethod = 'manual'
-- spell check
vim.opt.spelllang = "en_us"
vim.opt.spell = false

-- Package Management
-- setup lazy.nvim package manager
require("config.lazy")

-- Keymappings
-- Remove search highlights using <Esc> in Normal mode
vim.keymap.set('n', '<esc>', '<cmd>nohl<cr>')
--
-- mini.files
vim.keymap.set('n', '-', function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
end)
--
-- terminal mode
vim.keymap.set('n', '<bs>t', '<cmd>terminal<cr>')
vim.keymap.set('t', '<localleader><localleader>', '<c-\\><c-n>')
-- git
vim.keymap.set('n', '<bs>g', function() Snacks.lazygit() end)
--
-- lsp
vim.keymap.set('n', '<leader>k', function()
  vim.lsp.buf.hover({ border = 'rounded' })
end)
vim.keymap.set('i', '<C-s>', function()
  vim.lsp.buf.signature_help({ border = 'rounded' })
end)
vim.keymap.set('n', 'ga', '<cmd>FzfLua lsp_code_actions<cr>')
vim.keymap.set({ 'n', 'v' }, 'gd', function() vim.lsp.buf.definition() end)
--
-- pickers
vim.keymap.set('n', '<localleader><localleader>', '<cmd>FzfLua resume<cr>')
vim.keymap.set('n', '<localleader>d', '<cmd>FzfLua diagnostics_document<cr>')
vim.keymap.set('n', '<localleader>f', '<cmd>FzfLua files<cr>')
vim.keymap.set('n', '<localleader>b', '<cmd>FzfLua buffers<cr>')
vim.keymap.set('n', '<localleader>m', '<cmd>FzfLua marks<cr>')
vim.keymap.set('n', '<localleader>p', '<cmd>FzfLua builtin<cr>')
vim.keymap.set('n', '<localleader>g', '<cmd>FzfLua grep_project<cr>')
vim.keymap.set('n', '<localleader>s', '<cmd>FzfLua lsp_workspace_symbols<cr>')
vim.keymap.set('n', '<localleader>o', '<cmd>FzfLua lsp_document_symbols<cr>')
vim.keymap.set({ 'n', 'v' }, '<localleader>c', '<cmd>FzfLua commands<cr>')
--
-- buffer management
vim.keymap.set({ 'n', 'i', 'x', 'o', 't' }, '<F12>', '<cmd>b#<cr>')
vim.keymap.set('n', '<localleader>x', function() Snacks.bufdelete() end)
--
-- copilot
vim.keymap.set({ 'n', 'v' }, '<bs>a', function()
  local actions = require("CopilotChat.actions")
  require("CopilotChat.integrations.fzflua").pick(actions.prompt_actions())
end)
vim.keymap.set('i', '<C-y>', 'copilot#Accept("<Plug>(copilot-suggest)")', { expr = true, replace_keycodes = false })

-- Autocommands
-- No cursorline in terminal
vim.api.nvim_create_autocmd('termopen', {
  desc = "switch off cursorline in terminal",
  group = vim.api.nvim_create_augroup('onterminalopen', { clear = true }),
  callback = function()
    vim.opt.cursorline = false
  end
})
-- wrap settings in markdown
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.md", "*.txt", "SCRATCH*" },
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.cursorline = false
    vim.opt_local.spell = true
  end
})
