return {
  "aznhe21/actions-preview.nvim",
  config = function()
    require("actions-preview").setup({
      diff = {
        ctxlen = 3,
      },
      backend = { "telescope" },
      telescope = {
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout = {
          width = 0.8,
          height = 0.9,
          prompt_position = "top",
          preview_cutoff = 20,
          preview_height = function(_, _, max_lines)
            return max_lines - 15
          end,
        },
      },
    })
  end,
}
