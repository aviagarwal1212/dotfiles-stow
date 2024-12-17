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
	style = 'ascii'
})
