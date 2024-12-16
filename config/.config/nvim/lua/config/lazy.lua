-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- put lazy in the neovim runtime path
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    -- gruvbox
    {
      "ellisonleao/gruvbox.nvim",
      priority = 1000,
      config = function()
        require("config.theme")
      end
    },
    -- treesitter
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("config.treesitter")
      end
    },
    -- LSP
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        {
          "folke/lazydev.nvim",
          ft = "lua",
          opts = {
            library = {
              { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            }
          }
        }
      },
      config = function()
        require("config.lsp")
      end,
    },
    -- completions
    {
      "hrsh7th/nvim-cmp",
      lazy = false,
      priority = 100,
      dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
        "saadparwaiz1/cmp_luasnip",
      },
      config = function()
        require("config.completion")
      end
    },
    -- emmet
    {
      "mattn/emmet-vim",
    },
    -- mini.nvim
    {
      "echasnovski/mini.nvim",
      version = false,
      config = function()
        require("config.mini")
      end
    },
    -- snacks.nvim
    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      opts = require("config.snacks")
    },
    -- lualine
    {
      "nvim-lualine/lualine.nvim",
      config = function()
        require("config.lualine")
      end
    },
    -- flash
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {},
      keys = require("config.flash"),
    },
    -- gitsigns
    {
      "lewis6991/gitsigns.nvim",
      config = function()
        require("config.git")
      end
    },
    -- fzf-lua
    {
      "ibhagwan/fzf-lua",
      dependencies = { "echasnovski/mini.nvim" },
      config = function()
        require("config.fzf")
      end
    },
    -- session
    {
      "rmagatti/auto-session",
      lazy = false,
      opts = {
        suppressed_dirs = { "~/", "/" }
      }
    },
    -- copilot
    {
      "copilotC-Nvim/copilotChat.nvim",
      dependencies = {
        { "github/copilot.vim" },
        { "nvim-lua/plenary.nvim", branch = "master" },
      },
      build = "make tiktoken",
      opts = {},
      config = function()
        require("config.copilot")
      end
    },
    -- markdown
    {
      "MeanderingProgrammer/render-markdown.nvim",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "echasnovski/mini.nvim",
      },
      config = function()
        require("config.markdown")
      end
    },
		-- tables
		{
			"dhruvasagar/vim-table-mode"
		}
  },
  ui = {
    border = 'rounded'
  },
  -- automatically check for plugin updates
  checker = { enabled = false },
})
