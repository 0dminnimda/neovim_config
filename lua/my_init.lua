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
]]
--

require("themes")

vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = "#FF0000" })
vim.fn.matchadd("TrailingWhitespace", "\\s\\+$")

-- TODO: add url highlighting
-- For more strict, use: https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)
-- (http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b[-a-zA-Z0-9@:%_\+.~#?&//=]*
-- vim.api.nvim_set_hl(0, "UrlString", { underline=true })
-- vim.fn.matchadd("UrlString", [[(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b[-a-zA-Z0-9@:%_\+.~#?&//=]*]])

-- don't show '~' for lines after EOF
local term_back = vim.api.nvim_get_hl_by_name("Normal", true).background
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = term_back })

vim.opt.number = true
vim.opt.relativenumber = true
-- to put them on the same line you can use "luukvbaal/statuscol.nvim"

-- force single statusline for all windows
vim.o.laststatus = 3

-- default to convert tab to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.bo.softtabstop = 4

-- diagnostics
vim.diagnostic.config {
  virtual_text = false, -- Turn off inline diagnostics
}

-- Use this if you want it to automatically show all diagnostics on the
-- current line in a floating window. Personally, I find this a bit
-- distracting and prefer to manually trigger it (see below). The
-- CursorHold event happens when after `updatetime` milliseconds. The
-- default is 4000 which is much too long
vim.cmd "autocmd CursorHold * lua vim.diagnostic.open_float({ focus=false })"
vim.o.updatetime = 300

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
})

-- diagnostics continued in mappings.lua --

-- Good defaults for search ('/')
vim.o.smartcase = true
vim.o.ignorecase = true
