local M = {}
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
function M.find_files()
  local ts = require("telescope.builtin")
  local opts = {
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        -- print(vim.inspect(selection))
        vim.api.nvim_put({ selection[1] }, "", false, true)
      end)
      return true
    end,
  }
  ts.git_branches(opts)
end

return M
