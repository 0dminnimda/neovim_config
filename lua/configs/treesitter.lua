local M = {}

function M.opts()
  local options = {
    ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc" },

    highlight = {
        enable = true,
        --disable = { "query", },
        use_languagetree = true,
    },

    indent = { enable = true },
  }

  vim.list_extend(options.ensure_installed, {
    "python",
    "c",
    "cpp",
    "jai",
    "regex",
    "comment",
    -- "nim",
    "markdown",
    "markdown_inline",
    "html",
    -- "verilog",
    -- "systemverilog",
    -- "v",
  })

  options.additional_vim_regex_highlighting = true

  return options
end

function M.config(_, opts)
  require("nvim-treesitter.install").compilers = { "zig" }

  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  parser_config.jai = {
    install_info = {
      url = "https://github.com/constantitus/tree-sitter-jai",
      files = { "src/parser.c", "src/scanner.c" },
      revision = "c61176d276761e6ee44a86b018446a1608b47b99",
    },
    filetype = "jai",
  }

  require("nvim-treesitter.configs").setup(opts)
end

return M
