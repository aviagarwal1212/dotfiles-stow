require("gruvbox").setup({
	bold = false,
	contrast = "hard",
	transparent_mode = true,
	dim_inactive = false,
	strikethrough = false,
	inverse = false,
	invert_selection = false,
	---@diagnostic disable-next-line missing-fields
	italic = {
		strings = false,
		comments = false,
		folds = false
	},
	overrides = {
		CursorLineNr = { link = "GruvboxYellowSign" },
		--- lua
		["@lsp.type.keyword.lua"] = { link = "Comment" },
		-- markdown
		["@markup.strong.markdown_inline"] = { link = "GruvboxYellow" }
	},
	palette_overrides = {
		-- pulled from the amazing catbox colorscheme
		green = "#a9b665",
		bright_green = "#a9b665",
		red = "#ea6962",
		bright_red = "#ea6962"
	}
})

vim.cmd.colorscheme "gruvbox"
