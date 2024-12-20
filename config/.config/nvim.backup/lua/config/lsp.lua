local lspconfig = require("lspconfig")

-- lua
-- lspconfig.lua_ls.setup {}
-- elixir
lspconfig.elixirls.setup {
  cmd = { "/home/avi/.nix-profile/bin/elixir-ls" }
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
