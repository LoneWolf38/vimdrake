return {
  "ray-x/lsp_signature.nvim",
  config = function()
    require("lsp_signature").setup({
      hint_enable = true,
    })
  end,
}
