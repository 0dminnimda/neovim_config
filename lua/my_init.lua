-- listchars=eol:↵,trail:~,tab:>-,nbsp:␣,tab:▷ ,trail:·,extends:◣,precedes:◢,nbsp:○
--[[
vim.opt.listchars:append({
  -- eol = "↵",
  nbsp = "␣",
  tab = "▷ ",
  trail = "%",  --✚■
  extends = "◣",
  precedes = "◢",
})
vim.opt.list = true
]]--

vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg="#FF0000" })
vim.fn.matchadd("TrailingWhitespace", "\\s\\+$")

-- TODO: add url highlighting
-- For more strict, use: https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)
-- (http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b[-a-zA-Z0-9@:%_\+.~#?&//=]*
-- vim.api.nvim_set_hl(0, "UrlString", { underline=true })
-- vim.fn.matchadd("UrlString", [[(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b[-a-zA-Z0-9@:%_\+.~#?&//=]*]])

-- don't show '~' for lines after EOF
local term_back = vim.api.nvim_get_hl_by_name("Normal", true).background
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = term_back })

vim.opt.relativenumber = true

-- force single statusline for all windows
vim.o.laststatus = 3

