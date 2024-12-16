vim.opt.shortmess:append("c")

local lspkind = require("lspkind")
lspkind.init({})

local cmp = require("cmp")

-- cmp configuration
cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  mapping = {
    ["<C-Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<cr>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i" }
    ),
  },

  -- enable luasnip to handle snippet expansion
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  }
})

-- cmdline config
-- completions for / search based on current buffer
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
-- : cmdline setup
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    { { name = 'path' } },
    { { name = 'cmdline', option = { ignore_cmds = { 'Man', '!' } } } }
  )
})


-- luasnip configuration
local ls = require "luasnip"
ls.config.set_config {
  history = false,
  updateevents = "TextChanged,TextChangedI",
}

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/snippets/*.lua", true)) do
  loadfile(ft_path)()
end

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- snippets

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- elixir
ls.add_snippets("elixir", {
  -- <%= | %>
  s("el", { t("<%= "), i(1), t(" %>"), i(0) }),
})
-- heex
ls.add_snippets("heex", {
  -- <%= | %>
  s("el", { t("<%= "), i(1), t(" %>"), i(0) }),
})
