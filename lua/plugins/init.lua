return {
  -- ui
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = {
      indent = { char = "│", highlight = "IblChar" },
      scope = { char = "│", highlight = "IblScopeChar" },
    },
    config = function(_, opts)
      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)
    end,
  },
  --[[
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
  },
  ]]
  --

  -- file managing, picker etc
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = { "Telescope" },
    opts = require("configs.telescope").opts,
    config = require("configs.telescope").config,
  },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },

  -- version control
  --[[
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require "nvchad.configs.gitsigns"
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },
  ]]--

  -- highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    dependencies = {
      "HiPhish/rainbow-delimiters.nvim",
    },
    opts = require("configs.treesitter").opts,
    config = require("configs.treesitter").config,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require "configs.rainbow-delimiters"
    end,
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require("configs.lspconfig").defaults()
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = require("configs.conform").opts,
    config = require("configs.conform").config,
  },

  -- completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- cmp sources plugins
      -- "saadparwaiz1/cmp_luasnip",
      -- "hrsh7th/cmp-nvim-lua",
      -- "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function()
      return require "configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },
  -- snippet plugin
  --[[
  {
    "L3MON4D3/LuaSnip",
    opts = { history = true, updateevents = "TextChanged,TextChangedI" },
    config = function(_, opts)
      require("luasnip").config.set_config(opts)
      require "nvchad.configs.luasnip"
    end,
  },
  ]]--
    {
        "mg979/vim-visual-multi",
        lazy = false,
        init = function()
            vim.g.VM_default_mappings = 0
            vim.g.VM_maps = {
                ["Find Under"]         = "<C-d>",
                ["Find Subword Under"] = "<C-d>",
                ["Select Cursor Down"] = "<M-C-Down>",
                ["Select Cursor Up"]   = "<M-C-Up>",
            }
            --vim.g.VM_add_cursor_at_pos_no_mappings = 1
            vim.g.VM_leader = vim.g.mapleader
        end
    },
}
