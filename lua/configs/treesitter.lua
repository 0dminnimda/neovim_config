local M = {}

function M.opts()
  pcall(function()
    dofile(vim.g.base46_cache .. "syntax")
    dofile(vim.g.base46_cache .. "treesitter")
  end)

  local options = {
    ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc" },

    highlight = {
      enable = true,
      use_languagetree = true,
    },

    indent = { enable = true },
  }

  vim.list_extend(options.ensure_installed, {
    "python",
    "c",
    "cpp",
    "regex",
    "comment",
    "nim",
    "markdown",
    "markdown_inline",
    "html",
    -- "verilog",
    -- "systemverilog",
    -- "v",
  })

  options.additional_vim_regex_highlighting = true

  --[[
      highlight = {
        enable = true,
        use_languagetree = true,
      },

      indent = { enable = true },
    ]]
  --

  return options
end

function M.config(_, opts)
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
  require("nvim-treesitter.configs").setup(opts)
end

return M
