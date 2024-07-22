local M = {}

function M.opts()
    local opts = require "nvchad.configs.telescope"

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

    ]]--

    return opts
end

function M.config(_, opts)
    dofile(vim.g.base46_cache .. "telescope")
    local telescope = require "telescope"
    telescope.setup(opts)

    -- load extensions
    for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
    end
end

return M
