-- local icons = require("config.icons")
-- return {
--   "folke/which-key.nvim",
--   opts = {
--     icons = {
--       breadcrumb = icons.arrows.DoubleArrowRight, -- symbol used in the command line area that shows your active key combo
--       separator = icons.arrows.SmallArrowRight, -- symbol used between a key and it's label
--       group = icons.ui.Plus, -- symbol prepended to a group
--     },
--
--     window = {
--       border = "none", -- none, single, double, shadow
--       position = "bottom", -- bottom, top
--       margin = { 0, 10, 3, 10 }, -- extra window margin [top, right, bottom, left]
--       padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
--     },
--     layout = {
--       height = { min = 3, max = 25 }, -- min and max height of the columns
--       width = { min = 5, max = 50 }, -- min and max width of the columns
--       spacing = 10, -- spacing between columns
--       align = "center", -- align columns left, center or right
--     },
--     -- TODO: make it my own
--     groups = {
--       mode = { "n", "v" },
--       ["<leader>b"] = { name = "Buffers" },
--       ["<leader>f"] = { name = "Files" },
--       ["<leader>l"] = { name = "LSP" },
--       ["<leader>m"] = { name = "Misc" },
--       ["<leader>q"] = { name = "Quickfix" },
--       ["<leader>s"] = { name = "Search" },
--       ["<leader>t"] = { name = "Toggles" },
--       ["<leader>w"] = { name = "Windows" },
--       ["<leader>z"] = { name = "Spelling" },
--     },
--     plugins = {
--       marks = false, -- shows a list of your marks on ' and `
--       registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
--       spelling = {
--         enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
--       },
--       presets = {
--         operators = false, -- adds help for operators like d, y, ...
--         motions = false, -- adds help for motions
--         text_objects = false, -- help for text objects triggered after entering an operator
--         windows = false, -- default bindings on <c-w>
--         nav = false, -- misc bindings to work with windows
--         z = true, -- bindings for folds, spelling and others prefixed with z
--         g = false, -- bindings for prefixed with g
--       },
--     },
--   },
-- }
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["gz"] = { name = "+surround" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader><tab>"] = { name = "+tabs" },
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>c"] = { name = "+code" },
      ["<leader>f"] = { name = "+file/find" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>gh"] = { name = "+hunks" },
      ["<leader>q"] = { name = "+quit/session" },
      ["<leader>s"] = { name = "+search" },
      ["<leader>u"] = { name = "+ui" },
      ["<leader>w"] = { name = "+windows" },
      ["<leader>x"] = { name = "+diagnostics/quickfix" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
