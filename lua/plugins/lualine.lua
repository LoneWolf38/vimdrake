return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(plugin)
    if plugin.override then
      require("lazyvim.util").deprecate("lualine.override", "lualine.opts")
    end

    return {
      options = {
        theme = "catppuccin",
        globalstatus = true,
        component_separators = "|",
        section_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = { "filename", "branch" },
        lualine_c = { "fileformat" },
        lualine_x = {},
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
    }
  end,
}
