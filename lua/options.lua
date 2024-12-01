local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- options ------------------------------------------

g.mapleader = " "

o.laststatus = 3
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = true

-- disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH

-- o.cursorlineopt ='both' -- to enable cursorline!

-- listchars=eol:↵,trail:~,tab:>-,nbsp:␣,tab:▷ ,trail:·,extends:◣,precedes:◢,nbsp:○
--[[
opt.listchars:append({
  -- eol = "↵",
  nbsp = "␣",
  tab = "▷ ",
  trail = "%",  --✚■
  extends = "◣",
  precedes = "◢",
})
opt.list = true
]]--

opt.number = true
opt.relativenumber = true
-- to put them on the same line you can use "luukvbaal/statuscol.nvim"

-- force single statusline for all windows
o.laststatus = 3

-- default to convert tab to 4 spaces
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
vim.bo.softtabstop = 4

-- Good defaults for search ('/')
o.smartcase = true
o.ignorecase = true


vim.fn.matchadd("TrailingWhitespace", "\\s\\+$")
