local plugin = "mason.nvim"

return {
  "williamboman/" .. plugin,
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr> " }},
  opts = function(_, opts)
      opts.ensure_installed = {
        "bash-language-server",
        "clangd",
        "flake8",
        "gopls",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "rust-analyzer",
        "shellcheck",
        "shfmt",
        "sqlls",
        "stylua",
        "yaml-language-server",
      }
  end,
}

