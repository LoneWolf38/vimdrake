local plugin = "null-ls.nvim"

local M = {

  "jose-elias-alvarez/" .. plugin,
  enabled = true,

  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local hover = null_ls.builtins.hover
    local code_actions = null_ls.builtins.code_actions
    local completion = null_ls.builtins.completion
    null_ls.setup({
      debug = false,
      border = "rounded",
      log_level = "info",
      diagnostics_format = "#{c} #{m} (#{s})",
      sources = {
        code_actions.shellcheck,
        completion.spell,
        completion.tags,
        diagnostics.shellcheck,
        formatting.shfmt,
        formatting.stylua,

        -- go null-ls.lua
        formatting.goimports_reviser,
        formatting.golines,
        code_actions.gomodifytags,
        code_actions.impl,
        code_actions.refactoring,
        formatting.gofumpt,
        -- diagnostics.cspell.with({
        --     {
        --         disabled_filetypes = { "lua" },
        --         filetypes = { "html", "json", "yaml", "markdown" },
        --         extra_args = { "--config ~/.cspell.json" },
        --     },
        -- }),
        -- code_actions.cspell.with({
        --     {
        --         disabled_filetypes = { 'lua' },
        --         filetypes = { 'html', 'json', 'yaml', 'markdown' },
        --         extra_args = { '--config ~/.cspell.json' },
        --     },
        -- }),
      },
    })
  end,
}

return M
