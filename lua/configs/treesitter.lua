--[[return {
  -- event = { "LazyFile", "VeryLazy" },
  lazy = false,
  ensure_installed = {
  	"vim", "lua", "vimdoc",
    "python", "c", "cpp",
    -- "html", "css"
  },
}]]--

local options = require("nvchad.configs.treesitter")

thl = require("nvim-treesitter.highlight")

--[[thl.set_custom_captures {
  ["foo.bar"] = "Identifier",
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

return options

