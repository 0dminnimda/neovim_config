local options = require "nvchad.configs.mason"

-- just use pip directly, you don't need mason here
from_pip = {
    "pyright", "black", "debugpy", "mypy", "hdl-checker",
}

options.ensure_installed = {
    -- "ruff",  -- not always compiles, and even if does, it takes ages, but looks promissing
    "lua-language-server",
    -- "stylua",  -- who cares?
    -- "html-lsp", "css-lsp" , "prettier"
    -- "clangd",  -- you will have it if you have clang
}

return options
