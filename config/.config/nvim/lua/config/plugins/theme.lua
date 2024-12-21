return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				bold = false,
				contrast = "hard",
				transparent_mode = false,
				dim_inactive = false,
				strikethrough = true,
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
					["@markup.strong.markdown_inline"] = { link = "GruvboxYellow" },
					-- diagnostics
					DiagnosticSignInfo = { link = "DiagnosticInfo" },
					DiagnosticSignWarn = { link = "DiagnosticWarn" },
					DiagnosticSignError = { link = "DiagnosticError" },
					DiagnosticSignHint = { link = "DiagnosticHint" },

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
		end
	},

}
