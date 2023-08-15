local plugin = "mason.nvim"

return {
  "williamboman/" .. plugin,
  cmd = "Mason",
  opts = function(_, opts)
    opts.ui = {
      border = "double",
      icons = {
        package_installed = "﫟",
        package_pending = "﫠",
        package_uninstalled = "",
      },
    }
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
