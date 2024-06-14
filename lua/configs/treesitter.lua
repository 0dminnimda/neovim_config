local options = require("nvchad.configs.treesitter")

vim.list_extend(options.ensure_installed, {
  "python", "c", "cpp",
})

--[[
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
]]--

return options

