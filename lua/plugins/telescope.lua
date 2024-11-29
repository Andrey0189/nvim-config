return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },

  config = function()
    local builtin = require('telescope.builtin')
    require('telescope').setup()

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'find files' })
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'open recent files' })
    vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'find git files' })
    vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'find commands' })
    vim.keymap.set('n', '<leader>fw', function()
      local word = vim.fn.expand('<cword>')
      builtin.grep_string({ search = word })
    end, { desc = 'find word' })

    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'view help' })
  end,
}

