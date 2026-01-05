local bootstrap = function()
    local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

    if not vim.loop.fs_stat(lazypath) then
      local repo = "https://github.com/folke/lazy.nvim.git"
      vim.fn.system { "git", "clone", "--filter=tree:0", repo, lazypath, "--branch", "v11.14.1" }
    end

    vim.opt.rtp:prepend(lazypath)
end

local load_plugins = function()
    local lazy_config = require "configs.lazy"

    require("lazy").setup({
        lazy = false,
        import = "plugins",
        performance = {
	        rtp = {
	            reset = false
    	    }
	    }
    }, lazy_config)
end

bootstrap()
require("options")
require("themes")
require("mappings")
load_plugins()
