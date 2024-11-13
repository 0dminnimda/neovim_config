vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=tree:0", repo, lazypath, "--branch", "v11.14.1" }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    lazy = false,
    import = "plugins",
    config = function()
      require "options"
    end,
  },
}, lazy_config)

vim.schedule(function()
  require "mappings"
end)

require "my_init"
