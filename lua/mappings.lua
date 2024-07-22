require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- TODO: maybe make them togglable?
-- dap
map("n", "<leader>br", "<cmd> DapToggleBreakpoint <CR>")

-- dap_python
map("n", "<leader>rpd", "<cmd> DapPythonStart <CR>")

local all_modes = {"i", "c", "v", "x", "s", "o", "t", "l"}

map({"n", "v"}, "<S-b>", "<C-v>", { noremap = true })
-- vim.api.nvim_set_keymap('n', '<S-B>', '<C-V>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<S-b>', '<C-v>', { noremap = true, silent = true })

map(all_modes, "<C-s>", "<cmd> w <cr>")
map({'n', 'v'}, "<C-y>", '"+y', { noremap = true }) --, silent = true })
map({'n', 'v'}, "<C-p>", '"+P', { noremap = true }) --, silent = true })

-- don't use system clipboard if not specifiaclly prompted to do so
vim.cmd("set clipboard=")

map("n", "<leader>/", "gcc", { desc = "comment toggle" })
map("v", "<leader>/", "gc", { desc = "comment toggle" })

-- local mode_info = vim.api.nvim_get_mode()
-- print(mode_info.mode)

-- continuation of diagrantics from my_init.lua

-- Show all diagnostics on current line in floating window
map(
    'n', '<leader>s', function() vim.diagnostic.open_float() end,
    { noremap = true, silent = true }
)
-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
map(
    'n', '<leader>n', function()
        vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.WARN } })
    end, { noremap = true, silent = true }
)
-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
map(
    'n', '<leader>p', function()
        vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.WARN } })
    end, { noremap = true, silent = true }
)
