return {
  "scalameta/nvim-metals",
  dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
  config = function()
    local api = vim.api
    ----------------------------------
    -- OPTIONS -----------------------
    ----------------------------------
    -- global
    vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }
    vim.opt_global.shortmess:remove("F")
    vim.opt_global.shortmess:append("c")
    -- LSP Setup ---------------------
    ----------------------------------
    local metals_config = require("metals").bare_config()

    -- Example of settings
    metals_config.settings = {
      showImplicitArguments = true,
      showInferredType = true,
      superMethodLensesEnabled = true,
      showImplicitConversionsAndClasses = true,
    }

    -- *READ THIS*
    -- I *highly* recommend setting statusBarProvider to true, however if you do,
    -- you *have* to have a setting to display this in your statusline or else
    -- you'll not see any messages from metals. There is more info in the help
    -- docs about this
    metals_config.init_options.statusBarProvider = "on"
    metals_config.handlers["textDocument/publishDiagnostics"] =
      vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
          prefix = "",
        },
      })
    -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Debug settings if you're using nvim-dap
    local dap = require("dap")

    dap.configurations.scala = {
      {
        type = "scala",
        request = "launch",
        name = "RunOrTest",
        metals = {
          runType = "runOrTestFile",
          --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
        },
      },
      {
        type = "scala",
        request = "launch",
        name = "Test Target",
        metals = {
          runType = "testTarget",
        },
      },
    }

    metals_config.on_attach = function(client, bufnr)
      require("metals").setup_dap()
    end

    -- Autocmd that will actually be in charging of starting the whole thing
    local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })

    api.nvim_create_autocmd("FileType", {
      -- NOTE: You may or may not want java included here. You will need it if you
      -- want basic Java support but it may also conflict if you are using
      -- something like nvim-jdtls which also works on a java filetype autocmd.
      pattern = { "scala", "sbt", "java" },
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
}
