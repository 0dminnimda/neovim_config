local options = require("nvchad.configs.treesitter")

vim.list_extend(options.ensure_installed, {
  "python", "c", "cpp",
  "regex", "comment",
  "markdown", "markdown_inline",
  "html",
  "verilog", "systemverilog",
})

--[[
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
]]--

return options

