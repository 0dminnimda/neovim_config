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

vim.api.nvim_set_hl(0, "EoLSpace", { bg="#FF0000" })
vim.fn.matchadd("EoLSpace", "\\s\\+$")

