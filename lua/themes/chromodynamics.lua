-- adopted from https://github.com/MagicStack/Chromodynamics

---@type Base46Table
local M = {}

-- general UI
M.base_30 = {
  white = "",
  black = "", -- usually your theme bg
  darker_black = "", -- 6% darker than black
  black2 = "", -- 6% lighter than black
  one_bg = "", -- 10% lighter than black
  one_bg2 = "", -- 6% lighter than one_bg2
  one_bg3 = "", -- 6% lighter than one_bg3
  grey = "", -- 40% lighter than black (the % here depends so choose the perfect grey!)
  grey_fg = "", -- 10% lighter than grey
  grey_fg2 = "", -- 5% lighter than grey
  light_grey = "",
  red = "",
  baby_pink = "",
  pink = "",
  line = "", -- 15% lighter than black
  green = "",
  vibrant_green = "",
  nord_blue = "",
  blue = "",
  seablue = "",
  yellow = "", -- 8% lighter than yellow
  sun = "",
  purple = "",
  dark_purple = "",
  teal = "",
  orange = "",
  cyan = "",
  statusline_bg = "",
  lightbg = "",
  pmenu_bg = "",
  folder_bg = ""
}
M.base_30 = {
  white = "#ced4df",
  darker_black = "#05080e",
  black = "#0B0E14", --  nvim bg
  black2 = "#14171d",
  one_bg = "#1c1f25",
  one_bg2 = "#24272d",
  one_bg3 = "#2b2e34",
  grey = "#33363c",
  grey_fg = "#3d4046",
  grey_fg2 = "#46494f",
  light_grey = "#54575d",
  red = "#F07178",
  baby_pink = "#ff949b",
  pink = "#ff8087",
  line = "#24272d", -- for lines like vertsplit
  green = "#AAD84C",
  vibrant_green = "#b9e75b",
  blue = "#36A3D9",
  nord_blue = "#43b0e6",
  yellow = "#E7C547",
  sun = "#f0df8a",
  purple = "#c79bf4",
  dark_purple = "#A37ACC",
  teal = "#74c5aa",
  orange = "#ffa455",
  cyan = "#95E6CB",
  statusline_bg = "#12151b",
  lightbg = "#24272d",
  pmenu_bg = "#ff9445",
  folder_bg = "#98a3af",
}

-- syntax highlighting
M.base_16 = {
  base00 = "#060606", -- Default Background
  base01 = "#131313", -- Lighter Background (Used for status bars, line number and folding marks)
  base02 = "#252525", -- Selection Background
  base03 = "#1CB715", -- Comments, Invisibles, Line Highlighting
  base04 = "#C6C6C6", -- Dark Foreground (Used for status bars)
  base05 = "#C6C6C6", -- Default Foreground, Caret, Delimiters, Operators
  base06 = "#C8C8C8", -- Light Foreground (Not often used)
  base07 = "#040404", -- Light Background (Not often used)
  base08 = "#FFFFFF", -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = "#9a79d7", -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = "#A6E22E", -- Classes, Markup Bold, Search Text Background
  base0B = "#D3C970", -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = "#9A79D7", -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = "#D77C23", -- Functions, Methods, Attribute IDs, Headings
  base0E = "#E8364F", -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = "#D33C78", -- Deprecated, Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
}

M.polish_hl = {
  defaults = {
    Comment = { fg = "#1CB715" },
  },

  treesitter = {
    ["@comment"] = { fg = "#1CB715" }, 
  },

  --[[
  treesitter = {
    luaTSField = { fg = M.base_16.base0D },
    ["@tag.delimiter"] = { fg = M.base_30.cyan },
    ["@function"] = { fg = M.base_30.orange },
    ["@variable.parameter"] = { fg = M.base_16.base0F },
    ["@constructor"] = { fg = M.base_16.base0A },
    ["@tag.attribute"] = { fg = M.base_30.orange },
  },
  ]]--

  -- possible keys: statusline, alpha, blankline, bufferline, cmp, codeactionmenu, dap, defaults, devicons, git, hop, lsp, lspsaga, mason, navic, neogit, notify, nvcheatsheet, nvdash, nvimtree, rainbowdelimiters, semantic_tokens, syntax, tbline, telescope, todo, treesitter, trouble, vim-illuminate, whichkey
}

M.type = "dark"

M = require("base46").override_theme(M, "chromodynamics")

return M

