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
vim.opt.spelllang = "en_gb"
vim.opt.spell = false

-- Package Management
-- setup lazy.nvim package manager
require("config.lazy")

-- Keymappings
-- Remove search highlights using <Esc> in Normal mode
vim.keymap.set('n', '<esc>', ':nohl<cr>')
--
-- oil.nvim
vim.keymap.set('n', '-', ":Oil<cr>")
--
-- terminal mode
vim.keymap.set('n', '<bs>t', ':terminal ')
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')
--
-- lsp
-- trigger hover
vim.keymap.set('n', '<leader>k', function()
	vim.lsp.buf.hover()
end)
-- trigger signature help
vim.keymap.set('i', '<C-s>', function()
	vim.lsp.buf.signature_help()
end)
--
-- code actions
vim.keymap.set('n', 'ga', ':FzfLua lsp_code_actions<cr>')
-- go to definition
vim.keymap.set({ 'n', 'v' }, 'gd', function() vim.lsp.buf.definition() end)
-- rename
vim.keymap.set('n', 'gr', function() vim.lsp.buf.rename() end)
-- set mark
vim.keymap.set('n', 'gm', ':mark ')
--
-- pickers
-- a double localleader to jump buffers
vim.keymap.set({ 'n', 'i', 'x', 'o', 't' }, '<localleader><localleader>', ':FzfLua buffers<cr>')
-- file picker
vim.keymap.set('n', '<localleader>f', ':FzfLua files<cr>')
-- symbol outline
vim.keymap.set('n', '<localleader>o', ':FzfLua lsp_document_symbols<cr>')
-- symbol search
vim.keymap.set('n', '<localleader>s', ':FzfLua lsp_workspace_symbols<cr>')
-- marks (capitals are maintained across files)
vim.keymap.set('n', '<localleader>m', ':FzfLua marks<cr>')
-- grep-based search across the whole project
vim.keymap.set('n', '<localleader>g', ':FzfLua grep_project<cr>')
-- pick from available pickers
vim.keymap.set('n', '<localleader>]', ':FzfLua builtin<cr>')
-- search through commandslsp_document_symbols
vim.keymap.set({ 'n', 'v' }, '<localleader>[', ':FzfLua commands<cr>')
-- diagnostics
vim.keymap.set('n', '<localleader>d', ':FzfLua diagnostics_document<cr>')
--
-- buffer management
vim.keymap.set('n', '<localleader>x', function() require("snacks").bufdelete() end)

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
		vim.opt_local.spell = true
	end
})
