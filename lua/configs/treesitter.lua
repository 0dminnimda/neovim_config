local M = {}

function M.opts()
    local options = require("nvchad.configs.treesitter")

    vim.list_extend(options.ensure_installed, {
      "python", "c", "cpp",
      "regex", "comment",
      "markdown", "markdown_inline",
      "html",
      "verilog",
      "systemverilog", -- can cause errors, because of quotes in files
    })

    options.additional_vim_regex_highlighting = true

    --[[
      highlight = {
        enable = true,
        use_languagetree = true,
      },

      indent = { enable = true },
    ]]--

    return options
end

function M.config(_, opts)
    -- for some fucking reason does not work!!
    local parsers = require "nvim-treesitter.parsers"
    local parser_config = parsers.get_parser_configs()
    -- Temporary until one of those are merged:
    --   https://github.com/zhangwwpeng/tree-sitter-systemverilog/pull/2
    --   https://github.com/gmlarumbe/tree-sitter-systemverilog/pull/3

    local sv = parser_config.systemverilog
    -- print(vim.inspect(sv))
    sv.install_info.url = "https://github.com/0dminnimda/tree-sitter-systemverilog"
    sv.install_info.branch = "fix_filenames"
    sv.maintainers = { "@0dminnimda" }

    dofile(vim.g.base46_cache .. "syntax")
    dofile(vim.g.base46_cache .. "treesitter")
    require("nvim-treesitter.configs").setup(opts)
end

return M
