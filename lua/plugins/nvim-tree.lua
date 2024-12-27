return {
  'nvim-tree/nvim-tree.lua',
  enabled = false,
  lazy = true,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {},
  keys = {
    { '<leader>n', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle Neotree'}
  }
}
