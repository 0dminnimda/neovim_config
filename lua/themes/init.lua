local theme = require("themes.chromodynamics")

for group, settings in pairs(theme) do
    vim.api.nvim_set_hl(0, group, settings)
end
