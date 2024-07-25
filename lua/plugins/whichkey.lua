return {
  'folke/which-key.nvim',
  tag = 'v2.1.0',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 2000
  end,
  opts = {},
}
