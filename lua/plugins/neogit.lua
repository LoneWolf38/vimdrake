return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  cmd = "Neogit",
  opts = {
    integrations = {
      diffview = true,
    },
  },

  { "akinsho/git-conflict.nvim", version = "*", config = true },
}
