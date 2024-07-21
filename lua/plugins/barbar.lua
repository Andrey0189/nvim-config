return {
  'romgrk/barbar.nvim',
  enabled = false,
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    animation = true,
    insert_at_start = true,
    auto_hide = true,
    sidebar_filetypes = {
      NvimTree = true,
    }
  },
  config = function ()
    local wk = require('which-key')

    wk.register({
      ['<A-,>'] = { '<cmd>BufferPrevious<CR>', 'Previous buffer' },
      ['<A-.>'] = { '<cmd>BufferNext<CR>', 'Next buffer' },
      ['<A-h>'] = { '<cmd>BufferMovePrevious<CR>', 'Move buffer left' },
      ['<A-l>'] = { '<cmd>BufferMoveNext<CR>', 'Move buffer right' },
      ['<A-c>'] = { '<cmd>BufferClose<CR>', 'Close buffer' },
    })
  end
}

