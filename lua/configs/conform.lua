local M = {}

function M.opts()
     return {
      formatters_by_ft = {
        lua = { "stylua" },
            python = { "isort", "black" },
        -- css = { "prettier" },
        -- html = { "prettier" },
      },

      -- format_on_save = {
      --   -- These options will be passed to conform.format()
      --   timeout_ms = 500,
      --   lsp_fallback = true,
      -- },
    }
end

function M.config(_, opts)
    require("conform").setup(opts)
end

return M
