local M = {}

function M.opts()
  dofile(vim.g.base46_cache .. "telescope")

  local opts = {
    defaults = {
      prompt_prefix = "   ",
      selection_caret = " ",
      entry_prefix = " ",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
        width = 0.87,
        height = 0.80,
      },
      mappings = {
        n = { ["q"] = require("telescope.actions").close },
      },
    },

    -- extensions_list = { "themes", "terms" },
    extensions = {},
  }

  -- probably will enable search in untracked files:
  -- require"telescope.builtin".git_files({ show_untracked = true })
  --[[ no-ignore-vcs

    opts.defaults = {
        ripgrep_arguments = {
            'rg',
            '--hidden',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
    }

    ]]
  --

  return opts
end

function M.config(_, opts)
  dofile(vim.g.base46_cache .. "telescope")
  local telescope = require "telescope"
  telescope.setup(opts)

  --[[
    -- load extensions
    for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
    end
    ]]
  --
end

return M
