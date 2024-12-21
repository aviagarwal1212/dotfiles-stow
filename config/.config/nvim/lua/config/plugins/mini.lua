return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			--- @diagnostic disable undefined-global
			-- mini.ai
			require("mini.ai").setup()
			-- mini.pairs
			require("mini.pairs").setup({
				modes = { insert = true, command = true, terminal = true }
			})
			-- mini.surround
			require("mini.surround").setup()
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
		end
	},
}
