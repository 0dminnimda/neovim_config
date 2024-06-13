local options = require("nvchad.configs.treesitter")

-- thl = require("nvim-treesitter.highlight")

--thl
--[[require"nvim-treesitter.highlight".set_custom_captures {
  ["constant.builtin.ellipsis"] = "@constant.builtin.ellipsis",
}]]--

options.ensure_installed = {
  "vim", "vimdoc",
  "lua", "luadoc",
  -- why? "printf",
  "python", "c", "cpp",
}

--[[
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
]]--

--[[
custom_captures = {
  ["return"] = "YourCustomHighlightGroup",
]]--

return options

