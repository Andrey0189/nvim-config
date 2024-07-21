return {
  'niuiic/code-shot.nvim',
  dependencies = {
    'niuiic/core.nvim',
    'rcarriga/nvim-notify',
  },

  config = function ()
    local code_shot = require('code-shot')
    code_shot.setup({
      ---@return string output file path
      output = function()
        local core = require("core")
        local buf_name = vim.api.nvim_buf_get_name(0)
        return core.file.name(buf_name) .. ".png"
      end,
      ---@return string[]
      -- select_area: {start_line: number, end_line: number} | nil
      options = function(select_area)
        if not select_area then
          return {}
        end
        return {
          "--line-offset",
          select_area.start_line,
          '--theme',
          'Gruvbox'
        }
      end,
    })

    vim.keymap.set('n', '<C-p>', code_shot.shot)
  end
}
