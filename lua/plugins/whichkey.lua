return {
  'folke/which-key.nvim',
  -- priority = 999,
  -- lazy = true,
  -- module = true,
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  -- config = function ()
  --   local wk = require('which-key')
  --   wk.register({
  --     m = {
  --       name = 'test', -- optional group name
  --       g = { '<cmd>echo 'test'<CR>', 'test' }
  --     }
  --   })
  -- end
}
