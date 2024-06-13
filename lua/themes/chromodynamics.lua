-- adopted from https://github.com/MagicStack/Chromodynamics

---@type Base46Table
local M = {}

-- general UI
M.base_30 = {
  white         = "#ced4df",
  darker_black  = "#05080e", -- 6% darker than black
  black         = "#060606", -- usually your theme bg
  black2        = "#14171d", -- 6% lighter than black
  one_bg        = "#1c1f25", -- 10% lighter than black
  one_bg2       = "#24272d", -- 6% lighter than one_bg
  one_bg3       = "#2b2e34", -- 6% lighter than one_bg2
  grey          = "#33363c", -- 40% lighter than black (the % here depends so choose the perfect grey!)
  grey_fg       = "#3d4046", -- 10% lighter than grey
  grey_fg2      = "#46494f", -- 5% lighter than grey
  light_grey    = "#54575d",
  red           = "#F07178",
  baby_pink     = "#ff949b",
  pink          = "#ff8087",
  line          = "#252525", -- 15% lighter than black -- for lines like vertsplit
  green         = "#AAD84C",
  vibrant_green = "#b9e75b",
  blue          = "#36A3D9",
  nord_blue     = "#43b0e6",
  yellow        = "#E7C547",
  sun           = "#f0df8a", -- 15% lighter than black
  purple        = "#c79bf4",
  dark_purple   = "#A37ACC",
  teal          = "#74c5aa",
  orange        = "#ffa455",
  cyan          = "#95E6CB",
  statusline_bg = "#131313",
  lightbg       = "#24272d",
  pmenu_bg      = "#ff9445",
  folder_bg     = "#6792CA",
}

local my_version = true

local back      = "#060606"  -- background
local fore      = "#C6C6C6"  -- foreground
local select    = "#252525"
local ident     = fore       -- identifier
local spec_id   = "#B0AF95"  -- special identifier, only 'self' and 'cls' AFAIK
local spec_id_full = { fg = spec_id }
local invis     = "#3B3A32"
local comment   = invis
local comment_full = { fg = comment }
local const     = "#9A79D7"
local decl_kw   = "#66D9EF"  -- declaration keyword
local builtin   = decl_kw
local flow_kw   = "#E8364F"  -- control flow keyword
local operator  = flow_kw
local include   = flow_kw    -- include / import
local decl_ref  = "#A6E22E"  -- reference to declared name, like function or class
local def_func  = decl_ref   -- name in the function definition / declaration
local def_clas  = decl_ref   -- name in the class definition / declaration
local tag       = "#D33C78"  -- not sure what it is ...
local tag_attr  = "#D77C23"  -- still not quite sure ...
local arg       = "#E99C42"  -- function argument
local depr_back = "#99732b"  -- deprecated background
local depr_fore = "#F8F8F0"  -- deprecated foreground
local str       = "#D3C970"
local hint      = "#868686"
local status_bg = "#131313"
local status_fg = fore

-- #60A1B2
if my_version then
  comment       = "#33CC33"
  comment_full  = { fg = comment, bold = true }
  spec_id       = "#C9C8B6"
  spec_id_full  = { fg = spec_id, bold = true }  -- should be italic, but it cuts off in termux
end

-- syntax highlighting
M.base_16 = {
  base00 = back     , -- Default Background
  base01 = status_bg, -- Lighter Background (Used for status bars, line number and folding marks)
  base02 = select   , -- Selection Background
  base03 = invis    , -- ~~Comments~~, Invisibles, Line Highlighting
  base04 = status_fg, -- Dark Foreground (Used for status bars)
  base05 = fore     , -- Default Foreground, Caret, Delimiters, Operators
  base06 = fore     , -- Light Foreground (Not often used)
  base07 = "#090909", -- Light Background (Not often used)
  base08 = ident    , -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = const    , -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = decl_ref , -- Classes, Markup Bold, Search Text Background
  base0B = str      , -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = const    , -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = ident    , -- Functions, Methods, Attribute IDs, Headings
  base0E = flow_kw  , -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = depr_fore, -- Deprecated, Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
}

-- Fine tune the highlighting
-- SEE: https://github.com/NvChad/base46/tree/v2.0/lua/base46/integrations
--      ^ each file here can become a key in this table
M.polish_hl = {
  -- TODO: probably better to link some of the repeating 'groupped' ones
  defaults = {
    Comment = comment_full,
  },

  syntax = {
    -- Type
    Include = { fg = include },
  },

  lsp = {
    DiagnosticHint = { fg = hint },
    DiagnosticUnnecessary = { fg = hint },
  },

  -- SEE: https://github.com/nvim-treesitter/nvim-treesitter/tree/master/queries/python
  -- SEE: https://github.com/tree-sitter/tree-sitter-python/tree/master/queries
  treesitter = {
    ["@comment"] = comment_full,
    ["@constant"] = { fg = const },
    ["@ellipsis"] = { fg = const },

    ["@keyword"] = { fg = flow_kw },
    ["@keyword.function"] = { fg = decl_kw },
    ["@keyword.conditional"] = { fg = flow_kw },
    ["@keyword.repeat"] = { fg = flow_kw },
    ["@keyword.return"] = { fg = flow_kw },
    ["@keyword.type"] = { fg = decl_kw },
    -- doesn't seem to exits ["@definition.class"] = { fg = decl_kw },

    ["@operator"] = { fg = operator },

    ["@type.builtin"] = { fg = builtin },
    ["@constant.builtin"] = { fg = builtin },
    ["@attribute.builtin"] = { fg = builtin },
    ["@function.builtin"] = { fg = builtin },

    ["@variable.builtin"] = spec_id_full,

    ["@variable.parameter"] = { fg = arg },

    ["@function"] = { fg = decl_ref },
    ["@function.method"] = { fg = decl_ref },
    ["@type.inherited"] = { fg = decl_ref },

    ["@type.definition"] = { link = "@variable" },  -- fore, by default

    ["@constructor"] = { link = "Type" },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "chromodynamics")

return M

