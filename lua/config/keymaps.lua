-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.cmd([[
  noremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
  noremap <silent> <c-j> :<C-U>TmuxNavigateDown<cr>
  noremap <silent> <c-k> :<C-U>TmuxNavigateUp<cr>
  noremap <silent> <c-l> :<C-U>TmuxNavigateRight<cr>
  noremap <silent> <c-\> :<C-U>TmuxNavigatePrevious<cr>
]])

-- lsp
vim.keymap.set("n", "<leader><space>", "<cmd>CodeActionMenu<cr>", { desc = "Code Action Menu" })

-- buffer
vim.keymap.set("n", "<leader>n", "<cmd>bn<cr>", { desc = "Next" })
vim.keymap.set("n", "<leader>p", "<cmd>bp<cr>", { desc = "Previous" })
vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>bj", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bk", "<cmd>bp<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bsd", "<cmd>%bd|e#|bd#<cr>|'<cr>", { desc = "Delete surrounding buffers" })

-- clipboard
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
