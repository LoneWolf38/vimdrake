-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = require("config.globals.funcs")

vim.cmd([[
  noremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
  noremap <silent> <c-j> :<C-U>TmuxNavigateDown<cr>
  noremap <silent> <c-k> :<C-U>TmuxNavigateUp<cr>
  noremap <silent> <c-l> :<C-U>TmuxNavigateRight<cr>
  noremap <silent> <c-\> :<C-U>TmuxNavigatePrevious<cr>
]])

keymap.Set("n", "*", "*zz")

keymap.Set("n", "<leader>en", "<cmd> lua require('config.globals.filediff').get_branch()<CR>")

-- lsp
-- harpoon
keymap.Set("n", "<leader>'", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Add to Harpoon" })
keymap.Set("n", "<leader>0", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Show Harpoon" })
keymap.Set("n", "<C-p>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Harpoon Nav prev" })
keymap.Set("n", "<C-l>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Harpoon Nav next" })
keymap.Set({ "n", "x" }, "<leader>rr", function()
  require("refactoring").select_refactor()
end)

-- TODO Fix the lsp_inplementations bug
-- keymap.Set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
--
-- GoTo Preview keymaps
keymap.Set("n", "<leader>gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>")
keymap.Set("n", "<leader>gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>")
keymap.Set("n", "<leader>gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
keymap.Set("n", "<leader>gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>")
keymap.Set("n", "<leader>gP", "<cmd>lua require('goto-preview').close_all_win()<CR>")

-- lsp.buf keymaps
keymap.Set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap.Set({ "n", "x" }, "<leader>rx", "<cmd>lua vim.lsp.buf.rename()<cr>")
keymap.Set("n", "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
keymap.Set("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
keymap.Set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>")

-- Telescope funyuns
keymap.Set("n", "gws", [[<cmd>lua require"telescope.builtin".lsp_dynamic_workspace_symbols()<CR>]])
keymap.Set("n", "gr", [[<cmd>lua require"telescope.builtin".lsp_references()<CR>]])
keymap.Set("n", "gD", [[<cmd>lua require"telescope.builtin".lsp_definitions()<CR>]])
keymap.Set("n", "gds", [[<cmd>lua require"telescope.builtin".lsp_document_symbols()<CR>]])
keymap.Set("n", "gi", [[<cmd>lua require"telescope.builtin".lsp_implementations()<CR>]])
keymap.Set("n", "<leader>aa", [[<cmd>lua require"telescope.builtin".diagnostics()<CR>]]) -- all workspace diagnostics
keymap.Set("n", "<leader>ae", [[<cmd>lua require"telescope.builtin".diagnostics({severity = "E"})<CR>]]) -- all workspace errors
keymap.Set("n", "<leader>aw", [[<cmd>lua require"telescope.builtin".diagnostics({severity = "W"})<CR>]]) -- all workspace errors
keymap.Set("n", "<leader>mc", [[<cmd>lua require"telescope".extensions.metals.commands()<CR>]])
keymap.Set("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers" })
keymap.Set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Telescope live grep" })
keymap.Set("n", "fgs", "<cmd>Telescope git_status<cr>", { desc = "Telescope git status" })
keymap.Set("n", "fgb", "<cmd>Telescope git_branches<cr>", { desc = "Telescope git branches" })

-- vim own things
keymap.Set("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>") -- buffer diagnostics only
keymap.Set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>")
keymap.Set("n", "]d", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>")

-- recommended mappings
-- resizing splits
keymap.Set("n", "<A-h>", require("smart-splits").resize_left)
keymap.Set("n", "<A-j>", require("smart-splits").resize_down)
keymap.Set("n", "<A-k>", require("smart-splits").resize_up)
keymap.Set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
keymap.Set("n", "<C-h>", require("smart-splits").move_cursor_left)
keymap.Set("n", "<C-j>", require("smart-splits").move_cursor_down)
keymap.Set("n", "<C-k>", require("smart-splits").move_cursor_up)
keymap.Set("n", "<C-l>", require("smart-splits").move_cursor_right)
-- buffer
keymap.Set("n", "<leader>n", "<cmd>bn<cr>", { desc = "Next" })
keymap.Set("n", "<leader>p", "<cmd>bp<cr>", { desc = "Previous" })
keymap.Set("n", "<leader>bj", "<cmd>bn<cr>", { desc = "Next buffer" })
keymap.Set("n", "<leader>bk", "<cmd>bp<cr>", { desc = "Previous buffer" })
keymap.Set("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Next buffer" })
keymap.Set("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Previous buffer" })
keymap.Set("n", "<leader>do", "<cmd>DiffviewOpen<cr>", { desc = "Diff View Open" })
keymap.Set("n", "<leader>dx", "<cmd>DiffviewClose<cr>", { desc = "Diff View Close" })
keymap.Set("n", "<leader>uu", "<cmd>UndotreeToggle<cr>", { desc = "Undo tree toggle" })
keymap.Set("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason Start" })
keymap.Set("n", "<leader>G", "<cmd>Neogit<cr>", { desc = "Neogit start" })
keymap.Set("n", "<leader>bsd", "<cmd>%bd|e#|bd#<cr>|'<cr>", { desc = "Delete surrounding buffers" })
keymap.Set("n", "<leader>O", "<cmd>SymbolsOutline<cr>", { desc = "Symbols Outline" })
keymap.Set("n", "<leader>P", "<cmd>Telescope neoclip<cr>", { desc = "Neoclip" })
keymap.Set("n", "<leader>uo", "<cmd>OutputPanel<cr>", { desc = "Toggle LSP Output" })
keymap.Set(
  "n",
  "<leader>[c",
  "<cmd>lua require('treesitter-context').go_to_context()<cr>",
  { desc = "Attach to the nearest test" }
)

-- clipboard
keymap.Set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
