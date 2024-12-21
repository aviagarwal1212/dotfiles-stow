return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } }, } }
			}
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- lua
			lspconfig.lua_ls.setup { }
			-- elixir
			lspconfig.elixirls.setup {
				cmd = { "elixir-ls" }
			}
			-- html
			lspconfig.html.setup {
				filetypes = { "html", "heex", "eex", "eelixir" }
			}
			-- tailwind
			lspconfig.tailwindcss.setup {
				init_options = {
					userLanguages = {
						elixir = "html-eex",
						eelixir = "html-eex",
						heex = "html-eex"
					},
				},
			}

			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then return end

					---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
					if client.supports_method('textDocument/formatting') then
						-- Format the current buffer on save
						vim.api.nvim_create_autocmd('BufWritePre', {
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
							end,
						})
					end
				end,
			})
		end,
	}
}