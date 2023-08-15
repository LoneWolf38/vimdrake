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
vim.keymap.set("n", "*", "*zz")

-- lsp
vim.keymap.set("n", "<leader><space>", "<cmd>CodeActionMenu<cr>", { desc = "Code Action Menu" })
-- harpoon
vim.keymap.set("n", "<leader>'", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Add to Harpoon" })
vim.keymap.set("n", "<leader>0", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Show Harpoon" })
vim.keymap.set("n", "<leader>[", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Harpoon Nav prev" })
vim.keymap.set("n", "<leader>]", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Harpoon Nav next" })
vim.keymap.set("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Harpoon Buffer 1" })
vim.keymap.set("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Harpoon Buffer 2" })
vim.keymap.set("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Harpoon Buffer 3" })
vim.keymap.set("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = "Harpoon Buffer 4" })
vim.keymap.set("n", "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", { desc = "Harpoon Buffer 5" })
vim.keymap.set("n", "<leader>6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", { desc = "Harpoon Buffer 6" })
vim.keymap.set("n", "<leader>7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", { desc = "Harpoon Buffer 7" })
vim.keymap.set("n", "<leader>8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", { desc = "Harpoon Buffer 8" })
vim.keymap.set("n", "<leader>9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", { desc = "Harpoon Buffer 9" })
vim.keymap.set({ "n", "x" }, "<leader>rr", function()
  require("refactoring").select_refactor()
end)

-- TODO Fix the lsp_inplementations bug
-- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
-- vim.keymap.set("n", "gi", [[<cmd>lua require"telescope.builtin".lsp_implementations()<CR>]])
--
-- GoTo Preview keymaps
vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>")
vim.keymap.set("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>")

-- lsp.buf keymaps
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set({ "n", "x" }, "<leader>rx", "<cmd>lua vim.lsp.buf.rename()<cr>")
vim.keymap.set("n", "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
vim.keymap.set("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>")

-- Telescope funyuns
vim.keymap.set("n", "gws", [[<cmd>lua require"telescope.builtin".lsp_dynamic_workspace_symbols()<CR>]])
vim.keymap.set("n", "gr", [[<cmd>lua require"telescope.builtin".lsp_references()<CR>]])
vim.keymap.set("n", "gds", [[<cmd>lua require"telescope.builtin".lsp_document_symbols()<CR>]])
vim.keymap.set("n", "<leader>aa", [[<cmd>lua require"telescope.builtin".diagnostics()<CR>]]) -- all workspace diagnostics
vim.keymap.set("n", "<leader>ae", [[<cmd>lua require"telescope.builtin".diagnostics({severity = "E"})<CR>]]) -- all workspace errors
vim.keymap.set("n", "<leader>aw", [[<cmd>lua require"telescope.builtin".diagnostics({severity = "W"})<CR>]]) -- all workspace errors
vim.keymap.set("n", "<leader>mc", [[<cmd>lua require"telescope".extensions.metals.commands()<CR>]])
vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Telescope live grep" })

-- vim own things
vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>") -- buffer diagnostics only
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>")

-- recommended mappings
-- resizing splits
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
-- buffer
vim.keymap.set("n", "<leader>n", "<cmd>bn<cr>", { desc = "Next" })
vim.keymap.set("n", "<leader>p", "<cmd>bp<cr>", { desc = "Previous" })
vim.keymap.set("n", "<leader>bj", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bk", "<cmd>bp<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>G", "<cmd>Neogit<cr>", { desc = "Neogit start" })
vim.keymap.set("n", "<leader>bsd", "<cmd>%bd|e#|bd#<cr>|'<cr>", { desc = "Delete surrounding buffers" })

-- clipboard
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
