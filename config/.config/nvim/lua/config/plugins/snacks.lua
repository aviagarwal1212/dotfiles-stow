return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			quickfile = { enabled = true },
			bufdelete = { enabled = true },
			statuscolumn = { enabled = true, left = { 'mark', 'sign' }, right = { 'git' } },
			rename = { enabled = true },
			lazygit = { enabled = true },
		}
	},
}
