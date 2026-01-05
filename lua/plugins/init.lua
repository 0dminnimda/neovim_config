return {
  -- ui
  --[[
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
  ]]--
  --[[
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
  },
  ]]--


  -- TODO: add nvim-hlslens to fix [>99/>99]


  -- file managing, picker etc
    {
        "ibhagwan/fzf-lua",
        cmd = { "FzfLua" },
        opts = {
            files = {
                git_icons = false,
            },
        },
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
        opts = require("configs.treesitter").opts,
        config = require("configs.treesitter").config,
  },

  -- lsp
    --[[
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require("configs.lspconfig").defaults()
    end,
  },
  ]]--

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
  },
  -- snippet plugin
    {
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
        config = function()
            local mc = require("multicursor-nvim")
            mc.setup()

            local set = vim.keymap.set

            -- C+D to find next word and add cursor
            set({"n", "v"}, "<C-d>", function() mc.matchAddCursor(1) end)
            
            -- Skip current match
            set({"n", "v"}, "<Leader><C-d>", function() mc.matchSkipCursor(1) end)

            -- Add cursors above/below
            set({"n", "v"}, "<C-Up>", function() mc.lineAddCursor(-1) end)
            set({"n", "v"}, "<C-Down>", function() mc.lineAddCursor(1) end)

            -- Mouse support
            set("n", "<C-LeftMouse>", mc.handleMouse)
            set("n", "<C-LeftDrag>", mc.handleMouseDrag)
            set("n", "<C-LeftRelease>", mc.handleMouseRelease)

            -- Align cursors
            set("n", "<Leader>a", mc.alignCursors)

            -- Restore cursors
            set("n", "<Leader>gv", mc.restoreCursors)

            -- Mappings that only apply when multiple cursors are active
            mc.addKeymapLayer(function(layerSet)
                -- Clear cursors with Esc
                layerSet("n", "<Esc>", function()
                    if not mc.cursorsEnabled() then
                        mc.enableCursors()
                    else
                        mc.clearCursors()
                    end
                end)
                
                -- Navigation between cursors
                layerSet({"n", "v"}, "<Left>", mc.prevCursor)
                layerSet({"n", "v"}, "<Right>", mc.nextCursor)
            end)
        end
    },
}
