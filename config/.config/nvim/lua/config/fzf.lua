require("fzf-lua").setup({
	winopts = {
		fullscreen = false,
		preview = {
			layout = 'vertical'
		}
	},
	fzf_colors = true,
	file_icons = "mini",
})

require("fzf-lua").register_ui_select()
