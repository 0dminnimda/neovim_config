local options = require("nvchad.configs.treesitter")

vim.list_extend(options.ensure_installed, {
  "python", "c", "cpp",
  "regex", "comment",
  "markdown", "markdown_inline",
  "html",
  "verilog",
  "systemverilog", -- can cause errors, because of quotes in files
})

--[[
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
]]--

return options

