return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.nvim" },
		config = function()
			require("fzf-lua").setup({
				winopts = {
					fullscreen = true,
					preview = {
						layout = 'vertical'
					}
				},
				fzf_colors = true,
				file_icons = "mini",
			})

			require("fzf-lua").register_ui_select()
		end
	}
}
