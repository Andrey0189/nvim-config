return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },

  config = function()
    local builtin = require('telescope.builtin')
    local wk = require('which-key')
    require('telescope').setup()

    wk.register({
      ['<leader>'] = {
        f = {
          name = '+file',
          f = { builtin.find_files, 'find files' },
          r = { builtin.oldfiles, 'open recent files' },
          g = { builtin.git_files, 'find git files' },
          c = { builtin.commands, 'find commands' },
          w = { function()
            local word = vim.fn.expand('<cword>')
            builtin.grep_string({ search = word })
          end, 'find word' },
        },

        ['vh'] = { builtin.help_tags, 'view help'}
      },
    })
  end,
}

