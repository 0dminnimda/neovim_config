-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "chromodynamics",

  --[[
  hl_override = {
    Normal = { bg = "#060606", fg = "white" },

    Visual = { bg = "#252525" }, --guibg=white gui=nocursor

    -- Function = { fg = "#A6E22E" },
    -- ["@function"] = { fg = "#A6E22E" }, 

    -- ["@definition.function"] = { fg = "#66D9EF" },
    -- ["@definition.class"] = { fg = "#66D9EF" },

    SpecialKey = { fg = "#e8364f" }, -- does it exist?
    Conditional = { fg = "#e8364f" },
    Repeat = { fg = "#e8364f" },
    Label = { fg = "#e8364f" },
    Exception = { fg = "#e8364f" },

    -- Keyword = { fg = "#66D9EF" },
    -- ["@keyword"] = { fg = "#66D9EF" }, -- "#e8364f" },

    Operator = { fg = "#e8364f" },
    ["@operator"] = { fg = "#e8364f" },

    Comment = { fg = "#1CB715" },
    ["@comment"] = { fg = "#1CB715" },

    Character = { fg = "#D3C970" },
    String = { fg = "#D3C970" },
    ["@string"] = { fg = "#D3C970" },
    ["@string.special.url"] = { fg = "#D3C970", underline = true },

    Constant = { fg = "#9a79d7" }, 
    ["@number"] = { fg = "#9a79d7" },
    ["@constant"] = { fg = "#9a79d7" },
    ["@boolean"] = { fg = "#9a79d7" },
    -- ["@constant.builtin"] = { fg = "#9a79d7" },
  },
  ]]--

  -- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- fg = theme.base0B,

-- Allows for base46 to handle "extended integrations"
-- By default only built in integrations take effect
M.base46 = {
  integrations = {
    "rainbowdelimiters",
  },
}

return M

