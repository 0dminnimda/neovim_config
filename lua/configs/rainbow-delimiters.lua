local rainbow_delimiters = require "rainbow-delimiters"

-- VSCode uses:
-- #FED701, #DA70D5, #169FFF or #189FED
-- Simple Complementary Colors:
-- #FFFF00, #00FF80, #0000FF, #FF0080
-- #FFB000, #00FF30, #004FFF, #FF00CF
-- #FF5757, #ABFF57, #57FFFF, #AB57FF
-- #FF5757, #57FF57, #5757FF
-- #FFB000, #00FFB0, #B000FF
-- #A0FF00, #00A0FF, #FF00A0
-- #FFFF00, #00FFFF, #FF00FF
local colors = { "#FFFF00", "#00FF80", "#004FFF", "#FF0080" }

local names = {}
for i, color in ipairs(colors) do
  local name = "RainbowDelimiter" .. i
  names[i] = name
  vim.api.nvim_set_hl(0, name, { fg = color })
end

---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
  highlight = names,
}
