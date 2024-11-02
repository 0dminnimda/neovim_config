local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- SEE: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- lsps with default config
local servers = {
  -- "html", "cssls"
  "pyright", "clangd", "hdl_checker"
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

