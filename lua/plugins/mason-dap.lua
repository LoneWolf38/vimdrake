local plugin = "mason-nvim-dap.nvim"
local Constants = {}

Constants = {
  file_types = {
    "BufEnter *.c",
    "BufEnter *.cpp",
    "BufEnter *.cs",
    "BufEnter *.go",
    "BufEnter *.java",
    "BufEnter *.lua",
    "BufEnter *.rs",
  },
}

return {
  "jay-babu/" .. plugin,
  event = Constants.file_types,
  opts = function(_, opts)
      opts.automatic_setup = true
      opts.ensure_installed = {
        "codelldb",
        "delve",
        "java-debug-adapter",
        "java-test",
      }
  end,
}

