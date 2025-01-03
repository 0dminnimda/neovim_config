local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- options ------------------------------------------

g.mapleader = " "

-- force single statusline for all windows
o.laststatus = 3
o.showmode = false

-- don't use system clipboard if not specifiaclly prompted to do so
o.clipboard = nil  -- "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- default to convert tab to 4 spaces
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

opt.fillchars = { eob = " " }
o.mouse = "a"

-- Good defaults for search ('/')
o.ignorecase = true
o.smartcase = true

-- Numbers
o.number = true
-- opt.number = true
opt.relativenumber = true
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

vim.fn.matchadd("TrailingWhitespace", "\\s\\+$")

