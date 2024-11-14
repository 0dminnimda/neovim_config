local map = vim.keymap.set

--[[
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
]]
--
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- tabufline
--[[
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
  require("tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>x", function()
  require("tabufline").close_buffer()
end, { desc = "buffer close" })
]]
--

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- files
map("n", "<C-n>", function()
    local path = vim.fn.expand("%:p:h")
    require("telescope").extensions.file_browser.file_browser({ path = path })
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
end, { desc = "telescope file browser" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<CR>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- !!!! mine my !!!!!

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- TODO: maybe make them togglable?
-- dap
map("n", "<leader>br", "<cmd> DapToggleBreakpoint <CR>")

-- dap_python
map("n", "<leader>rpd", "<cmd> DapPythonStart <CR>")

local all_modes = { "i", "c", "v", "x", "s", "o", "t", "l" }

map({ "n", "v" }, "<S-b>", "<C-v>", { noremap = true })
-- vim.api.nvim_set_keymap('n', '<S-B>', '<C-V>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<S-b>', '<C-v>', { noremap = true, silent = true })

map(all_modes, "<C-s>", "<cmd> w <cr>")
map({ "n", "v" }, "<C-y>", '"+y', { noremap = true }) --, silent = true })
map({ "n", "v" }, "<C-p>", '"+P', { noremap = true }) --, silent = true })

-- don't use system clipboard if not specifiaclly prompted to do so
vim.cmd "set clipboard="

map("n", "<leader>/", "gcc", { desc = "comment toggle" })
map("v", "<leader>/", "gc", { desc = "comment toggle" })

-- local mode_info = vim.api.nvim_get_mode()
-- print(mode_info.mode)

-- continuation of diagrantics from my_init.lua

-- Show all diagnostics on current line in floating window
map("n", "<leader>s", function()
  vim.diagnostic.open_float { focus = false }
end, { noremap = true, silent = true })
-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
map("n", "<leader>n", function()
  vim.diagnostic.goto_next {
    severity = { min = vim.diagnostic.severity.WARN },
    float = { focus = false },
  }
end, { noremap = true, silent = true })
-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
map("n", "<leader>p", function()
  vim.diagnostic.goto_prev {
    severity = { min = vim.diagnostic.severity.WARN },
    float = { focus = false },
  }
end, { noremap = true, silent = true })
