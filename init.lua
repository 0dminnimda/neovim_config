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
      {
        lazy = false,
        import = "plugins",
      },
    }, lazy_config)
end

local setup_diagnostics = function()
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
end

bootstrap()
require("options")
require("themes")
require("mappings")
setup_diagnostics()
load_plugins()
